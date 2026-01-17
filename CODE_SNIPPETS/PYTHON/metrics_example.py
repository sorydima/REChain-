"""
Prometheus Metrics Example for REChain

Production-ready metrics collection and export including:
- Custom metrics (counters, gauges, histograms)
- HTTP endpoint for scraping
- Labels and tagging
- Aggregation

Usage:
    python metrics_example.py

Author: REChain Development Team
Created: 2025-01-09
"""

import asyncio
import time
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Any, Callable, Dict, List, Optional, Tuple
from collections import defaultdict
import hashlib
import json

try:
    from prometheus_client import (
        Counter,
        Gauge,
        Histogram,
        Summary,
        Info,
        generate_latest,
        CONTENT_TYPE_LATEST,
        REGISTRY,
    )
except ImportError:
    print("Please install prometheus_client: pip install prometheus_client")
    exit(1)


class MetricType(Enum):
    """Metric types."""
    COUNTER = "counter"
    GAUGE = "gauge"
    HISTOGRAM = "histogram"
    SUMMARY = "summary"


@dataclass
class MetricConfig:
    """Configuration for a metric."""
    name: str
    metric_type: MetricType
    description: str
    labels: List[str] = field(default_factory=list)
    buckets: Optional[List[float]] = None  # For histograms


class MetricsCollector:
    """
    Comprehensive metrics collector for REChain bridges.
    
    Supports:
    - Counters (monotonically increasing values)
    - Gauges (can increase/decrease)
    - Histograms (value distributions)
    - Summaries (quantile calculations)
    """
    
    def __init__(self, namespace: str = "rechain_bridge"):
        self.namespace = namespace
        self._metrics: Dict[str, Any] = {}
        self._custom_collectors: List[Callable] = []
        self._start_time = time.time()
        
        # Initialize standard metrics
        self._init_standard_metrics()
    
    def _init_standard_metrics(self):
        """Initialize standard metrics."""
        # Message metrics
        self.create_counter(
            "messages_processed_total",
            "Total number of messages processed",
            ["direction", "status"],
        )
        
        self.create_counter(
            "messages_failed_total",
            "Total number of failed messages",
            ["direction", "error_type"],
        )
        
        self.create_histogram(
            "message_processing_seconds",
            "Message processing time in seconds",
            ["operation"],
            buckets=[0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1.0, 2.5, 5.0, 10.0],
        )
        
        # Bridge-specific metrics
        self.create_gauge(
            "rooms_bridged",
            "Number of bridged rooms",
        )
        
        self.create_gauge(
            "users_connected",
            "Number of connected users",
        )
        
        self.create_counter(
            "events_received_total",
            "Total events received",
            ["event_type"],
        )
        
        # Connection metrics
        self.create_gauge(
            "connection_status",
            "Connection status (1=connected, 0=disconnected)",
            ["component"],
        )
        
        self.create_counter(
            " reconnections_total",
            "Total number of reconnections",
            ["reason"],
        )
        
        # Performance metrics
        self.create_gauge(
            "queue_size",
            "Current queue size",
            ["queue_name"],
        )
        
        self.create_histogram(
            "api_latency_seconds",
            "API call latency in seconds",
            ["api_endpoint"],
            buckets=[0.01, 0.05, 0.1, 0.25, 0.5, 1.0, 2.5, 5.0],
        )
        
        # Resource metrics
        self.create_gauge(
            "memory_bytes",
            "Memory usage in bytes",
            ["type"],
        )
        
        self.create_gauge(
            "cpu_percent",
            "CPU usage percentage",
        )
        
        # Cache metrics
        self.create_counter(
            "cache_hits_total",
            "Total cache hits",
            ["cache_name"],
        )
        
        self.create_counter(
            "cache_misses_total",
            "Total cache misses",
            ["cache_name"],
        )
        
        # Rate limit metrics
        self.create_counter(
            "rate_limit_exceeded_total",
            "Total rate limit exceeded events",
            ["limit_type"],
        )
        
        # Error metrics
        self.create_counter(
            "errors_total",
            "Total errors",
            ["error_type", "component"],
        )
    
    def create_counter(
        self,
        name: str,
        description: str,
        labels: Optional[List[str]] = None,
    ) -> Counter:
        """Create a counter metric."""
        full_name = f"{self.namespace}_{name}"
        metric = Counter(
            full_name,
            description,
            labels=labels or [],
        )
        self._metrics[name] = metric
        return metric
    
    def create_gauge(
        self,
        name: str,
        description: str,
        labels: Optional[List[str]] = None,
    ) -> Gauge:
        """Create a gauge metric."""
        full_name = f"{self.namespace}_{name}"
        metric = Gauge(
            full_name,
            description,
            labels=labels or [],
        )
        self._metrics[name] = metric
        return metric
    
    def create_histogram(
        self,
        name: str,
        description: str,
        labels: Optional[List[str]] = None,
        buckets: Optional[List[float]] = None,
    ) -> Histogram:
        """Create a histogram metric."""
        full_name = f"{self.namespace}_{name}"
        metric = Histogram(
            full_name,
            description,
            labels=labels or [],
            buckets=buckets or Histogram.DEFAULT_BUCKETS,
        )
        self._metrics[name] = metric
        return metric
    
    def create_summary(
        self,
        name: str,
        description: str,
        labels: Optional[List[str]] = None,
        quantiles: Optional[List[Tuple[float, float]]] = None,
    ) -> Summary:
        """Create a summary metric."""
        full_name = f"{self.namespace}_{name}"
        metric = Summary(
            full_name,
            description,
            labels=labels or [],
        )
        self._metrics[name] = metric
        return metric
    
    def create_info(self, name: str, description: str, **kwargs) -> Info:
        """Create an info metric."""
        full_name = f"{self.namespace}_{name}"
        metric = Info(full_name, description, **kwargs)
        self._metrics[name] = metric
        return metric
    
    # Convenience methods for common operations
    
    def increment_counter(
        self,
        name: str,
        value: float = 1.0,
        labels: Optional[Dict[str, str]] = None,
    ):
        """Increment a counter."""
        metric = self._metrics.get(name)
        if metric is None:
            return
        
        if labels:
            metric.labels(**labels).inc(value)
        else:
            metric.inc(value)
    
    def decrement_gauge(
        self,
        name: str,
        value: float = 1.0,
        labels: Optional[Dict[str, str]] = None,
    ):
        """Decrement a gauge."""
        metric = self._metrics.get(name)
        if metric is None:
            return
        
        if labels:
            metric.labels(**labels).dec(value)
        else:
            metric.dec(value)
    
    def set_gauge(
        self,
        name: str,
        value: float,
        labels: Optional[Dict[str, str]] = None,
    ):
        """Set a gauge value."""
        metric = self._metrics.get(name)
        if metric is None:
            return
        
        if labels:
            metric.labels(**labels).set(value)
        else:
            metric.set(value)
    
    def observe_histogram(
        self,
        name: str,
        value: float,
        labels: Optional[Dict[str, str]] = None,
    ):
        """Observe a value in a histogram."""
        metric = self._metrics.get(name)
        if metric is None:
            return
        
        if labels:
            metric.labels(**labels).observe(value)
        else:
            metric.observe(value)
    
    # Bridge-specific metric methods
    
    def record_message_processed(
        self,
        direction: str = "matrix_to_remote",
        status: str = "success",
    ):
        """Record a processed message."""
        self.increment_counter(
            "messages_processed_total",
            labels={"direction": direction, "status": status},
        )
    
    def record_message_failed(
        self,
        direction: str,
        error_type: str,
    ):
        """Record a failed message."""
        self.increment_counter(
            "messages_failed_total",
            labels={"direction": direction, "error_type": error_type},
        )
    
    def record_latency(
        self,
        operation: str,
        latency_seconds: float,
    ):
        """Record processing latency."""
        self.observe_histogram(
            "message_processing_seconds",
            latency_seconds,
            labels={"operation": operation},
        )
    
    def set_connection_status(
        self,
        component: str,
        connected: bool,
    ):
        """Set connection status."""
        self.set_gauge(
            "connection_status",
            value=1.0 if connected else 0.0,
            labels={"component": component},
        )
    
    def record_event(self, event_type: str):
        """Record an event."""
        self.increment_counter(
            "events_received_total",
            labels={"event_type": event_type},
        )
    
    def set_queue_size(self, queue_name: str, size: int):
        """Set queue size."""
        self.set_gauge(
            "queue_size",
            value=float(size),
            labels={"queue_name": queue_name},
        )
    
    def record_cache_hit(self, cache_name: str = "default"):
        """Record a cache hit."""
        self.increment_counter(
            "cache_hits_total",
            labels={"cache_name": cache_name},
        )
    
    def record_cache_miss(self, cache_name: str = "default"):
        """Record a cache miss."""
        self.increment_counter(
            "cache_misses_total",
            labels={"cache_name": cache_name},
        )
    
    def record_error(
        self,
        error_type: str,
        component: str = "bridge",
    ):
        """Record an error."""
        self.increment_counter(
            "errors_total",
            labels={"error_type": error_type, "component": component},
        )
    
    # Metrics export
    
    def get_metrics(self) -> bytes:
        """Get all metrics in Prometheus format."""
        return generate_latest(REGISTRY)
    
    def get_json_metrics(self) -> Dict[str, Any]:
        """Get all metrics in JSON format."""
        metrics = {}
        
        for name, metric in self._metrics.items():
            if hasattr(metric, '_metrics'):  # Multi-label metric
                for labels, value in metric._metrics.items():
                    key = f"{name}" + "".join(
                        f"_{k}={v}" for k, v in labels.items()
                    )
                    metrics[key] = value._value.get()
            else:
                if hasattr(metric, '_value'):
                    metrics[name] = metric._value.get()
        
        return metrics
    
    def get_summary(self) -> Dict[str, Any]:
        """Get metrics summary."""
        uptime = time.time() - self._start_time
        
        return {
            "uptime_seconds": uptime,
            "metrics_count": len(self._metrics),
            "metrics": self.get_json_metrics(),
        }


class MetricsServer:
    """HTTP server for Prometheus metrics scraping."""
    
    def __init__(
        self,
        metrics: MetricsCollector,
        host: str = "0.0.0.0",
        port: int = 9090,
    ):
        self.metrics = metrics
        self.host = host
        self.port = port
        self._running = False
    
    async def start(self):
        """Start the metrics server."""
        import aiohttp
        from aiohttp import web
        
        app = web.Application()
        
        # Metrics endpoint
        async def metrics_handler(request):
            return web.Response(
                body=self.metrics.get_metrics(),
                content_type=CONTENT_TYPE_LATEST,
            )
        
        app.router.add_get("/metrics", metrics_handler)
        
        # Health endpoint
        async def health_handler(request):
            return web.json_response({
                "status": "healthy",
                "uptime": time.time() - self.metrics._start_time,
            })
        
        app.router.add_get("/health", health_handler)
        
        # Summary endpoint
        async def summary_handler(request):
            return web.json_response(self.metrics.get_summary())
        
        app.router.add_get("/stats", summary_handler)
        
        runner = web.AppRunner(app)
        await runner.setup()
        site = web.TCPSite(runner, self.host, self.port)
        await site.start()
        
        self._running = True
        print(f"Metrics server started on {self.host}:{self.port}")
    
    async def stop(self):
        """Stop the metrics server."""
        self._running = False


# =============================================================================
# Example Usage
# =============================================================================

async def main():
    """Example metrics collection."""
    
    # Create metrics collector
    metrics = MetricsCollector(namespace="rechain_bridge")
    
    # Record some metrics
    metrics.record_message_processed(direction="matrix_to_remote", status="success")
    metrics.record_message_processed(direction="remote_to_matrix", status="success")
    metrics.record_message_failed("matrix_to_remote", "timeout")
    
    metrics.record_latency("message_sync", 0.05)
    metrics.record_latency("message_send", 0.1)
    
    metrics.set_connection_status("matrix", True)
    metrics.set_connection_status("telegram", True)
    
    metrics.set_queue_size("outgoing", 5)
    metrics.set_queue_size("incoming", 3)
    
    metrics.record_cache_hit("user_cache")
    metrics.record_cache_miss("room_cache")
    
    # Get metrics
    print("Prometheus metrics:")
    print(metrics.get_metrics().decode())
    
    print("\nJSON metrics:")
    print(json.dumps(metrics.get_summary(), indent=2))
    
    # Start metrics server
    server = MetricsServer(metrics, host="0.0.0.0", port=9090)
    await server.start()
    
    print("\nMetrics server running at http://0.0.0.0:9090/metrics")
    
    # Keep running
    while True:
        await asyncio.sleep(1)


if __name__ == "__main__":
    asyncio.run(main())

