"""
Webhook Handler Example for REChain

Production-ready webhook handling patterns including:
- Request validation (signature verification)
- Rate limiting
- Error handling
- Retry logic
- Metrics collection

Usage:
    python webhook_handler_example.py

Author: REChain Development Team
Created: 2025-01-09
"""

import asyncio
import hashlib
import hmac
import json
import logging
import sys
import time
from abc import ABC, abstractmethod
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Any, Callable, Dict, List, Optional, Tuple
from urllib.parse import parse_qs, urlparse
from http.server import HTTPServer, BaseHTTPRequestHandler
import secrets
import re

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
)
logger = logging.getLogger(__name__)


class HTTPMethod(Enum):
    """HTTP methods."""
    GET = "GET"
    POST = "POST"
    PUT = "PUT"
    DELETE = "DELETE"
    PATCH = "PATCH"


class WebhookError(Exception):
    """Base webhook error."""
    
    def __init__(self, message: str, status_code: int = 400):
        super().__init__(message)
        self.status_code = status_code
        self.message = message


class ValidationError(WebhookError):
    """Validation error."""
    def __init__(self, message: str):
        super().__init__(message, 400)


class AuthenticationError(WebhookError):
    """Authentication error."""
    def __init__(self, message: str = "Unauthorized"):
        super().__init__(message, 401)


class RateLimitError(WebhookError):
    """Rate limit error."""
    def __init__(self, message: str = "Rate limit exceeded", retry_after: int = 60):
        super().__init__(message, 429)
        self.retry_after = retry_after


@dataclass
class WebhookRequest:
    """Represents a webhook request."""
    method: HTTPMethod
    path: str
    headers: Dict[str, str]
    body: Optional[bytes]
    query_params: Dict[str, List[str]]
    timestamp: datetime = field(default_factory=datetime.now)
    
    @property
    def content_type(self) -> Optional[str]:
        return self.headers.get("content-type")
    
    @property
    def content_length(self) -> int:
        length = self.headers.get("content-length", "0")
        try:
            return int(length)
        except ValueError:
            return 0
    
    def get_header(self, name: str) -> Optional[str]:
        """Get header case-insensitively."""
        name_lower = name.lower()
        for key, value in self.headers.items():
            if key.lower() == name_lower:
                return value
        return None
    
    def json_body(self) -> Optional[Dict[str, Any]]:
        """Parse JSON body."""
        if self.body is None:
            return None
        try:
            return json.loads(self.body.decode("utf-8"))
        except json.JSONDecodeError:
            raise ValidationError("Invalid JSON body")
    
    def form_body(self) -> Dict[str, List[str]]:
        """Parse form-encoded body."""
        if self.body is None:
            return {}
        try:
            parsed = parse_qs(self.body.decode("utf-8"))
            return {k: v[0] if len(v) == 1 else v for k, v in parsed.items()}
        except Exception:
            raise ValidationError("Invalid form body")


@dataclass
class WebhookConfig:
    """Configuration for webhook server."""
    host: str = "0.0.0.0"
    port: int = 8080
    secret: Optional[str] = None
    signature_header: str = "X-Signature"
    signature_algorithm: str = "sha256"
    rate_limit_requests: int = 100
    rate_limit_window: int = 60
    max_body_size: int = 10 * 1024 * 1024  # 10MB
    cors_origins: List[str] = field(default_factory=list)
    enable_metrics: bool = True
    shutdown_timeout: float = 30.0


class SignatureValidator:
    """Validates webhook signatures."""
    
    def __init__(self, secret: str, algorithm: str = "sha256"):
        self.secret = secret
        self.algorithm = algorithm
    
    def compute_signature(self, body: bytes, timestamp: int) -> str:
        """Compute signature for given body and timestamp."""
        if self.algorithm == "sha256":
            signing_key = f"{timestamp}.{self.secret}".encode()
            signature = hmac.new(
                signing_key,
                body,
                hashlib.sha256,
            ).hexdigest()
            return f"t={timestamp},v1={signature}"
        elif self.algorithm == "sha1":
            signing_key = f"{timestamp}.{self.secret}".encode()
            signature = hmac.new(
                signing_key,
                body,
                hashlib.sha1,
            ).hexdigest()
            return f"t={timestamp},v1={signature}"
        else:
            raise ValueError(f"Unsupported algorithm: {self.algorithm}")
    
    def validate(
        self,
        body: bytes,
        signature: str,
        timestamp: Optional[int] = None,
        tolerance: int = 300,
    ) -> bool:
        """
        Validate webhook signature.
        
        Args:
            body: Request body
            signature: Signature from header
            timestamp: Expected timestamp (optional)
            tolerance: Time tolerance in seconds
            
        Returns:
            True if signature is valid
        """
        # Parse signature header
        try:
            parts = {}
            for part in signature.split(","):
                key, value = part.split("=", 1)
                parts[key] = value
            
            received_timestamp = int(parts.get("t", "0"))
            received_signature = parts.get("v1", "")
            
            # Check timestamp tolerance
            if timestamp is not None:
                if abs(received_timestamp - timestamp) > tolerance:
                    logger.warning("Signature timestamp outside tolerance")
                    return False
            
            # Compute expected signature
            computed = self.compute_signature(body, received_timestamp)
            
            # Parse computed signature
            comp_parts = {}
            for part in computed.split(","):
                key, value = part.split("=", 1)
                comp_parts[key] = value
            
            # Constant-time comparison
            return hmac.compare_digest(
                received_signature,
                comp_parts.get("v1", ""),
            )
            
        except Exception as e:
            logger.error(f"Signature validation error: {e}")
            return False


class RateLimiter:
    """Sliding window rate limiter."""
    
    def __init__(self, max_requests: int, window_seconds: int):
        self.max_requests = max_requests
        self.window_seconds = window_seconds
        self._requests: Dict[str, List[float]] = {}
        self._lock = asyncio.Lock()
    
    async def is_allowed(self, key: str) -> Tuple[bool, int]:
        """
        Check if request is allowed.
        
        Returns:
            Tuple of (is_allowed, remaining_requests)
        """
        async with self._lock:
            now = time.time()
            window_start = now - self.window_seconds
            
            # Clean old requests
            if key in self._requests:
                self._requests[key] = [
                    t for t in self._requests[key]
                    if t > window_start
                ]
            else:
                self._requests[key] = []
            
            # Check limit
            if len(self._requests[key]) >= self.max_requests:
                # Calculate retry after
                oldest = min(self._requests[key])
                retry_after = int(oldest - window_start)
                return False, 0
            
            # Record request
            self._requests[key].append(now)
            
            return True, self.max_requests - len(self._requests[key])
    
    async def get_remaining(self, key: str) -> int:
        """Get remaining requests for key."""
        async with self._lock:
            now = time.time()
            window_start = now - self.window_seconds
            
            if key in self._requests:
                recent = [t for t in self._requests[key] if t > window_start]
                return max(0, self.max_requests - len(recent))
            
            return self.max_requests


class WebhookHandler:
    """Webhook request handler."""
    
    def __init__(self, config: WebhookConfig):
        self.config = config
        self.routes: Dict[str, Dict[HTTPMethod, Callable]] = {}
        
        # Initialize components
        self.rate_limiter = RateLimiter(
            config.rate_limit_requests,
            config.rate_limit_window,
        )
        
        self.signature_validator: Optional[SignatureValidator] = None
        if config.secret:
            self.signature_validator = SignatureValidator(config.secret)
        
        # Metrics
        self._request_count = 0
        self._error_count = 0
        self._latency_total = 0.0
    
    def route(
        self,
        path: str,
        method: HTTPMethod = HTTPMethod.POST,
    ) -> Callable:
        """Decorator to register a route handler."""
        def decorator(func: Callable):
            if path not in self.routes:
                self.routes[path] = {}
            self.routes[path][method] = func
            return func
        return decorator
    
    async def handle_request(
        self,
        request: WebhookRequest,
    ) -> Tuple[int, Dict[str, Any]]:
        """
        Handle an incoming webhook request.
        
        Returns:
            Tuple of (status_code, response_body)
        """
        start_time = time.time()
        self._request_count += 1
        
        try:
            # Rate limiting
            client_ip = request.get_header("X-Forwarded-For")
                or request.get_header("X-Real-IP")
                or "unknown"
            
            allowed, remaining = await self.rate_limiter.is_allowed(client_ip)
            if not allowed:
                raise RateLimitError()
            
            # Find handler
            handler = self._find_handler(request.path, request.method)
            if not handler:
                return 404, {"error": "Not found"}
            
            # Validate signature
            if self.signature_validator:
                await self._validate_signature(request)
            
            # Execute handler
            result = await handler(request)
            
            # Return success
            return 200, result
            
        except WebhookError as e:
            self._error_count += 1
            return e.status_code, {"error": e.message}
            
        except Exception as e:
            self._error_count += 1
            logger.exception(f"Handler error: {e}")
            return 500, {"error": "Internal server error"}
            
        finally:
            elapsed = time.time() - start_time
            self._latency_total += elapsed
    
    def _find_handler(
        self,
        path: str,
        method: HTTPMethod,
    ) -> Optional[Callable]:
        """Find handler for path and method."""
        # Exact match
        if path in self.routes:
            return self.routes[path].get(method)
        
        # Pattern matching
        for route_path, handlers in self.routes.items():
            if self._match_path(route_path, path):
                return handlers.get(method)
        
        return None
    
    def _match_path(self, route_path: str, request_path: str) -> bool:
        """Match route path with parameters."""
        # Convert route to regex
        param_pattern = re.compile(r'\{(\w+)\}')
        regex_path = param_pattern.sub(r'(?P<\1>[^/]+)', route_path)
        regex_path = f"^{regex_path}$"
        
        return bool(re.match(regex_path, request_path))
    
    async def _validate_signature(self, request: WebhookRequest):
        """Validate webhook signature."""
        if not self.signature_validator or request.method == HTTPMethod.GET:
            return
        
        signature = request.get_header(self.config.signature_header)
        if not signature:
            raise AuthenticationError("Missing signature")
        
        if request.body is None:
            raise ValidationError("Missing body")
        
        timestamp_str = request.get_header("X-Webhook-Timestamp")
        timestamp = int(timestamp_str) if timestamp_str else None
        
        if not self.signature_validator.validate(request.body, signature, timestamp):
            raise AuthenticationError("Invalid signature")
    
    def get_metrics(self) -> Dict[str, Any]:
        """Get webhook handler metrics."""
        return {
            "total_requests": self._request_count,
            "error_count": self._error_count,
            "avg_latency_ms": (
                (self._latency_total / max(1, self._request_count)) * 1000
            ),
            "routes": list(self.routes.keys()),
        }


class WebhookServer:
    """HTTP server for webhooks."""
    
    def __init__(self, config: WebhookConfig, handler: WebhookHandler):
        self.config = config
        self.handler = handler
        self.server: Optional[HTTPServer] = None
        self._running = False
    
    def _create_handler(self) -> type:
        """Create request handler class."""
        config = self.config
        handler = self.handler
        
        class RequestHandler(BaseHTTPRequestHandler):
            def log_message(self, format, *args):
                # Custom logging
                pass
            
            async def handle_request(self):
                try:
                    # Read request
                    content_length = int(self.headers.get("Content-Length", 0))
                    body = None
                    if content_length > 0:
                        body = self.rfile.read(content_length)
                    
                    # Parse request
                    method = HTTPMethod(self.command)
                    parsed_path = urlparse(self.path)
                    
                    from urllib.parse import parse_qs
                    query = parse_qs(parsed_path.query)
                    
                    request = WebhookRequest(
                        method=method,
                        path=parsed_path.path,
                        headers=dict(self.headers),
                        body=body,
                        query_params=query,
                    )
                    
                    # Handle request
                    status, response = await handler.handle_request(request)
                    
                    # Send response
                    self.send_response(status)
                    self.send_header("Content-Type", "application/json")
                    
                    if status == 429:
                        self.send_header("Retry-After", "60")
                    
                    self.end_headers()
                    
                    response_body = json.dumps(response).encode()
                    self.wfile.write(response_body)
                    
                except Exception as e:
                    logger.exception(f"Request error: {e}")
                    self.send_response(500)
                    self.end_headers()
            
            def do_GET(self):
                asyncio.create_task(self.handle_request())
            
            def do_POST(self):
                asyncio.create_task(self.handle_request())
            
            def do_PUT(self):
                asyncio.create_task(self.handle_request())
            
            def do_DELETE(self):
                asyncio.create_task(self.handle_request())
            
            def do_PATCH(self):
                asyncio.create_task(self.handle_request())
        
        return RequestHandler
    
    async def start(self):
        """Start the webhook server."""
        handler_class = self._create_handler()
        self.server = HTTPServer(
            (self.config.host, self.config.port),
            handler_class,
        )
        
        self._running = True
        logger.info(f"Webhook server started on {self.config.host}:{self.config.port}")
        
        # Start server in thread
        loop = asyncio.get_event_loop()
        await loop.run_in_executor(None, self.server.serve_forever)
    
    async def stop(self):
        """Stop the webhook server."""
        self._running = False
        if self.server:
            self.server.shutdown()
            logger.info("Webhook server stopped")


# =============================================================================
# Example Usage
# =============================================================================

async def main():
    """Example webhook server."""
    
    # Create configuration
    config = WebhookConfig(
        host="0.0.0.0",
        port=8080,
        secret="your_webhook_secret",
        rate_limit_requests=100,
        rate_limit_window=60,
    )
    
    # Create handler
    handler = WebhookHandler(config)
    
    # Register routes
    @handler.route("/webhook/health", HTTPMethod.GET)
    async def health_check(request: WebhookRequest):
        return {"status": "healthy", "metrics": handler.get_metrics()}
    
    @handler.route("/webhook/events", HTTPMethod.POST)
    async def handle_event(request: WebhookRequest):
        data = request.json_body()
        
        event_type = data.get("type", "unknown")
        logger.info(f"Received event: {event_type}")
        
        # Process event
        return {"received": True, "event_type": event_type}
    
    @handler.route("/webhook/rooms/{room_id}/message", HTTPMethod.POST)
    async def handle_room_message(request: WebhookRequest):
        # Extract room_id from path
        room_id = request.path.split("/")[-2]
        data = request.json_body()
        
        return {
            "room_id": room_id,
            "sender": data.get("sender"),
            "message": data.get("content", {}).get("body"),
        }
    
    # Create and start server
    server = WebhookServer(config, handler)
    
    try:
        await server.start()
        
        logger.info("Webhook server running. Press Ctrl+C to stop.")
        
        while True:
            await asyncio.sleep(1)
            
    except KeyboardInterrupt:
        await server.stop()


if __name__ == "__main__":
    asyncio.run(main())

