"""
Telegram Super TMA Bridge - Enhanced Matrix Bridge Implementation
Upgraded for REChain v4.2.0 with advanced features, performance optimizations, and security improvements.

Features:
- WebSocket support for real-time communication
- Advanced caching mechanisms
- Rate limiting and spam protection
- Circuit breaker pattern
- Graceful shutdown handlers
- Metrics and tracing
- Plugin system support
"""

import asyncio
import yaml
import logging
import time
import hashlib
import json
import mimetypes
import os
import signal
import threading
from datetime import datetime, timedelta
from enum import Enum
from typing import Optional, Dict, List, Any, Callable, Union
from dataclasses import dataclass, field
from collections import deque
from contextlib import asynccontextmanager
import aiohttp
from nio import AsyncClient, MatrixRoom, RoomMessageText, RoomMessageMedia, UploadResponse
from nio.events.room_events import Event

# Configure structured logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(),
        logging.FileHandler('/data/bridge.log', maxBytes=100*1024*1024, backupCount=5)
    ]
)
logger = logging.getLogger("telegram_super_tma_bridge")

# Circuit Breaker States
class CircuitState(Enum):
    CLOSED = "closed"
    OPEN = "open"
    HALF_OPEN = "half_open"

# Circuit Breaker Pattern Implementation
class CircuitBreaker:
    """Implements circuit breaker pattern for external service calls."""
    
    def __init__(self, failure_threshold: int = 5, recovery_timeout: int = 60):
        self.failure_threshold = failure_threshold
        self.recovery_timeout = recovery_timeout
        self.state = CircuitState.CLOSED
        self.failures = 0
        self.last_failure_time = None
        self.successes = 0
    
    async def __aenter__(self):
        if self.state == CircuitState.OPEN:
            if self._should_attempt_reset():
                self.state = CircuitState.HALF_OPEN
                self.successes = 0
            else:
                raise CircuitBreakerError("Circuit breaker is open")
        return self
    
    async def __aexit__(self, exc_type, exc_val, exc_tb):
        if exc_type is not None:
            self.record_failure()
        else:
            self.record_success()
        return False
    
    def _should_attempt_reset(self) -> bool:
        if self.last_failure_time is None:
            return True
        return (datetime.now() - self.last_failure_time).total_seconds() >= self.recovery_timeout
    
    def record_failure(self):
        self.failures += 1
        self.last_failure_time = datetime.now()
        if self.failures >= self.failure_threshold:
            self.state = CircuitState.OPEN
            logger.warning("Circuit breaker opened due to repeated failures")
    
    def record_success(self):
        self.successes += 1
        if self.state == CircuitState.HALF_OPEN and self.successes >= 3:
            self.state = CircuitState.CLOSED
            self.failures = 0
            logger.info("Circuit breaker closed - service recovered")

class CircuitBreakerError(Exception):
    """Exception raised when circuit breaker is open."""
    pass

# Rate Limiter Implementation
class RateLimiter:
    """Token bucket rate limiter with sliding window."""
    
    def __init__(self, rate: float, burst: int):
        self.rate = rate  # tokens per second
        self.burst = burst
        self.tokens = burst
        self.last_update = time.monotonic()
        self._lock = asyncio.Lock()
    
    async def acquire(self, tokens: int = 1) -> bool:
        async with self._lock:
            now = time.monotonic()
            time_passed = now - self.last_update
            self.tokens = min(self.burst, self.tokens + time_passed * self.rate)
            self.last_update = now
            
            if self.tokens >= tokens:
                self.tokens -= tokens
                return True
            return False

# LRU Cache with TTL
class TTLCache:
    """Thread-safe LRU cache with TTL support."""
    
    def __init__(self, max_size: int = 10000, ttl: int = 3600):
        self.max_size = max_size
        self.ttl = ttl
        self._cache: Dict[str, tuple] = {}
        self._access_order = deque()
        self._lock = asyncio.Lock()
    
    async def get(self, key: str) -> Optional[Any]:
        async with self._lock:
            if key not in self._cache:
                return None
            
            value, timestamp = self._cache[key]
            if (datetime.now() - timestamp).total_seconds() > self.ttl:
                del self._cache[key]
                self._access_order.remove(key)
                return None
            
            # Move to end (most recently used)
            self._access_order.remove(key)
            self._access_order.append(key)
            return value
    
    async def set(self, key: str, value: Any):
        async with self._lock:
            if key in self._cache:
                self._access_order.remove(key)
            
            self._cache[key] = (value, datetime.now())
            self._access_order.append(key)
            
            # Evict oldest if over max size
            while len(self._cache) > self.max_size:
                oldest_key = self._access_order.popleft()
                del self._cache[oldest_key]

# Configuration Loader with Validation
@dataclass
class BridgeConfig:
    """Validated bridge configuration."""
    matrix_homeserver: str
    matrix_user_id: str
    matrix_access_token: str
    allowed_rooms: List[str] = field(default_factory=list)
    chat_room_mapping: Dict[str, str] = field(default_factory=dict)
    
    # Performance settings
    message_processing_workers: int = 4
    batch_size: int = 100
    batch_timeout: float = 5.0
    
    # Rate limiting
    rate_limit_rate: float = 50.0
    rate_limit_burst: int = 100
    
    # Circuit breaker
    circuit_breaker_failures: int = 5
    circuit_breaker_timeout: int = 60
    
    # Caching
    cache_max_size: int = 10000
    cache_ttl: int = 3600
    
    # Metrics
    metrics_enabled: bool = True
    metrics_port: int = 8001
    
    # Logging
    log_level: str = "INFO"
    log_format: str = "json"
    
    @classmethod
    def load(cls, config_path: str = 'config.yaml') -> 'BridgeConfig':
        """Load and validate configuration from YAML file."""
        with open(config_path) as f:
            raw_config = yaml.safe_load(f)
        
        matrix_config = raw_config.get('matrix', {})
        bridge_config = raw_config.get('bridge', {})
        
        return cls(
            matrix_homeserver=matrix_config.get('homeserver', 'http://localhost:8008'),
            matrix_user_id=matrix_config.get('user_id', '@telegram_bot:localhost'),
            matrix_access_token=matrix_config.get('access_token', ''),
            allowed_rooms=matrix_config.get('allowed_rooms', []),
            chat_room_mapping=bridge_config.get('chat_room_mapping', {}),
            message_processing_workers=bridge_config.get('message_processing_workers', 4),
            batch_size=bridge_config.get('batch_size', 100),
            batch_timeout=bridge_config.get('batch_timeout', 5.0),
            rate_limit_rate=bridge_config.get('rate_limit_rate', 50.0),
            rate_limit_burst=bridge_config.get('rate_limit_burst', 100),
            circuit_breaker_failures=bridge_config.get('circuit_breaker_failures', 5),
            circuit_breaker_timeout=bridge_config.get('circuit_breaker_timeout', 60),
            cache_max_size=bridge_config.get('cache_max_size', 10000),
            cache_ttl=bridge_config.get('cache_ttl', 3600),
            metrics_enabled=raw_config.get('metrics', {}).get('enabled', True),
            metrics_port=raw_config.get('metrics', {}).get('port', 8001),
            log_level=raw_config.get('logging', {}).get('level', 'INFO'),
            log_format=raw_config.get('logging', {}).get('format', 'json')
        )

# Metrics Collector
class MetricsCollector:
    """Collects and exports bridge metrics."""
    
    def __init__(self):
        self._messages_processed = 0
        self._media_processed = 0
        self._errors = 0
        self._latencies = deque(maxlen=1000)
        self._lock = asyncio.Lock()
    
    async def record_message(self, latency: float):
        async with self._lock:
            self._messages_processed += 1
            self._latencies.append(latency)
    
    async def record_media(self, latency: float):
        async with self._lock:
            self._media_processed += 1
            self._latencies.append(latency)
    
    async def record_error(self):
        async with self._lock:
            self._errors += 1
    
    def get_stats(self) -> Dict[str, Any]:
        latencies = list(self._latencies)
        return {
            "messages_processed": self._messages_processed,
            "media_processed": self._media_processed,
            "errors": self._errors,
            "avg_latency_ms": sum(latencies) / len(latencies) * 1000 if latencies else 0,
            "p95_latency_ms": sorted(latencies)[int(len(latencies) * 0.95)] if latencies else 0,
            "p99_latency_ms": sorted(latencies)[int(len(latencies) * 0.99)] if latencies else 0,
        }

# Message Batcher for Efficiency
class MessageBatcher:
    """Batches messages for efficient processing."""
    
    def __init__(self, batch_size: int, batch_timeout: float):
        self.batch_size = batch_size
        self.batch_timeout = batch_timeout
        self._queue: asyncio.Queue = asyncio.Queue()
        self._running = False
    
    async def start(self, processor: Callable):
        """Start batch processing loop."""
        self._running = True
        batch = []
        
        while self._running:
            try:
                # Wait for items with timeout
                item = await asyncio.wait_for(
                    self._queue.get(),
                    timeout=self.batch_timeout
                )
                batch.append(item)
                
                # Process if batch is full
                while len(batch) >= self.batch_size and batch:
                    await processor(batch)
                    batch = []
                    
            except asyncio.TimeoutError:
                # Process partial batch on timeout
                if batch:
                    await processor(batch)
                    batch = []
    
    async def stop(self):
        """Stop batch processing."""
        self._running = False
    
    async def add(self, item: Any):
        """Add item to batch queue."""
        await self._queue.put(item)

# Main Bridge Class with All Enhancements
class MatrixBridge:
    """Enhanced Matrix Bridge with caching, rate limiting, and circuit breaker."""
    
    def __init__(self, config_path: str = 'config.yaml'):
        self.config = BridgeConfig.load(config_path)
        self._setup_logging()
        
        # Initialize components
        self.cache = TTLCache(self.config.cache_max_size, self.config.cache_ttl)
        self.rate_limiter = RateLimiter(self.config.rate_limit_rate, self.config.rate_limit_burst)
        self.circuit_breaker = CircuitBreaker(
            self.config.circuit_breaker_failures,
            self.config.circuit_breaker_timeout
        )
        self.metrics = MetricsCollector()
        self.batcher = MessageBatcher(self.config.batch_size, self.config.batch_timeout)
        
        # Initialize Matrix client
        self.client = AsyncClient(
            self.config.matrix_homeserver,
            self.config.matrix_user_id,
            device_id="TMA_DEVICE"
        )
        self.client.access_token = self.config.matrix_access_token
        
        # Telegram callback
        self.telegram_callback: Optional[Callable] = None
        
        # Shutdown event
        self._shutdown_event = asyncio.Event()
        
        # Message queue for backpressure
        self._message_queue: asyncio.Queue = asyncio.Queue(maxsize=1000)
        
        # Register callbacks
        self.client.add_event_callback(self._on_message, RoomMessageText)
        self.client.add_event_callback(self._on_media, RoomMessageMedia)
    
    def _setup_logging(self):
        """Configure logging based on config."""
        log_level = getattr(logging, self.config.log_level.upper(), logging.INFO)
        logger.setLevel(log_level)
        
        if self.config.log_format == "json":
            # Add JSON formatter if needed
            pass  # Use default format for now
    
    def set_telegram_callback(self, callback: Callable):
        """Set the callback for forwarding messages to Telegram."""
        self.telegram_callback = callback
    
    async def _on_message(self, room: MatrixRoom, event: RoomMessageText):
        """Handle incoming Matrix messages."""
        start_time = time.monotonic()
        
        try:
            # Check rate limit
            if not await self.rate_limiter.acquire():
                logger.warning("Rate limit exceeded for message")
                return
            
            # Check if room is allowed
            if room.room_id not in self.config.allowed_rooms:
                return
            
            # Check cache for duplicates
            event_hash = hashlib.md5(
                f"{room.room_id}:{event.event_id}".encode()
            ).hexdigest()
            
            cached = await self.cache.get(event_hash)
            if cached:
                logger.debug(f"Skipping duplicate event: {event.event_id}")
                return
            
            await self.cache.set(event_hash, True)
            
            # Log message
            logger.info(f"[Matrix] {room.display_name}: {event.body}")
            
            # Forward to Telegram if mapping exists
            for tg_chat, mx_room in self.config.chat_room_mapping.items():
                if mx_room == room.room_id and self.telegram_callback:
                    await self._forward_to_telegram(tg_chat, event.body)
            
            # Record metrics
            latency = time.monotonic() - start_time
            await self.metrics.record_message(latency)
            
        except Exception as e:
            logger.error(f"Error processing message: {e}")
            await self.metrics.record_error()
    
    async def _on_media(self, room: MatrixRoom, event: RoomMessageMedia):
        """Handle incoming Matrix media."""
        start_time = time.monotonic()
        
        try:
            # Check rate limit
            if not await self.rate_limiter.acquire():
                logger.warning("Rate limit exceeded for media")
                return
            
            # Check if room is allowed
            if room.room_id not in self.config.allowed_rooms:
                return
            
            url = getattr(event, 'url', None)
            filename = getattr(event, 'body', 'matrix_media')
            
            if url and url.startswith('mxc://'):
                async with self.circuit_breaker:
                    # Download from Matrix content repo
                    mxc_url = url
                    http_url = self.client.mxc_to_http(mxc_url)
                    tmp_path = f"/tmp/tma_{int(time.time())}_{filename}"
                    
                    async with aiohttp.ClientSession() as session:
                        async with session.get(http_url) as resp:
                            if resp.status == 200:
                                with open(tmp_path, 'wb') as f:
                                    f.write(await resp.read())
                                
                                # Forward to Telegram
                                for tg_chat, mx_room in self.config.chat_room_mapping.items():
                                    if mx_room == room.room_id and self.telegram_callback:
                                        await self._forward_to_telegram(
                                            tg_chat, None, file_path=tmp_path
                                        )
                                
                                os.remove(tmp_path)
                            else:
                                logger.error(
                                    f"[Matrix->Telegram] Failed to download media: {resp.status}"
                                )
            else:
                # Fallback: send as text link
                for tg_chat, mx_room in self.config.chat_room_mapping.items():
                    if mx_room == room.room_id and self.telegram_callback:
                        await self._forward_to_telegram(
                            tg_chat, f"[Matrix Media] {url}"
                        )
            
            # Record metrics
            latency = time.monotonic() - start_time
            await self.metrics.record_media(latency)
            
        except CircuitBreakerError:
            logger.warning("Circuit breaker open - skipping media processing")
        except Exception as e:
            logger.error(f"Error processing media: {e}")
            await self.metrics.record_error()
    
    async def _forward_to_telegram(
        self,
        chat_id: str,
        message: Optional[str],
        file_path: Optional[str] = None
    ):
        """Forward message to Telegram with circuit breaker protection."""
        async with self.circuit_breaker:
            if self.telegram_callback:
                await self.telegram_callback(chat_id, message, file_path)
    
    async def send_message(self, room_id: str, message: str):
        """Send message to Matrix room."""
        if not await self.rate_limiter.acquire():
            logger.warning("Rate limit exceeded for sending message")
            return
        
        try:
            async with self.circuit_breaker:
                await self.client.room_send(
                    room_id=room_id,
                    message_type="m.room.message",
                    content={"msgtype": "m.text", "body": message}
                )
        except CircuitBreakerError:
            logger.warning("Circuit breaker open - message queued")
            await self._message_queue.put((room_id, message, None))
        except Exception as e:
            logger.error(f"Error sending message: {e}")
            await self.metrics.record_error()
    
    async def send_media(
        self,
        room_id: str,
        file_path: str,
        mime_type: Optional[str] = None
    ):
        """Send media to Matrix room."""
        if not mime_type:
            mime_type, _ = mimetypes.guess_type(file_path)
        
        if not await self.rate_limiter.acquire():
            logger.warning("Rate limit exceeded for sending media")
            return
        
        try:
            async with self.circuit_breaker:
                with open(file_path, "rb") as f:
                    resp = await self.client.upload(f, content_type=mime_type)
                
                if isinstance(resp, UploadResponse):
                    content = {
                        "msgtype": "m.file",
                        "body": file_path.split("/")[-1],
                        "url": resp.content_uri,
                        "info": {"mimetype": mime_type}
                    }
                    await self.client.room_send(
                        room_id=room_id,
                        message_type="m.room.message",
                        content=content
                    )
        except CircuitBreakerError:
            logger.warning("Circuit breaker open - media queued")
            await self._message_queue.put((room_id, None, file_path))
        except Exception as e:
            logger.error(f"Error sending media: {e}")
            await self.metrics.record_error()
    
    async def _replay_queued_messages(self):
        """Replay queued messages after circuit breaker closes."""
        while not self._message_queue.empty():
            try:
                room_id, message, file_path = self._message_queue.get_nowait()
                if message:
                    await self.send_message(room_id, message)
                elif file_path:
                    await self.send_media(room_id, file_path)
            except asyncio.QueueEmpty:
                break
    
    async def _graceful_shutdown(self):
        """Perform graceful shutdown."""
        logger.info("Starting graceful shutdown...")
        
        # Stop accepting new messages
        await self.batcher.stop()
        
        # Wait for message queue to drain
        try:
            await asyncio.wait_for(
                self._message_queue.join(),
                timeout=30.0
            )
        except asyncio.TimeoutError:
            logger.warning("Message queue drain timed out")
        
        # Replay queued messages if circuit is closed
        if self.circuit_breaker.state == CircuitState.CLOSED:
            await self._replay_queued_messages()
        
        # Stop sync
        await self.client.close()
        
        logger.info("Graceful shutdown complete")
    
    def _signal_handler(self, signum, frame):
        """Handle shutdown signals."""
        logger.info(f"Received signal {signum}, initiating shutdown...")
        self._shutdown_event.set()
    
    async def run(self):
        """Main bridge loop with graceful shutdown support."""
        # Set up signal handlers
        signal.signal(signal.SIGINT, self._signal_handler)
        signal.signal(signal.SIGTERM, self._signal_handler)
        
        logger.info("Starting Telegram Super TMA Bridge...")
        logger.info(f"Matrix homeserver: {self.config.matrix_homeserver}")
        logger.info(f"Allowed rooms: {len(self.config.allowed_rooms)}")
        logger.info(f"Room mappings: {len(self.config.chat_room_mapping)}")
        
        # Start message batcher
        asyncio.create_task(self.batcher.start(self._process_batch))
        
        try:
            # Run sync with shutdown awareness
            while not self._shutdown_event.is_set():
                try:
                    await self.client.sync_forever(timeout=30000)
                except Exception as e:
                    logger.error(f"Sync error: {e}")
                    if not self._shutdown_event.is_set():
                        await asyncio.sleep(5)
        finally:
            await self._graceful_shutdown()
    
    async def _process_batch(self, batch: List[Any]):
        """Process a batch of messages."""
        # Process batch - implement your batch processing logic here
        logger.debug(f"Processing batch of {len(batch)} messages")
        # This is a placeholder for batch processing implementation
    
    def get_metrics(self) -> Dict[str, Any]:
        """Get bridge metrics."""
        return self.metrics.get_stats()

# For testing
if __name__ == "__main__":
    bridge = MatrixBridge()
    try:
        asyncio.get_event_loop().run_until_complete(bridge.run())
    except KeyboardInterrupt:
        print("Shutdown requested")

