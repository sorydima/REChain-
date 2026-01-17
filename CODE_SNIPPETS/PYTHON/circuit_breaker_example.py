"""
Circuit Breaker Example for REChain

Production-ready circuit breaker implementation patterns including:
- State management (closed, open, half-open)
- Failure tracking and recovery
- Thread-safe operations
- Metrics and monitoring

Usage:
    python circuit_breaker_example.py

Author: REChain Development Team
Created: 2025-01-09
"""

import asyncio
import logging
import time
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Any, Callable, Optional

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
)
logger = logging.getLogger(__name__)


class CircuitState(Enum):
    """Circuit breaker states."""
    CLOSED = "closed"       # Normal operation
    OPEN = "open"           # Failing, reject all requests
    HALF_OPEN = "half_open"  # Testing recovery


class CircuitBreakerError(Exception):
    """Raised when circuit is open."""
    def __init__(self, message: str = "Circuit breaker is open"):
        super().__init__(message)
        self.message = message


@dataclass
class CircuitBreakerConfig:
    """Configuration for circuit breaker."""
    failure_threshold: int = 5          # Failures before opening
    success_threshold: int = 3           # Successes in half-open to close
    timeout: float = 60.0                # Time before trying half-open
    half_open_max_calls: int = 3         # Max calls in half-open state
    ignored_exceptions: tuple = ()       # Exceptions to not count as failures


@dataclass
class CircuitBreakerStats:
    """Statistics for circuit breaker."""
    state: CircuitState = CircuitState.CLOSED
    failures: int = 0
    successes: int = 0
    calls_rejected: int = 0
    last_failure_time: Optional[datetime] = None
    last_success_time: Optional[datetime] = None
    state_changed_time: Optional[datetime] = None
    
    def record_failure(self):
        self.failures += 1
        self.last_failure_time = datetime.now()
    
    def record_success(self):
        self.successes += 1
        self.last_success_time = datetime.now()
    
    def record_rejected(self):
        self.calls_rejected += 1


class CircuitBreaker:
    """
    Thread-safe circuit breaker implementation.
    
    States:
    - CLOSED: Normal operation, all requests allowed
    - OPEN: Failing, all requests rejected immediately
    - HALF_OPEN: Testing recovery, limited requests allowed
    
    Transitions:
    - CLOSED -> OPEN: When failure_threshold is reached
    - OPEN -> HALF_OPEN: After timeout expires
    - HALF_OPEN -> CLOSED: When success_threshold is reached
    - HALF_OPEN -> OPEN: On any failure
    """
    
    def __init__(self, name: str, config: Optional[CircuitBreakerConfig] = None):
        self.name = name
        self.config = config or CircuitBreakerConfig()
        self._state = CircuitState.CLOSED
        self._stats = CircuitBreakerStats()
        self._lock = asyncio.Lock()
        self._last_state_change: float = time.time()
        self._half_open_calls = 0
        
        logger.info(f"Circuit breaker '{name}' initialized in CLOSED state")
    
    @property
    def state(self) -> CircuitState:
        """Get current state."""
        return self._state
    
    @property
    def stats(self) -> CircuitBreakerStats:
        """Get statistics."""
        return self._stats
    
    def __repr__(self):
        return f"CircuitBreaker(name={self.name}, state={self.state.name})"
    
    async def __aenter__(self):
        """Async context manager entry."""
        await self._before_call()
        return self
    
    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit."""
        if exc_type is None:
            await self.record_success()
        else:
            await self.record_failure(exc_val)
    
    async def call(self, func: Callable, *args, **kwargs) -> Any:
        """Execute a function with circuit breaker protection."""
        await self._before_call()
        
        try:
            result = await func(*args, **kwargs)
            await self.record_success()
            return result
        except Exception as e:
            await self.record_failure(e)
            raise
    
    async def _before_call(self):
        """Check if call is allowed."""
        async with self._lock:
            now = time.time()
            
            if self._state == CircuitState.OPEN:
                if now - self._last_state_change >= self.config.timeout:
                    await self._transition_to(CircuitState.HALF_OPEN)
                else:
                    self._stats.record_rejected()
                    raise CircuitBreakerError(
                        f"Circuit breaker '{self.name}' is OPEN"
                    )
            
            if self._state == CircuitState.HALF_OPEN:
                if self._half_open_calls >= self.config.half_open_max_calls:
                    self._stats.record_rejected()
                    raise CircuitBreakerError(
                        f"Circuit breaker '{self.name}' is HALF_OPEN"
                    )
                self._half_open_calls += 1
    
    async def record_success(self):
        """Record a successful call."""
        async with self._lock:
            self._stats.record_success()
            
            if self._state == CircuitState.HALF_OPEN:
                if self._stats.successes >= self.config.success_threshold:
                    await self._transition_to(CircuitState.CLOSED)
    
    async def record_failure(self, exception: Exception):
        """Record a failed call."""
        async with self._lock:
            if isinstance(exception, self.config.ignored_exceptions):
                return
            
            self._stats.record_failure()
            
            if self._state == CircuitState.CLOSED:
                if self._stats.failures >= self.config.failure_threshold:
                    await self._transition_to(CircuitState.OPEN)
            
            elif self._state == CircuitState.HALF_OPEN:
                await self._transition_to(CircuitState.OPEN)
    
    async def _transition_to(self, new_state: CircuitState):
        """Transition to a new state."""
        old_state = self._state
        self._state = new_state
        self._last_state_change = time.time()
        self._stats.state = new_state
        self._stats.state_changed_time = datetime.now()
        
        if new_state == CircuitState.CLOSED:
            self._stats = CircuitBreakerStats(state=CircuitState.CLOSED)
            self._half_open_calls = 0
        elif new_state == CircuitState.HALF_OPEN:
            self._half_open_calls = 0
        
        logger.info(
            f"Circuit breaker '{self.name}' transitioned: "
            f"{old_state.name} -> {new_state.name}"
        )
    
    async def reset(self):
        """Reset circuit breaker to initial state."""
        async with self._lock:
            self._state = CircuitState.CLOSED
            self._stats = CircuitBreakerStats()
            self._last_state_change = time.time()
            self._half_open_calls = 0
            
            logger.info(f"Circuit breaker '{self.name}' was reset")
    
    def get_status(self) -> dict:
        """Get current status as dictionary."""
        return {
            "name": self.name,
            "state": self._state.value,
            "failures": self._stats.failures,
            "successes": self._stats.successes,
            "calls_rejected": self._stats.calls_rejected,
            "seconds_since_last_change": time.time() - self._last_state_change,
        }


async def example_external_service():
    """Simulate an external service call."""
    import random
    
    if random.random() < 0.3:
        raise Exception("External service unavailable")
    
    return {"status": "ok", "data": "response"}


async def main():
    """Example circuit breaker usage."""
    
    config = CircuitBreakerConfig(
        failure_threshold=3,
        success_threshold=2,
        timeout=5.0,
        half_open_max_calls=2,
    )
    
    breaker = CircuitBreaker("external_api", config)
    
    print(f"Initial state: {breaker.state.name}")
    
    for i in range(10):
        try:
            async with breaker:
                result = await example_external_service()
                print(f"Call {i+1}: SUCCESS - {result}")
        except CircuitBreakerError as e:
            print(f"Call {i+1}: BLOCKED - {e}")
        except Exception as e:
            print(f"Call {i+1}: FAILED - {e}")
        
        await asyncio.sleep(0.5)
    
    print("\nFinal status:")
    print(breaker.get_status())


if __name__ == "__main__":
    asyncio.run(main())

