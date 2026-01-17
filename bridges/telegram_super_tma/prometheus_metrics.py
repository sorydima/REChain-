"""
Prometheus Metrics Exporter for Telegram Super TMA Bridge
Exposes bridge metrics for Prometheus scraping and monitoring.
"""

import asyncio
import time
from typing import Dict, Any
from prometheus_client import (
    Counter, Histogram, Gauge, Summary,
    generate_latest, CONTENT_TYPE_LATEST,
    start_http_server, CollectorRegistry
)
from prometheus_client import multiprocess, generate_wsgi_app

# Create a separate registry for multiprocess mode
registry = CollectorRegistry()

# Message processing metrics
messages_processed = Counter(
    'bridge_messages_processed_total',
    'Total number of messages processed',
    ['direction', 'status'],
    registry=registry
)

media_processed = Counter(
    'bridge_media_processed_total',
    'Total number of media files processed',
    ['direction', 'status'],
    registry=registry
)

errors_total = Counter(
    'bridge_errors_total',
    'Total number of errors',
    ['error_type'],
    registry=registry
)

# Latency metrics
latency_seconds = Histogram(
    'bridge_latency_seconds',
    'Request latency in seconds',
    ['operation'],
    buckets=[0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1.0, 2.5, 5.0, 10.0],
    registry=registry
)

message_latency = Histogram(
    'bridge_message_latency_seconds',
    'Message processing latency in seconds',
    ['bridge'],
    buckets=[0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1.0],
    registry=registry
)

# Rate limiting metrics
rate_limit_hits = Counter(
    'bridge_rate_limit_hits_total',
    'Total number of rate limit hits',
    ['bridge'],
    registry=registry
)

# Circuit breaker metrics
circuit_breaker_state = Gauge(
    'bridge_circuit_breaker_state',
    'Circuit breaker state (0=closed, 1=half-open, 2=open)',
    ['service'],
    registry=registry
)

# Cache metrics
cache_hits = Counter(
    'bridge_cache_hits_total',
    'Total number of cache hits',
    ['cache'],
    registry=registry
)

cache_misses = Counter(
    'bridge_cache_misses_total',
    'Total number of cache misses',
    ['cache'],
    registry=registry
)

cache_size = Gauge(
    'bridge_cache_size',
    'Current size of cache',
    ['cache'],
    registry=registry
)

# Queue metrics
queue_size = Gauge(
    'bridge_queue_size',
    'Current size of message queue',
    ['queue'],
    registry=registry
)

queue_max_size = Gauge(
    'bridge_queue_max_size',
    'Maximum size of message queue',
    ['queue'],
    registry=registry
)

# Connection metrics
active_connections = Gauge(
    'bridge_active_connections',
    'Number of active connections',
    ['protocol'],
    registry=registry
)

# Resource metrics
memory_usage_bytes = Gauge(
    'bridge_memory_usage_bytes',
    'Memory usage in bytes',
    ['component'],
    registry=registry
)

cpu_usage_percent = Gauge(
    'bridge_cpu_usage_percent',
    'CPU usage percentage',
    ['component'],
    registry=registry
)

# Bandwidth metrics
bytes_transferred = Counter(
    'bridge_bytes_transferred_total',
    'Total bytes transferred',
    ['direction', 'type'],
    registry=registry
)

# Bridge-specific metrics
bridged_rooms = Gauge(
    'bridge_bridged_rooms',
    'Number of bridged rooms',
    ['bridge'],
    registry=registry
)

bridged_users = Gauge(
    'bridge_bridged_users',
    'Number of bridged users',
    ['bridge'],
    registry=registry
)

# Limit usage
limit_usage_ratio = Gauge(
    'bridge_limit_usage_ratio',
    'Current usage as ratio of limit',
    ['limit_type'],
    registry=registry
)

# Health metrics
bridge_up = Gauge(
    'bridge_up',
    'Whether the bridge is up (1) or down (0)',
    ['bridge'],
    registry=registry
)

last_success_timestamp = Gauge(
    'bridge_last_success_timestamp',
    'Unix timestamp of last successful operation',
    ['bridge'],
    registry=registry
)

last_error_timestamp = Gauge(
    'bridge_last_error_timestamp',
    'Unix timestamp of last error',
    ['bridge', 'error_type'],
    registry=registry
)

# Message batch metrics
batch_size = Histogram(
    'bridge_batch_size',
    'Size of processed message batches',
    ['bridge'],
    buckets=[1, 5, 10, 25, 50, 100, 250, 500],
    registry=registry
)

batch_processing_time = Histogram(
    'bridge_batch_processing_seconds',
    'Time to process message batches',
    ['bridge'],
    buckets=[0.001, 0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5],
    registry=registry
)


class MetricsExporter:
    """Prometheus metrics exporter for the bridge."""
    
    def __init__(self, port: int = 8001, registry=registry):
        self.port = port
        self.registry = registry
        self._start_time = time.time()
        self._registry = registry
    
    def start_server(self):
        """Start the Prometheus metrics HTTP server."""
        start_http_server(self.port, registry=self.registry)
        print(f"Prometheus metrics server started on port {self.port}")
    
    def get_metrics(self) -> bytes:
        """Generate metrics output for Prometheus scraping."""
        return generate_latest(self.registry)
    
    def get_content_type(self) -> str:
        """Get the content type for metrics response."""
        return CONTENT_TYPE_LATEST
    
    def record_message(self, direction: str, status: str = "success", latency: float = 0):
        """Record a processed message."""
        messages_processed.labels(direction=direction, status=status).inc()
        if latency > 0:
            latency_seconds.labels(operation="message").observe(latency)
    
    def record_media(self, direction: str, status: str = "success", latency: float = 0):
        """Record a processed media file."""
        media_processed.labels(direction=direction, status=status).inc()
        if latency > 0:
            latency_seconds.labels(operation="media").observe(latency)
    
    def record_error(self, error_type: str):
        """Record an error."""
        errors_total.labels(error_type=error_type).inc()
    
    def record_rate_limit_hit(self, bridge: str = "telegram"):
        """Record a rate limit hit."""
        rate_limit_hits.labels(bridge=bridge).inc()
    
    def update_circuit_breaker(self, service: str, state: int):
        """Update circuit breaker state."""
        circuit_breaker_state.labels(service=service).set(state)
    
    def record_cache_hit(self, cache: str = "default"):
        """Record a cache hit."""
        cache_hits.labels(cache=cache).inc()
    
    def record_cache_miss(self, cache: str = "default"):
        """Record a cache miss."""
        cache_misses.labels(cache=cache).inc()
    
    def update_cache_size(self, cache: str = "default", size: int = 0):
        """Update cache size."""
        cache_size.labels(cache=cache).set(size)
    
    def update_queue_size(self, queue: str = "message", size: int = 0, max_size: int = 1000):
        """Update queue metrics."""
        queue_size.labels(queue=queue).set(size)
        queue_max_size.labels(queue=queue).set(max_size)
    
    def update_connections(self, protocol: str = "matrix", count: int = 0):
        """Update connection count."""
        active_connections.labels(protocol=protocol).set(count)
    
    def update_memory_usage(self, component: str = "bridge", bytes_used: int = 0):
        """Update memory usage."""
        memory_usage_bytes.labels(component=component).set(bytes_used)
    
    def update_cpu_usage(self, component: str = "bridge", percent: float = 0):
        """Update CPU usage."""
        cpu_usage_percent.labels(component=component).set(percent)
    
    def record_bytes_transferred(self, direction: str = "outbound", type_: str = "message", bytes_count: int = 0):
        """Record transferred bytes."""
        bytes_transferred.labels(direction=direction, type=type_).inc(bytes_count)
    
    def update_bridged_rooms(self, bridge: str, count: int):
        """Update bridged rooms count."""
        bridged_rooms.labels(bridge=bridge).set(count)
    
    def update_bridged_users(self, bridge: str, count: int):
        """Update bridged users count."""
        bridged_users.labels(bridge=bridge).set(count)
    
    def update_limit_usage(self, limit_type: str, ratio: float):
        """Update limit usage ratio."""
        limit_usage_ratio.labels(limit_type=limit_type).set(ratio)
    
    def update_bridge_status(self, bridge: str, is_up: bool, last_success: float = None):
        """Update bridge status."""
        bridge_up.labels(bridge=bridge).set(1 if is_up else 0)
        if last_success:
            last_success_timestamp.labels(bridge=bridge).set(last_success)
    
    def record_last_error(self, bridge: str, error_type: str, timestamp: float = None):
        """Record last error timestamp."""
        if timestamp is None:
            timestamp = time.time()
        last_error_timestamp.labels(bridge=bridge, error_type=error_type).set(timestamp)
    
    def record_batch(self, bridge: str, size: int, processing_time: float):
        """Record batch processing metrics."""
        batch_size.labels(bridge=bridge).observe(size)
        batch_processing_time.labels(bridge=bridge).observe(processing_time)
    
    def get_uptime(self) -> float:
        """Get bridge uptime in seconds."""
        return time.time() - self._start_time


# WSGI app for metrics (useful behind Gunicorn/uWSGI)
def create_metrics_app():
    """Create WSGI application for metrics."""
    return generate_wsgi_app(registry=registry)


# Example usage and testing
if __name__ == "__main__":
    import random
    
    # Create metrics exporter
    exporter = MetricsExporter(port=8001)
    
    # Start metrics server
    exporter.start_server()
    
    # Simulate some metrics
    async def simulate_metrics():
        while True:
            # Simulate message processing
            exporter.record_message("matrix_to_telegram", "success", random.uniform(0.01, 0.5))
            exporter.record_message("telegram_to_matrix", "success", random.uniform(0.01, 0.3))
            
            # Simulate rate limiting
            if random.random() < 0.05:
                exporter.record_rate_limit_hit()
            
            # Update cache size
            exporter.update_cache_size(size=random.randint(100, 10000))
            
            # Update queue size
            exporter.update_queue_size(size=random.randint(0, 500))
            
            # Update connections
            exporter.update_connections(count=random.randint(10, 100))
            
            # Update bridge status
            exporter.update_bridge_status("telegram", True, time.time())
            
            await asyncio.sleep(5)
    
    # Run simulation
    asyncio.run(simulate_metrics())

