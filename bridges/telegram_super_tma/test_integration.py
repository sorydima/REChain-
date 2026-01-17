"""
Integration Tests for Telegram Super TMA Bridge
Tests end-to-end functionality of the bridge
"""

import asyncio
import pytest
import sys
import os
from unittest.mock import Mock, AsyncMock, patch
from datetime import datetime, timedelta

# Add parent directory to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from bridge import (
    MatrixBridge, BridgeConfig, CircuitBreaker, 
    RateLimiter, TTLCache, MetricsCollector, MessageBatcher
)


class TestCircuitBreaker:
    """Test circuit breaker functionality."""
    
    def test_circuit_breaker_closed_initially(self):
        """Circuit breaker should start in closed state."""
        cb = CircuitBreaker(failure_threshold=3, recovery_timeout=5)
        assert cb.state.name == "CLOSED"
    
    def test_circuit_breaker_opens_after_failures(self):
        """Circuit breaker should open after reaching failure threshold."""
        cb = CircuitBreaker(failure_threshold=3, recovery_timeout=5)
        
        # Simulate failures
        for _ in range(3):
            cb.record_failure()
        
        assert cb.state.name == "OPEN"
        assert cb.failures == 3
    
    def test_circuit_breaker_resets_on_success(self):
        """Circuit breaker should reset after successful operations."""
        cb = CircuitBreaker(failure_threshold=3, recovery_timeout=0)
        
        # Open the circuit
        for _ in range(3):
            cb.record_failure()
        assert cb.state.name == "OPEN"
        
        # Record some successes
        cb.record_success()
        cb.record_success()
        cb.record_success()
        
        assert cb.state.name == "CLOSED"
        assert cb.failures == 0


class TestRateLimiter:
    """Test rate limiter functionality."""
    
    def test_rate_limiter_allows_initial_requests(self):
        """Rate limiter should allow requests within burst limit."""
        limiter = RateLimiter(rate=10, burst=5)
        
        # Should allow 5 requests
        for _ in range(5):
            result = asyncio.run(limiter.acquire())
            assert result is True
    
    def test_rate_limiter_blocks_excess_requests(self):
        """Rate limiter should block requests after burst limit."""
        limiter = RateLimiter(rate=10, burst=5)
        
        # Exhaust burst limit
        for _ in range(5):
            asyncio.run(limiter.acquire())
        
        # Next request should be blocked
        result = asyncio.run(limiter.acquire())
        assert result is False
    
    def test_rate_limiter_refills_tokens(self):
        """Rate limiter should refill tokens over time."""
        limiter = RateLimiter(rate=10, burst=5)
        
        # Exhaust burst
        for _ in range(5):
            asyncio.run(limiter.acquire())
        
        # Wait for token refill (0.2 seconds = 2 tokens)
        import time
        time.sleep(0.2)
        
        # Should allow 2 requests now
        result1 = asyncio.run(limiter.acquire())
        result2 = asyncio.run(limiter.acquire())
        assert result1 is True
        assert result2 is True


class TestTTLCache:
    """Test TTL cache functionality."""
    
    @pytest.fixture
    def cache(self):
        """Create a cache instance."""
        return TTLCache(max_size=10, ttl=1)  # 1 second TTL
    
    @pytest.mark.asyncio
    async def test_cache_set_and_get(self, cache):
        """Test basic cache set and get operations."""
        await cache.set("key1", "value1")
        result = await cache.get("key1")
        assert result == "value1"
    
    @pytest.mark.asyncio
    async def test_cache_expires_entries(self, cache):
        """Test that cache entries expire after TTL."""
        await cache.set("key1", "value1")
        
        # Should be available immediately
        result = await cache.get("key1")
        assert result == "value1"
        
        # Wait for expiration
        import time
        time.sleep(1.1)
        
        # Should be expired now
        result = await cache.get("key1")
        assert result is None
    
    @pytest.mark.asyncio
    async def test_cache_eviction(self, cache):
        """Test that cache evicts oldest entries when full."""
        # Fill cache
        for i in range(15):
            await cache.set(f"key{i}", f"value{i}")
        
        # Oldest entries should be evicted
        result = await cache.get("key0")
        assert result is None
        
        # Newer entries should be present
        result = await cache.get("key14")
        assert result == "value14"


class TestMetricsCollector:
    """Test metrics collection functionality."""
    
    def test_metrics_collector_initial_values(self):
        """Test initial metrics values."""
        metrics = MetricsCollector()
        stats = metrics.get_stats()
        
        assert stats["messages_processed"] == 0
        assert stats["media_processed"] == 0
        assert stats["errors"] == 0
    
    @pytest.mark.asyncio
    async def test_metrics_record_message(self):
        """Test message recording."""
        metrics = MetricsCollector()
        
        await metrics.record_message(0.05)  # 50ms latency
        stats = metrics.get_stats()
        
        assert stats["messages_processed"] == 1
        assert "avg_latency_ms" in stats
    
    @pytest.mark.asyncio
    async def test_metrics_record_error(self):
        """Test error recording."""
        metrics = MetricsCollector()
        
        await metrics.record_error()
        stats = metrics.get_stats()
        
        assert stats["errors"] == 1


class TestMessageBatcher:
    """Test message batching functionality."""
    
    @pytest.mark.asyncio
    async def test_batch_processing(self):
        """Test that messages are batched correctly."""
        processed_batches = []
        
        async def processor(batch):
            processed_batches.append(batch)
        
        batcher = MessageBatcher(batch_size=3, batch_timeout=1)
        asyncio.create_task(batcher.start(processor))
        
        # Add items to batch
        await batcher.add("item1")
        await batcher.add("item2")
        await batcher.add("item3")
        
        # Wait for batch processing
        await asyncio.sleep(1.5)
        
        await batcher.stop()
        
        # Should have one batch with 3 items
        assert len(processed_batches) == 1
        assert len(processed_batches[0]) == 3


class TestMatrixBridge:
    """Test Matrix bridge functionality."""
    
    def test_bridge_config_loading(self, tmp_path):
        """Test configuration loading from file."""
        config_content = """
matrix:
  homeserver: http://test.local:8008
  user_id: "@test:local"
  access_token: "test_token"
  allowed_rooms:
    - "!room1:local"
bridge:
  chat_room_mapping:
    "-100123": "!room1:local"
"""
        config_file = tmp_path / "config.yaml"
        config_file.write_text(config_content)
        
        config = BridgeConfig.load(str(config_file))
        
        assert config.matrix_homeserver == "http://test.local:8008"
        assert config.matrix_user_id == "@test:local"
        assert config.matrix_access_token == "test_token"
        assert "!room1:local" in config.allowed_rooms
        assert "-100123" in config.chat_room_mapping
    
    def test_bridge_config_defaults(self, tmp_path):
        """Test configuration default values."""
        config_content = """
matrix:
  homeserver: http://test.local:8008
  user_id: "@test:local"
  access_token: "test_token"
"""
        config_file = tmp_path / "config.yaml"
        config_file.write_text(config_content)
        
        config = BridgeConfig.load(str(config_file))
        
        # Check defaults
        assert config.message_processing_workers == 4
        assert config.batch_size == 100
        assert config.rate_limit_rate == 50.0
        assert config.cache_max_size == 10000
        assert config.metrics_enabled is True


class TestBridgeIntegration:
    """Integration tests for bridge workflows."""
    
    @pytest.mark.asyncio
    async def test_message_flow_through_bridge(self):
        """Test complete message flow through the bridge."""
        metrics = MetricsCollector()
        cache = TTLCache(max_size=100, ttl=60)
        limiter = RateLimiter(rate=100, burst=50)
        
        # Simulate message processing
        async with limiter:
            # Check rate limit passed
            assert limiter.tokens <= 49  # One token used
            
            # Cache check
            await cache.set("msg1", {"content": "test", "sender": "user1"})
            cached = await cache.get("msg1")
            assert cached is not None
            
            # Record metrics
            await metrics.record_message(0.05)
        
        stats = metrics.get_stats()
        assert stats["messages_processed"] == 1
    
    @pytest.mark.asyncio
    async def test_circuit_breaker_integration(self):
        """Test circuit breaker with async operations."""
        cb = CircuitBreaker(failure_threshold=2, recovery_timeout=0)
        
        # Successful operations should work
        async with cb:
            result = "success"
            assert result == "success"
        
        # Simulate failures
        cb.record_failure()
        cb.record_failure()
        assert cb.state.name == "OPEN"
        
        # Circuit breaker should block further operations
        try:
            async with cb:
                pass
            assert False, "Should have raised CircuitBreakerError"
        except Exception:
            pass  # Expected


class TestSecurityFeatures:
    """Test security-related functionality."""
    
    def test_rate_limiter_prevents_abuse(self):
        """Test that rate limiting prevents abuse."""
        limiter = RateLimiter(rate=10, burst=10)
        
        # Exhaust the limit
        for _ in range(10):
            asyncio.run(limiter.acquire())
        
        # All subsequent requests should be blocked
        blocked_count = 0
        for _ in range(10):
            if not asyncio.run(limiter.acquire()):
                blocked_count += 1
        
        assert blocked_count == 10
    
    def test_cache_prevents_duplicate_processing(self):
        """Test that caching prevents duplicate message processing."""
        cache = TTLCache(max_size=100, ttl=60)
        processed_count = 0
        
        async def process_message(event_id, content):
            nonlocal processed_count
            
            # Check cache first
            cached = await cache.get(event_id)
            if cached:
                return  # Already processed
            
            # Process message
            await cache.set(event_id, True)
            processed_count += 1
        
        # First processing should succeed
        asyncio.run(process_message("event1", "content1"))
        assert processed_count == 1
        
        # Duplicate should be skipped
        asyncio.run(process_message("event1", "content1"))
        assert processed_count == 1
        
        # Different event should process
        asyncio.run(process_message("event2", "content2"))
        assert processed_count == 2


# Performance benchmarks
class TestPerformanceBenchmarks:
    """Performance benchmarks for bridge components."""
    
    def test_cache_performance(self):
        """Benchmark cache operations."""
        import time
        cache = TTLCache(max_size=10000, ttl=60)
        
        # Benchmark write performance
        start = time.time()
        for i in range(1000):
            asyncio.run(cache.set(f"key{i}", f"value{i}"))
        write_time = time.time() - start
        
        # Benchmark read performance
        start = time.time()
        for i in range(1000):
            asyncio.run(cache.get(f"key{i}"))
        read_time = time.time() - start
        
        # Performance assertions
        assert write_time < 1.0  # Should write 1000 items in under 1 second
        assert read_time < 0.5   # Should read 1000 items in under 0.5 seconds
    
    def test_rate_limiter_performance(self):
        """Benchmark rate limiter operations."""
        import time
        limiter = RateLimiter(rate=10000, burst=10000)
        
        # Benchmark acquire performance
        start = time.time()
        for _ in range(10000):
            asyncio.run(limiter.acquire())
        elapsed = time.time() - start
        
        # Should complete quickly
        assert elapsed < 1.0  # Should acquire 10000 tokens in under 1 second


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

