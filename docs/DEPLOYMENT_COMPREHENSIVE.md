# REChain Deployment Guide

Complete guide for deploying REChain in production environments.

## Table of Contents

1. [Planning](#planning)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [Security](#security)
6. [Monitoring](#monitoring)
7. [Maintenance](#maintenance)
8. [Troubleshooting](#troubleshooting)

---

## Planning

### Deployment Models

#### Single Server
- Best for: Small teams, development, testing
- Cost: Low
- Complexity: Minimal

#### High Availability
- Best for: Production, enterprise
- Cost: High
- Complexity: Moderate

#### Distributed
- Best for: Large scale, global deployments
- Cost: Very high
- Complexity: High

### Network Planning

```
Internet ───► [Firewall:443] ───► [Reverse Proxy] ───► [REChain:8008]
                     │
                     ▼
            [Firewall:8448] ───► [Federation]
```

---

## Requirements

### Hardware Requirements

| Deployment | CPU | RAM | Storage | Network |
|------------|-----|-----|---------|---------|
| Minimal | 2 cores | 2GB | 20GB SSD | 100Mbps |
| Standard | 4 cores | 8GB | 100GB SSD | 1Gbps |
| Production | 8+ cores | 16GB+ | 500GB+ SSD | 10Gbps |

### Software Requirements

- **OS**: Ubuntu 20.04/22.04, Debian 11+, RHEL 8+
- **Runtime**: Dart SDK 3.0+
- **Database**: SQLite 3.35+ or PostgreSQL 14+
- **Cache**: Redis 6.2+
- **Web Server**: Traefik 2.x or Nginx 1.20+

### Network Requirements

- Port 8008 (Client API)
- Port 8448 (Federation)
- Port 443 (HTTPS)
- Outbound access for federation

---

## Installation

### Option 1: Docker (Recommended)

```bash
# Create directories
mkdir -p /var/rechain/{data,logs,config}

# Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: '3.8'
services:
  rechain:
    image: rechain/rechain:latest
    container_name: rechain
    restart: unless-stopped
    ports:
      - "8008:8008"
      - "8448:8448"
    volumes:
      - ./config:/etc/rechain
      - rechain_data:/var/lib/rechain
      - rechain_logs:/var/log/rechain
    environment:
      - SYNAPSE_SERVER_NAME=matrix.example.com
      - SYNAPSE_REPORT_STATS=no
    networks:
      - rechain_network

  redis:
    image: redis:7-alpine
    restart: unless-stopped
    volumes:
      - redis_data:/data
    networks:
      - rechain_network

volumes:
  rechain_data:
  rechain_logs:
  redis_data:

networks:
  rechain_network:
    driver: bridge
EOF

# Start services
docker compose up -d
```

### Option 2: Binary Installation

```bash
# Download release
wget https://rechain.network/releases/rechain-4.2.0-linux-x86_64.tar.gz
tar -xzf rechain-4.2.0-linux-x86_64.tar.gz
cd rechain-4.2.0

# Install
sudo ./install.sh

# Configure
sudo nano /etc/rechain/config.yaml

# Start service
sudo systemctl start rechain
sudo systemctl enable rechain
```

### Option 3: Source Installation

```bash
# Install dependencies
sudo apt-get update
sudo apt-get install -y build-essential git dart

# Clone repository
git clone https://github.com/sorydima/REChain-.git
cd REChain-

# Build
cd dist && ./build.sh --release

# Install
sudo ./install.sh
```

---

## Configuration

### Basic Configuration

```yaml
# /etc/rechain/config.yaml
server:
  host: "0.0.0.0"
  port: 8008
  workers: 0  # Auto-detect

database:
  type: "sqlite"
  path: "/var/lib/rechain/database.db"

logging:
  level: "info"
  format: "json"
```

### Production Configuration

```yaml
server:
  host: "0.0.0.0"
  port: 8008
  workers: 4
  max_request_size: 52428800  # 50MB

database:
  type: "postgres"
  connection_string: "postgresql://user:pass@localhost/rechain"
  pool_size: 20

redis:
  host: "localhost"
  port: 6379

logging:
  level: "info"
  format: "json"
  output: "file"
  file:
    path: "/var/log/rechain/rechain.log"
    max_size: 104857600  # 100MB
    backup_count: 10

security:
  tls:
    enabled: true
    cert_path: "/etc/rechain/tls/cert.pem"
    key_path: "/etc/rechain/tls/key.pem"

metrics:
  enabled: true
  port: 9090
```

### Federation Configuration

```yaml
federation:
  enabled: true
  server_name: "matrix.example.com"
  port: 8448
  signing_key:
    path: "/etc/rechain/fed_signing_key"
  rate_limit:
    enabled: true
    requests_per_second: 20
```

---

## Security

### TLS/SSL Setup

```bash
# Using Let's Encrypt
sudo certbot certonly --standalone -d matrix.example.com
sudo cp /etc/letsencrypt/live/matrix.example.com/fullchain.pem /etc/rechain/tls/cert.pem
sudo cp /etc/letsencrypt/live/matrix.example.com/privkey.pem /etc/rechain/tls/key.pem
```

### Firewall Configuration

```bash
# UFW example
sudo ufw allow 22/tcp
sudo ufw allow 443/tcp
sudo ufw allow 8008/tcp
sudo ufw allow 8448/tcp
sudo ufw enable
```

### Rate Limiting

```yaml
security:
  rate_limit:
    enabled: true
    requests_per_minute: 100
    burst_size: 200
```

### Fail2Ban

```bash
# /etc/fail2ban/filter.d/rechain.conf
[Definition]
failregex = .*Failed login attempt from <HOST>.*
ignoreregex =

# /etc/fail2ban/jail.local
[rechain]
enabled = true
filter = rechain
port = 8008,8448
logpath = /var/log/rechain/rechain.log
maxretry = 5
bantime = 3600
```

---

## Monitoring

### Prometheus Metrics

Enable metrics in config:

```yaml
metrics:
  enabled: true
  port: 9090
  path: "/metrics"
```

Sample Prometheus configuration:

```yaml
scrape_configs:
  - job_name: 'rechain'
    static_configs:
      - targets: ['localhost:9090']
```

### Grafana Dashboard

Import the REChain dashboard from [Grafana Dashboard ID: 12345](https://grafana.com/rechain/)

### Health Checks

```bash
# Check health endpoint
curl http://localhost:8009/health

# Check API versions
curl http://localhost:8008/_matrix/client/versions
```

### Log Monitoring

```bash
# View logs
sudo journalctl -u rechain -f

# View last 100 lines
sudo journalctl -u rechain -n 100

# Search for errors
sudo journalctl -u rechain | grep -i error
```

---

## Maintenance

### Daily Tasks

```bash
# Check service status
sudo systemctl status rechain

# Verify disk space
df -h /var/lib/rechain

# Check logs for errors
sudo journalctl -u rechain --since "1 day ago" | grep -i error
```

### Weekly Tasks

```bash
# Rotate logs
sudo logrotate /etc/logrotate.d/rechain

# Check database integrity
sqlite3 /var/lib/rechain/database.db "PRAGMA integrity_check;"

# Review metrics
curl http://localhost:9090/metrics | grep rechain
```

### Monthly Tasks

```bash
# Create backup
sudo systemctl stop rechain
cp -r /var/lib/rechain /backup/rechain-$(date +%Y%m%d)
sudo systemctl start rechain

# Review and clean old backups
ls -la /backup/rechain-*/

# Update certificates (if using Let's Encrypt)
sudo certbot renew --dry-run
```

### Updates

```bash
# Check for updates
sudo apt-get update && apt list --upgradable | grep rechain

# Update (binary)
wget https://rechain.network/releases/rechain-4.2.1-linux-x86_64.tar.gz
tar -xzf rechain-4.2.1-linux-x86_64.tar.gz
sudo ./install.sh

# Update (Docker)
docker pull rechain/rechain:latest
docker compose down
docker compose up -d
```

---

## Troubleshooting

### Service Won't Start

```bash
# Check logs
sudo journalctl -u rechain -n 50

# Common issues:
# 1. Port in use
sudo lsof -i :8008

# 2. Permission errors
sudo chown -R rechain:rechain /var/lib/rechain

# 3. Database corruption
sudo systemctl stop rechain
sqlite3 /var/lib/rechain/database.db ".recover" > /tmp/recovered.db
mv /var/lib/rechain/database.db /var/lib/rechain/database.db.bak
mv /tmp/recovered.db /var/lib/rechain/database.db
sudo systemctl start rechain
```

### Slow Performance

```bash
# Check system resources
htop
iotop

# Check database performance
sqlite3 /var/lib/rechain/database.db "PRAGMA journal_mode;"
sqlite3 /var/lib/rechain/database.db "SELECT count(*) FROM rooms;"

# Check cache hit rate
redis-cli info stats | grep hit_rate
```

### Federation Issues

```bash
# Test federation
curl -k https://localhost:8448/_matrix/key/v2/server/test

# Check federation logs
sudo journalctl -u rechain | grep -i federation

# Verify TLS certificate
openssl s_client -connect localhost:8448
```

### Bridge Connection Issues

```bash
# Check bridge status
curl http://localhost:8008/_matrix/client/versions

# Check bridge logs
sudo journalctl -u rechain-bridge-telegram -n 50

# Verify bridge configuration
cat /etc/rechain/bridges/telegram.yaml
```

---

## Performance Tuning

### Database Optimization

```sql
-- For SQLite
PRAGMA journal_mode = WAL;
PRAGMA synchronous = normal;
PRAGMA cache_size = -64000;
PRAGMA temp_store = memory;

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_events_room ON events(room_id);
CREATE INDEX IF NOT EXISTS idx_events_user ON events(sender);
```

### System Tuning

```bash
# /etc/sysctl.conf
net.core.somaxconn = 65535
net.ipv4.tcp_max_syn_backlog = 65535
vm.swappiness = 10

# Apply changes
sudo sysctl -p
```

### REChain Configuration

```yaml
server:
  workers: 4
  connection_timeout: 60
  keepalive_timeout: 75

database:
  options:
    pool_size: 20
    max_overflow: 40

redis:
  max_connections: 100
```

---

## Backup and Recovery

### Backup Script

```bash
#!/bin/bash
# /usr/local/bin/backup-rechain.sh

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backup/rechain"
DATA_DIR="/var/lib/rechain"
LOG_DIR="/var/log/rechain"

# Stop service
sudo systemctl stop rechain

# Create backup
tar -czf ${BACKUP_DIR}/rechain_${DATE}.tar.gz \
    ${DATA_DIR} \
    /etc/rechain \
    ${LOG_DIR}/rechain.log

# Start service
sudo systemctl start rechain

# Cleanup old backups (keep 7 days)
find ${BACKUP_DIR} -name "rechain_*.tar.gz" -mtime +7 -delete
```

### Recovery Procedure

```bash
# Stop service
sudo systemctl stop rechain

# Restore data
tar -xzf /backup/rechain/rechain_20240115_120000.tar.gz -C /

# Fix permissions
sudo chown -R rechain:rechain /var/lib/rechain
sudo chown -R root:root /etc/rechain
sudo chmod 755 /etc/rechain

# Start service
sudo systemctl start rechain
```

---

## Support

- **Documentation**: https://docs.rechain.network
- **GitHub**: https://github.com/sorydima/REChain-/issues
- **Matrix**: #rechain:rechain.network
- **Email**: support@rechain.network
