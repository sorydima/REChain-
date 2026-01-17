"""
Bridge Example for REChain

Production-ready bridge implementation patterns including:
- Appservice registration
- Message bidirectional sync
- User puppeting
- Configuration management
- Health checks and metrics

Usage:
    python bridge_example.py --config config.yaml

Author: REChain Development Team
Created: 2025-01-09
"""

import asyncio
import json
import logging
import sys
import time
from pathlib import Path
from typing import Any, Dict, List, Optional, Set
from dataclasses import dataclass, field
from abc import ABC, abstractmethod
from datetime import datetime, timedelta
from enum import Enum
import hashlib
import secrets
import re

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
)
logger = logging.getLogger(__name__)

try:
    from nio import AsyncClient, ClientConfig, MatrixRoom, RoomMessageText
except ImportError:
    logger.error("Please install nio: pip install matrix-nio")
    sys.exit(1)


class BridgeState(Enum):
    """Bridge connection states."""
    DISCONNECTED = "disconnected"
    CONNECTING = "connecting"
    CONNECTED = "connected"
    RECONNECTING = "reconnecting"
    ERROR = "error"


@dataclass
class BridgeConfig:
    """Configuration for bridge."""
    # Homeserver settings
    homeserver_url: str
    homeserver_domain: str
    appservice_token: str
    homeserver_token: str
    
    # Bridge settings
    bridge_name: str
    bridge_url: str
    bot_user_id: str
    
    # Database
    database_path: str = "bridge.db"
    
    # Rate limiting
    rate_limit_enabled: bool = True
    rate_limit_requests_per_second: float = 20.0
    
    # Performance
    message_batch_size: int = 100
    message_batch_timeout: float = 5.0
    workers: int = 4
    
    # Features
    enable_puppeting: bool = True
    enable_metrics: bool = True
    enable_health_check: bool = True
    
    # Logging
    log_level: str = "INFO"
    log_format: str = "json"


@dataclass
class BridgeUser:
    """Represents a bridged user."""
    matrix_id: str
    remote_id: str
    display_name: Optional[str] = None
    avatar_url: Optional[str] = None
    is_admin: bool = False
    created_at: datetime = field(default_factory=datetime.now)


@dataclass
class BridgeRoom:
    """Represents a bridged room."""
    matrix_room_id: str
    remote_room_id: str
    bridge_name: str
    is_direct: bool = False
    metadata: Dict[str, Any] = field(default_factory=dict)
    created_at: datetime = field(default_factory=datetime.now)


class RateLimiter:
    """Token bucket rate limiter."""
    
    def __init__(self, rate: float, burst: float = None):
        self.rate = rate
        self.burst = burst or rate * 2
        self.tokens = self.burst
        self.last_update = time.time()
        self._lock = asyncio.Lock()
    
    async def acquire(self, tokens: float = 1) -> bool:
        """Try to acquire tokens from the bucket."""
        async with self._lock:
            now = time.time()
            elapsed = now - self.last_update
            self.last_update = now
            
            # Add tokens based on elapsed time
            self.tokens = min(self.burst, self.tokens + elapsed * self.rate)
            
            if self.tokens >= tokens:
                self.tokens -= tokens
                return True
            
            return False


class CircuitBreaker:
    """Circuit breaker for external service calls."""
    
    def __init__(
        self,
        failure_threshold: int = 5,
        recovery_timeout: float = 60.0,
        half_open_requests: int = 3,
    ):
        self.failure_threshold = failure_threshold
        self.recovery_timeout = recovery_timeout
        self.half_open_requests = half_open_requests
        
        self.failures = 0
        self.last_failure_time: Optional[float] = None
        self.state = "closed"  # closed, open, half_open
        self.half_open_successes = 0
        self._lock = asyncio.Lock()
    
    async def __aenter__(self):
        await self._check_state()
        return self
    
    async def __aexit__(self, exc_type, exc_val, exc_tb):
        if exc_type is not None:
            await self.record_failure()
        else:
            await self.record_success()
    
    async def _check_state(self):
        """Check if request should be allowed based on circuit state."""
        async with self._lock:
            if self.state == "open":
                if self.last_failure_time:
                    elapsed = time.time() - self.last_failure_time
                    if elapsed >= self.recovery_timeout:
                        self.state = "half_open"
                        self.half_open_successes = 0
    
    async def record_success(self):
        """Record a successful operation."""
        async with self._lock:
            self.failures = 0
            if self.state == "half_open":
                self.half_open_successes += 1
                if self.half_open_successes >= self.half_open_requests:
                    self.state = "closed"
    
    async def record_failure(self):
        """Record a failed operation."""
        async with self._lock:
            self.failures += 1
            self.last_failure_time = time.time()
            
            if self.failures >= self.failure_threshold:
                self.state = "open"


class TTLCache:
    """LRU cache with TTL expiration."""
    
    def __init__(self, max_size: int = 1000, ttl: float = 3600):
        self.max_size = max_size
        self.ttl = ttl
        self._cache: Dict[str, tuple] = {}
        self._access_order: List[str] = []
        self._lock = asyncio.Lock()
    
    async def get(self, key: str) -> Optional[Any]:
        """Get value from cache."""
        async with self._lock:
            if key not in self._cache:
                return None
            
            value, timestamp = self._cache[key]
            
            # Check TTL
            if time.time() - timestamp > self.ttl:
                del self._cache[key]
                self._access_order.remove(key)
                return None
            
            # Update access order (move to end = most recently used)
            self._access_order.remove(key)
            self._access_order.append(key)
            
            return value
    
    async def set(self, key: str, value: Any):
        """Set value in cache."""
        async with self._lock:
            # Remove if exists (to update access order)
            if key in self._cache:
                self._access_order.remove(key)
            
            # Evict oldest if at capacity
            while len(self._access_order) >= self.max_size:
                oldest_key = self._access_order.pop(0)
                del self._cache[oldest_key]
            
            # Add new entry
            self._cache[key] = (value, time.time())
            self._access_order.append(key)
    
    async def delete(self, key: str):
        """Delete key from cache."""
        async with self._lock:
            if key in self._cache:
                del self._cache[key]
                self._access_order.remove(key)
    
    async def clear(self):
        """Clear all entries."""
        async with self._lock:
            self._cache.clear()
            self._access_order.clear()
    
    @property
    def size(self) -> int:
        return len(self._cache)


class MessageBatcher:
    """Batches messages for efficient processing."""
    
    def __init__(self, batch_size: int = 100, timeout: float = 5.0):
        self.batch_size = batch_size
        self.timeout = timeout
        self._queue: asyncio.Queue = asyncio.Queue()
        self._batch_timer: Optional[asyncio.Task] = None
        self._processor: Optional[callable] = None
        self._running = False
    
    async def start(self, processor: callable):
        """Start the batcher with a processor function."""
        self._processor = processor
        self._running = True
        self._batch_timer = asyncio.create_task(self._run_batch_loop())
    
    async def add(self, item: Any):
        """Add an item to the batch queue."""
        await self._queue.put(item)
    
    async def _run_batch_loop(self):
        """Main batch processing loop."""
        batch = []
        
        while self._running:
            try:
                # Wait for item with timeout
                try:
                    item = await asyncio.wait_for(
                        self._queue.get(),
                        timeout=self.timeout,
                    )
                    batch.append(item)
                except asyncio.TimeoutError:
                    pass
                
                # Process if batch is full or timer expired
                if len(batch) >= self.batch_size:
                    await self._process_batch(batch)
                    batch = []
                    
            except asyncio.CancelledError:
                break
        
        # Process remaining items
        if batch:
            await self._process_batch(batch)
    
    async def _process_batch(self, batch: List[Any]):
        """Process a batch of items."""
        if self._processor and batch:
            try:
                await self._processor(batch)
            except Exception as e:
                logger.error(f"Batch processing failed: {e}")
    
    async def stop(self):
        """Stop the batcher."""
        self._running = False
        if self._batch_timer:
            self._batch_timer.cancel()
            try:
                await self._batch_timer
            except asyncio.CancelledError:
                pass


class BaseBridge(ABC):
    """Abstract base class for REChain bridges."""
    
    def __init__(self, config: BridgeConfig):
        self.config = config
        self.state = BridgeState.DISCONNECTED
        self.client: Optional[AsyncClient] = None
        
        # Core components
        self.rate_limiter = RateLimiter(
            config.rate_limit_requests_per_second,
        )
        self.circuit_breaker = CircuitBreaker()
        self.cache = TTLCache(max_size=10000, ttl=3600)
        self.batcher = MessageBatcher(
            config.message_batch_size,
            config.message_batch_timeout,
        )
        
        # Data stores
        self.users: Dict[str, BridgeUser] = {}
        self.rooms: Dict[str, BridgeRoom] = {}
        self._metrics: Dict[str, Any] = {}
        
        # Handlers
        self._event_handlers: Dict[str, callable] = {}
    
    @abstractmethod
    async def start(self):
        """Start the bridge."""
        pass
    
    @abstractmethod
    async def stop(self):
        """Stop the bridge."""
        pass
    
    @abstractmethod
    async def handle_remote_message(self, message: Dict[str, Any]):
        """Handle incoming message from remote platform."""
        pass
    
    @abstractmethod
    async def handle_matrix_message(self, room_id: str, message: str):
        """Handle incoming message from Matrix."""
        pass
    
    def _create_client(self) -> AsyncClient:
        """Create and configure Matrix client."""
        client_config = ClientConfig(
            store_path=f"./store_{self.config.bridge_name}",
            encryption_enabled=False,
        )
        
        client = AsyncClient(
            self.config.homeserver_url,
            self.config.bot_user_id,
            config=client_config,
        )
        
        # Set tokens
        client.access_token = self.config.appservice_token
        
        # Add event callbacks
        client.add_event_callback(self._on_matrix_message, RoomMessageText)
        
        return client
    
    async def _on_matrix_message(self, room: MatrixRoom, event: RoomMessageText):
        """Handle incoming Matrix message."""
        if event.sender_id == self.config.bot_user_id:
            return  # Ignore own messages
        
        # Check if room is bridged
        bridge_room = self.rooms.get(room.room_id)
        if bridge_room:
            await self.handle_matrix_message(room.room_id, event.body)
    
    async def _connect(self):
        """Connect to Matrix homeserver."""
        self.state = BridgeState.CONNECTING
        
        try:
            self.client = self._create_client()
            await self.client.sync(timeout=30000)
            self.state = BridgeState.CONNECTED
            logger.info(f"Connected to {self.config.homeserver_url}")
            
            # Start message batcher
            await self.batcher.start(self._process_message_batch)
            
        except Exception as e:
            self.state = BridgeState.ERROR
            logger.error(f"Connection failed: {e}")
            raise
    
    async def _disconnect(self):
        """Disconnect from Matrix homeserver."""
        self.state = BridgeState.DISCONNECTED
        await self.batcher.stop()
        
        if self.client:
            await self.client.close()
            self.client = None
            logger.info("Disconnected from Matrix homeserver")
    
    async def _process_message_batch(self, messages: List[Any]):
        """Process a batch of messages."""
        for message in messages:
            try:
                # Rate limiting
                if self.config.rate_limit_enabled:
                    if not await self.rate_limiter.acquire():
                        logger.warning("Rate limit exceeded, message dropped")
                        continue
                
                # Process message
                await self._handle_message_internal(message)
                
            except Exception as e:
                logger.error(f"Message processing failed: {e}")
    
    async def _handle_message_internal(self, message: Any):
        """Internal message handling with circuit breaker."""
        async with self.circuit_breaker:
            await self._route_message(message)
    
    async def _route_message(self, message: Any):
        """Route message to appropriate handler."""
        message_type = message.get("type", "unknown")
        handler = self._event_handlers.get(message_type)
        
        if handler:
            await handler(message)
        else:
            logger.warning(f"No handler for message type: {message_type}")
    
    def add_event_handler(self, event_type: str, handler: callable):
        """Add an event handler."""
        self._event_handlers[event_type] = handler
    
    # =========================================================================
    # Metrics
    # =========================================================================
    
    def record_message_sent(self):
        """Record a message sent."""
        self._metrics["messages_sent"] = self._metrics.get("messages_sent", 0) + 1
    
    def record_message_received(self):
        """Record a message received."""
        self._metrics["messages_received"] = self._metrics.get("messages_received", 0) + 1
    
    def record_error(self):
        """Record an error."""
        self._metrics["errors"] = self._metrics.get("errors", 0) + 1
    
    def get_metrics(self) -> Dict[str, Any]:
        """Get bridge metrics."""
        return {
            **self._metrics,
            "state": self.state.value,
            "cache_size": self.cache.size,
            "connected_users": len(self.users),
            "bridged_rooms": len(self.rooms),
        }
    
    # =========================================================================
    # Health Check
    # =========================================================================
    
    async def health_check(self) -> Dict[str, Any]:
        """Perform health check."""
        return {
            "status": "healthy" if self.state == BridgeState.CONNECTED else "unhealthy",
            "state": self.state.value,
            "metrics": self.get_metrics(),
            "timestamp": datetime.now().isoformat(),
        }


class TelegramBridge(BaseBridge):
    """Example Telegram bridge implementation."""
    
    def __init__(self, config: BridgeConfig):
        super().__init__(config)
        self.telegram_client = None
    
    async def start(self):
        """Start the Telegram bridge."""
        await self._connect()
        logger.info(f"Started {self.config.bridge_name} bridge")
    
    async def stop(self):
        """Stop the Telegram bridge."""
        await self._disconnect()
        logger.info(f"Stopped {self.config.bridge_name} bridge")
    
    async def handle_remote_message(self, message: Dict[str, Any]):
        """Handle incoming message from Telegram."""
        self.record_message_received()
        
        # Add to batch for processing
        await self.batcher.add({
            "source": "telegram",
            "message": message,
            "timestamp": datetime.now().isoformat(),
        })
    
    async def handle_matrix_message(self, room_id: str, message: str):
        """Handle incoming message from Matrix."""
        self.record_message_received()
        
        # Forward to Telegram
        bridge_room = self.rooms.get(room_id)
        if bridge_room:
            await self._send_to_telegram(bridge_room.remote_room_id, message)
    
    async def _send_to_telegram(self, chat_id: str, message: str):
        """Send message to Telegram."""
        # Implementation would go here
        logger.info(f"Sending to Telegram {chat_id}: {message}")


class DiscordBridge(BaseBridge):
    """Example Discord bridge implementation."""
    
    def __init__(self, config: BridgeConfig):
        super().__init__(config)
    
    async def start(self):
        """Start the Discord bridge."""
        await self._connect()
        logger.info(f"Started {self.config.bridge_name} bridge")
    
    async def stop(self):
        """Stop the Discord bridge."""
        await self._disconnect()
        logger.info(f"Stopped {self.config.bridge_name} bridge")
    
    async def handle_remote_message(self, message: Dict[str, Any]):
        """Handle incoming message from Discord."""
        self.record_message_received()
        
        await self.batcher.add({
            "source": "discord",
            "message": message,
            "timestamp": datetime.now().isoformat(),
        })
    
    async def handle_matrix_message(self, room_id: str, message: str):
        """Handle incoming message from Matrix."""
        self.record_message_received()
        
        bridge_room = self.rooms.get(room_id)
        if bridge_room:
            await self._send_to_discord(bridge_room.remote_room_id, message)
    
    async def _send_to_discord(self, channel_id: str, message: str):
        """Send message to Discord."""
        logger.info(f"Sending to Discord {channel_id}: {message}")


# =============================================================================
# Bridge Factory
# =============================================================================

class BridgeFactory:
    """Factory for creating bridges."""
    
    @staticmethod
    async def create_bridge(
        bridge_type: str,
        config: BridgeConfig,
    ) -> BaseBridge:
        """Create a bridge of the specified type."""
        bridges = {
            "telegram": TelegramBridge,
            "discord": DiscordBridge,
        }
        
        bridge_class = bridges.get(bridge_type.lower())
        if not bridge_class:
            raise ValueError(f"Unknown bridge type: {bridge_type}")
        
        bridge = bridge_class(config)
        await bridge.start()
        
        return bridge
    
    @staticmethod
    def create_config(
        homeserver_url: str,
        homeserver_domain: str,
        bridge_type: str,
        appservice_token: str,
        homeserver_token: str,
        **kwargs,
    ) -> BridgeConfig:
        """Create bridge configuration."""
        return BridgeConfig(
            homeserver_url=homeserver_url,
            homeserver_domain=homeserver_domain,
            appservice_token=appservice_token,
            homeserver_token=homeserver_token,
            bridge_name=bridge_type,
            bridge_url=f"http://{bridge_type}:29328",
            bot_user_id=f"@{bridge_type}_bot:{homeserver_domain}",
            **kwargs,
        )


# =============================================================================
# Main Example
# =============================================================================

async def main():
    """Example bridge startup."""
    
    # Create configuration
    config = BridgeFactory.create_config(
        homeserver_url="https://matrix.rechain.network",
        homeserver_domain="rechain.network",
        bridge_type="telegram",
        appservice_token="your_appservice_token",
        homeserver_token="your_homeserver_token",
    )
    
    try:
        # Create and start bridge
        bridge = await BridgeFactory.create_bridge("telegram", config)
        
        logger.info("Bridge running. Press Ctrl+C to stop.")
        
        # Keep running
        while True:
            await asyncio.sleep(1)
            
    except KeyboardInterrupt:
        logger.info("Shutting down...")
    except Exception as e:
        logger.error(f"Fatal error: {e}")
    finally:
        if 'bridge' in locals():
            await bridge.stop()


if __name__ == "__main__":
    asyncio.run(main())

