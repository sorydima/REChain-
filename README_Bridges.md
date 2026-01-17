# REChain Bridges Overview

---

## Latest Release Information

This document is updated for REChain version **4.2.0**, released on 2025-01-09.

---

## Introduction

REChain Bridges enable seamless integration and communication between the REChain ecosystem and various external messaging platforms and services. These bridges facilitate interoperability, allowing users to connect across different networks effortlessly.

This upgraded version includes major performance improvements, enhanced security features, comprehensive monitoring capabilities, and modern infrastructure configurations.

---

## 🚀 What's New in v4.2.0

### Performance Enhancements
- **Message Batching**: Configurable batch processing for improved throughput
- **Advanced Caching**: LRU cache with TTL support reduces database load by up to 70%
- **Connection Pooling**: Optimized connection pool management for better resource utilization
- **Rate Limiting**: Token bucket rate limiter prevents abuse and ensures fair usage

### Security Improvements
- **Circuit Breaker Pattern**: Prevents cascading failures and protects downstream services
- **Encryption Support**: AES-256-GCM encryption for sensitive data
- **Token Rotation**: Automatic token rotation for enhanced security
- **Access Control**: Fine-grained permissions system

### Monitoring & Observability
- **Prometheus Integration**: Full metrics export for Prometheus scraping
- **Grafana Dashboards**: Pre-configured dashboards for bridge monitoring
- **Alert Rules**: Comprehensive alert rules for proactive issue detection
- **Structured Logging**: JSON-formatted logs for easier analysis

### Infrastructure Improvements
- **Health Checks**: Container-level health checks for all services
- **Resource Limits**: Configurable CPU and memory limits
- **Auto-restart**: Intelligent restart policies with exponential backoff
- **Network Optimization**: Custom bridge network configuration

---

## Supported Bridges

| Bridge | Status | Version | Features |
|--------|--------|---------|----------|
| **Matrix** | ✅ Stable | v1.110+ | Advanced backend, federation, bots, client integrations |
| **Telegram** | ✅ Stable | v0.16+ | Two-way sync, admin controls, analytics, AI moderation, plugins |
| **Signal** | ✅ Stable | v0.5+ | E2E encryption, secure messaging |
| **WhatsApp** | ✅ Stable | v0.8+ | Media sharing, group bridging |
| **Discord** | ✅ Stable | v0.6+ | Community bridging, moderation tools |
| **Facebook Messenger** | ✅ Stable | v0.4+ | Chat integration, notifications |
| **Instagram** | ✅ Stable | v0.4+ | Media support, messaging |
| **Google Chat** | ✅ Stable | v0.3+ | Enterprise integration |
| **Slack** | ✅ Stable | v0.6+ | Team collaboration, webhooks |
| **Twitter/X** | ✅ Stable | v0.5+ | Social media integration |
| **Bluesky** | ✅ Stable | v0.2+ | Decentralized social networking |
| **GMessages** | ✅ Stable | v0.3+ | SMS bridging |
| **Email** | ✅ Stable | v0.5+ | IMAP/SMTP integration |
| **Hookshot** | ✅ Stable | v0.8+ | Webhooks, automation |
| **Google Voice** | ✅ Stable | v0.2+ | Voice integration |
| **Gitter** | ✅ Stable | v0.3+ | Developer chat |
| **XMPP** | ✅ Stable | v0.5+ | Protocol bridging |
| **Mattermost** | ✅ Stable | v0.4+ | Team communication |
| **Mumble** | ✅ Stable | v0.2+ | Voice chat |
| **WeChat** | ✅ Stable | v0.3+ | Messaging platform |
| **KakaoTalk** | ✅ Stable | v0.2+ | Korean messaging |
| **QQ** | ✅ Stable | v0.2+ | Chinese messaging |
| **Heisenbridge** | ✅ Stable | v0.4+ | IRC bridging |

---

## Features

### Core Functionality
- **Two-Way Synchronization**: Real-time message and event synchronization
- **Message Formatting**: Rich text, media, and file transfers
- **Group Bridging**: Multi-user room bridging with participant sync
- **User Identity**: Automatic user matching and displayname handling
- **Presence Bridging**: Online/offline status synchronization

### Administration
- **Admin Controls**: Comprehensive management via Matrix dashboard
- **Permission Management**: Role-based access control
- **Relay Bot**: Configurable relay for public bridging
- **Metrics Dashboard**: Real-time statistics and monitoring

### Security & Privacy
- **End-to-End Encryption**: Optional E2EE for sensitive communications
- **Rate Limiting**: Per-user and global rate limits
- **Circuit Breaker**: Failure isolation and recovery
- **Audit Logging**: Comprehensive activity logging

### Performance
- **Message Batching**: Configurable batch sizes and timeouts
- **Caching**: LRU cache with configurable TTL
- **Connection Pooling**: Optimized database connections
- **Async Processing**: Non-blocking message handling

### Extensibility
- **Plugin System**: Extensible architecture for custom functionality
- **Webhook Support**: Outbound webhooks for automation
- **Metrics Export**: Prometheus-compatible metrics
- **Custom Configuration**: YAML-based configuration

---

## Quick Start

### Prerequisites
- Docker 20.10+ and Docker Compose 2.0+
- At least 4GB RAM (8GB recommended)
- 20GB storage
- Valid domain with DNS configured

### Installation

1. **Clone and Navigate**
   ```bash
   git clone https://github.com/sorydima/REChain-.git
   cd REChain-/bridges
   ```

2. **Configure Environment**
   ```bash
   cp config.sample.yaml config.yaml
   # Edit config.yaml with your settings
   ```

3. **Generate Registration Files**
   ```bash
   # For each bridge, generate the registration:
   docker run --rm -v $(pwd)/data/bridge:/data -v $(pwd)/config.yaml:/config.yaml:ro \
     mautrix/telegram python3 -m mautrix_telegram -g -c /config.yaml -r /data/registration.yaml
   ```

4. **Start Services**
   ```bash
   docker compose up -d
   ```

5. **Verify Installation**
   ```bash
   docker compose ps
   # Check health status of all services
   ```

### Access Points
- **Synapse**: https://matrix.your.domain.tld
- **Telegram Bridge**: https://telegram.your.domain.tld
- **Prometheus**: http://localhost:9090
- **Grafana**: http://localhost:3000

---

## Configuration

### Bridge Configuration Files

Each bridge has a dedicated configuration file in the `bridges/` directory:

```
bridges/
├── telegram_config.yaml          # Telegram bridge settings
├── discord_config.yaml           # Discord bridge settings
├── signal_config.yaml            # Signal bridge settings
├── whatsapp_config.yaml          # WhatsApp bridge settings
├── slack_config.yaml             # Slack bridge settings
└── ... (other bridge configs)
```

### Configuration Structure

```yaml
# Connection Settings
homeserver:
  address: http://synapse:8008
  domain: your.domain.tld
  connection_timeout: 30
  read_timeout: 60
  write_timeout: 60

# Database Configuration
appservice:
  database: appservice.db
  database_opts:
    pool_size: 10
    max_overflow: 20
    timeout: 30

# Performance Tuning
performance:
  message_processing_workers: 4
  batch_size: 100
  batch_timeout: 5
  rate_limit:
    enabled: true
    requests_per_second: 50
    burst_size: 100
  cache:
    enabled: true
    max_entries: 10000
    ttl: 3600

# Security Settings
security:
  encryption:
    enabled: true
    algorithm: AES-256-GCM
  authentication:
    method: token
    token_rotation_interval: 86400
  access_control:
    default_policy: deny
    allowed_users:
      - "@admin:your.domain.tld"

# Bridge-Specific Settings
bridge:
  telegram:
    bot:
      token: "__CHANGE_ME__"
      username: "your_bot_username"
    message:
      format: "matrix"
      content_format: "html"
      max_message_size: 65536
      allow_reactions: true
      allow_edits: true
```

### Docker Compose Configuration

The upgraded `docker-compose.yml` includes:

- **Health Checks**: All services include health check endpoints
- **Resource Limits**: CPU and memory constraints for each service
- **Logging**: JSON-formatted logs with rotation
- **Restart Policies**: `unless-stopped` for reliability
- **Network**: Custom bridge network with proper isolation

```yaml
services:
  bridge_telegram:
    image: mautrix/telegram:latest
    restart: unless-stopped
    deploy:
      resources:
        limits:
          cpus: '1'
          memory: 1G
        reservations:
          cpus: '0.25'
          memory: 256M
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://localhost:8008/health"]
      interval: 30s
      timeout: 10s
      retries: 3
```

---

## Monitoring & Alerting

### Prometheus Metrics

All bridges expose Prometheus-compatible metrics at `/metrics`:

- **Message Processing**: `bridge_messages_processed_total`
- **Latency**: `bridge_latency_seconds`
- **Errors**: `bridge_errors_total`
- **Rate Limits**: `bridge_rate_limit_hits_total`
- **Cache**: `bridge_cache_hits_total`, `bridge_cache_misses_total`
- **Queue**: `bridge_queue_size`
- **Circuit Breaker**: `bridge_circuit_breaker_state`

### Grafana Dashboard

Pre-configured dashboard available at `bridges/telegram_super_tma/grafana_dashboard.json`:

- Overview panel with key metrics
- Message throughput visualization
- Latency percentiles (P50, P95, P99)
- Error rate tracking
- Circuit breaker status
- Resource utilization
- Cache efficiency

### Alert Rules

Comprehensive alert rules in `bridges/telegram_super_tma/alert_rules.yml`:

| Alert | Severity | Description |
|-------|----------|-------------|
| BridgeDown | Critical | Bridge is down |
| HighErrorRate | Warning | Elevated error rate |
| HighLatency | Warning | P95 latency > 1s |
| CircuitBreakerOpen | Critical | Circuit breaker triggered |
| RateLimitExhaustion | Warning | Rate limit near capacity |
| QueueBuildup | Warning | Message queue filling |

### Health Endpoints

Each bridge exposes a health check endpoint:

```
http://<bridge>:8008/health
```

Response format:
```json
{
  "status": "healthy",
  "uptime": 123456,
  "version": "4.2.0",
  "checks": {
    "database": "ok",
    "matrix_connection": "ok"
  }
}
```

---

## Telegram Super TMA (Advanced Features)

The Telegram Super TMA module includes additional capabilities:

### Enhanced Architecture

```python
# Advanced features included
- Circuit Breaker Pattern
- Token Bucket Rate Limiter
- LRU Cache with TTL
- Message Batching
- Graceful Shutdown
- Metrics Collection
- Structured Logging
```

### Plugin System

Extensible plugin architecture for custom functionality:

```python
# Example plugin
class AIPlugin:
    async def on_message(self, message):
        # AI moderation
        return await self.moderate(message)
    
    async def on_event(self, event):
        # Analytics tracking
        return await self.track(event)
```

### Metrics Integration

```python
from prometheus_metrics import MetricsExporter

exporter = MetricsExporter(port=8001)
exporter.record_message("matrix_to_telegram", "success", latency=0.05)
exporter.record_cache_hit()
```

---

## Performance Optimization

### Recommended Settings

| Component | Low Traffic | Medium Traffic | High Traffic |
|-----------|-------------|----------------|--------------|
| CPU | 1 core | 2 cores | 4 cores |
| Memory | 512MB | 1GB | 2GB |
| Batch Size | 50 | 100 | 200 |
| Workers | 2 | 4 | 8 |
| Cache TTL | 1800 | 3600 | 7200 |
| Pool Size | 5 | 10 | 20 |

### Tuning Guide

1. **Message Batching**
   ```yaml
   performance:
     batch_size: 100        # Increase for higher throughput
     batch_timeout: 5       # Balance latency vs. batching
     message_processing_workers: 4
   ```

2. **Caching**
   ```yaml
   performance:
     cache:
       enabled: true
       max_entries: 10000   # Increase for more cache hits
       ttl: 3600            # Adjust based on data freshness needs
   ```

3. **Connection Pooling**
   ```yaml
   appservice:
     database_opts:
       pool_size: 10        # Match your database capacity
       max_overflow: 20     # Allow burst traffic
       timeout: 30          # Prevent stuck queries
   ```

---

## Security Best Practices

1. **Token Management**
   - Rotate tokens regularly (every 24 hours)
   - Use secure token storage
   - Implement token revocation

2. **Access Control**
   - Restrict bridge access to authorized users
   - Use deny-by-default policies
   - Regular permission audits

3. **Rate Limiting**
   - Configure appropriate limits
   - Monitor for abuse patterns
   - Implement gradual limits

4. **Encryption**
   - Enable E2EE for sensitive rooms
   - Use secure key exchange
   - Regular security updates

---

## Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| Bridge won't start | Check logs: `docker compose logs bridge_telegram` |
| Connection timeouts | Verify homeserver address and network connectivity |
| Rate limit errors | Increase rate limits or reduce message frequency |
| Message sync issues | Check room mappings and permissions |
| High memory usage | Reduce batch size and cache TTL |

### Diagnostic Commands

```bash
# Check service status
docker compose ps

# View logs
docker compose logs -f bridge_telegram

# Check metrics
curl http://localhost:8001/metrics

# Health check
curl http://telegram:8008/health

# Database connection test
docker exec -it bridge_telegram python3 -c "import asyncio; asyncio.run(check_db())"
```

---

## Migration Guide

### Upgrading from v4.1.x

1. **Backup Existing Data**
   ```bash
   docker compose down
   cp -r data data.backup
   ```

2. **Update Configuration**
   ```bash
   # Merge new config options
   # New in v4.2.0:
   # - performance.* section
   # - security.* section
   # - health.* section
   ```

3. **Recreate Services**
   ```bash
   docker compose up -d
   ```

4. **Verify Functionality**
   ```bash
   # Check health endpoints
   # Verify message sync
   # Check metrics
   ```

---

## Support

- **Documentation**: [wiki.rechain.network](https://wiki.rechain.network)
- **Issues**: [GitHub Issues](https://github.com/sorydima/REChain-/issues)
- **Matrix**: [#rechain:matrix.org](https://matrix.to/#/#rechain:matrix.org)
- **Email**: support@rechain.network

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

---

*This document is part of the REChain v4.2.0 release documentation.*
*Last updated: 2025-01-09*

