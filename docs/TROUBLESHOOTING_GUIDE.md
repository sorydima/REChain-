ocs/TROUBLESHOOTING_GUIDE.md</path>
<parameter name="content">
# REChain Troubleshooting Guide

Comprehensive guide for diagnosing and resolving common issues.

## Table of Contents

1. [Quick Diagnostics](#quick-diagnostics)
2. [Service Issues](#service-issues)
3. [Performance Problems](#performance-problems)
4. [Network Issues](#network-issues)
5. [Database Problems](#database-problems)
6. [Federation Issues](#federation-issues)
7. [Bridge Problems](#bridge-problems)
8. [Security Issues](#security-issues)
9. [Log Analysis](#log-analysis)
10. [Recovery Procedures](#recovery-procedures)

---

## Quick Diagnostics

### System Health Check

```bash
#!/bin/bash
# health-check.sh - Quick diagnostics script

echo "=== REChain Health Check ==="
echo "Date: $(date)"
echo ""

# Check service status
echo "Service Status:"
systemctl status rechain --no-pager | head -20
echo ""

# Check listening ports
echo "Listening Ports:"
netstat -tulpn 2>/dev/null | grep -E "(8008|8448)" || ss -tulpn | grep -E "(8008|8448)"
echo ""

# Check disk space
echo "Disk Usage:"
df -h /var/lib/rechain /var/log/rechain
echo ""

# Check memory
echo "Memory Usage:"
free -h
echo ""

# Check database integrity
echo "Database Status:"
sqlite3 /var/lib/rechain/database.db "SELECT count(*) FROM rooms;"
sqlite3 /var/lib/rechain/database.db "SELECT count(*) FROM users;"
echo ""

# Test API endpoint
echo "API Test:"
curl -s http://localhost:8008/_matrix/client/versions | head -5
echo ""

# Check recent errors
echo "Recent Errors:"
journalctl -u rechain -n 50 --no-pager | grep -i error | tail -10
```

### Common Symptoms

| Symptom | Likely Cause | Quick Fix |
|---------|--------------|-----------|
| Service won't start | Port conflict | Change port or stop conflicting service |
| Slow responses | Resource exhaustion | Add RAM or optimize config |
| Cannot federate | Firewall block | Open port 8448 |
| Login fails | Auth service down | Check auth service logs |
| Missing messages | Sync lag | Increase sync timeout |

---

## Service Issues

### Service Won't Start

```bash
# 1. Check logs
sudo journalctl -u rechain -n 100

# 2. Check for port conflicts
sudo lsof -i :8008
sudo lsof -i :8448

# 3. Check permissions
sudo ls -la /var/lib/rechain/
sudo ls -la /var/log/rechain/

# 4. Fix common issues
sudo chown -R rechain:rechain /var/lib/rechain
sudo chown -R rechain:rechain /var/log/rechain
sudo chmod 755 /var/lib/rechain

# 5. Verify database
sqlite3 /var/lib/rechain/database.db "PRAGMA integrity_check;"
sqlite3 /var/lib/rechain/database.db ".recover" > /tmp/recovered.db 2>/dev/null

# 6. Restart service
sudo systemctl restart rechain
```

### Service Crashes Frequently

```bash
# Enable core dumps
sudo systemctl edit rechain
# Add:
# [Service]
# LimitCORE=infinity
# ExecStartPost=

# Check for memory issues
sudo journalctl -u rechain | grep -i "memory|core|oom"

# Check system logs
dmesg | grep -i "oom|kill"

# Monitor resource usage
htop
iotop -n 3
```

### Service Starts But No Response

```bash
# Test locally
curl -v http://localhost:8008/_matrix/client/versions

# Check if binding correctly
netstat -tulpn | grep LISTEN | grep rechain

# Test with different port
curl -v http://localhost:8009/health

# Check firewall
sudo ufw status

# Check SELinux (RHEL/CentOS)
sudo getenforce
sudo setenforce 0  # Temporary fix
```

---

## Performance Problems

### Slow Response Times

```yaml
# Check current configuration
server:
  workers: 0  # Should be higher for production
  
database:
  options:
    pool_size: 10  # Increase for more connections
    max_overflow: 20
```

```bash
# Check system resources
htop
iostat -x 1 10
vmstat 1 10

# Check I/O performance
sudo iotop -b -n 3
sudo hdparm -tT /dev/sda

# Check network performance
speedtest-cli
netstat -i

# Check database performance
sqlite3 /var/lib/rechain/database.db "PRAGMA cache_size;"
sqlite3 /var/lib/rechain/database.db "PRAGMA journal_mode;"

# Check cache hit rate
redis-cli info stats | grep -E "hit|miss"
```

### High Memory Usage

```bash
# Check process memory
ps aux | grep rechain | awk '{print $2, $4, $6, $11}'

# Check memory by component
curl http://localhost:9090/metrics | grep rechain_memory

# Reduce memory usage
# Edit /etc/rechain/config.yaml
database:
  options:
    pool_size: 5  # Reduce from 20

# Add swap if needed
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Restart service
sudo systemctl restart rechain
```

### High CPU Usage

```bash
# Identify CPU-intensive processes
top -c
htop

# Check for specific threads
ps -T -p $(pgrep rechain)

# Monitor over time
sar -u 1 60

# Check for database queries
sqlite3 /var/lib/rechain/database.db ".timer ON"
-- Run query
```

---

## Network Issues

### Cannot Connect to Server

```bash
# Test basic connectivity
ping matrix.your-domain.com

# Test port connectivity
nc -zv localhost 8008
nc -zv matrix.your-domain.com 8008

# Check DNS resolution
dig matrix.your-domain.com
nslookup matrix.your-domain.com

# Check firewall rules
sudo iptables -L -n
sudo ufw status verbose

# Check proxy settings
env | grep -i proxy
curl -v http://localhost:8008
```

### Federation Not Working

```bash
# Test federation endpoint
curl -k https://localhost:8448/_matrix/key/v2/server/test

# Check federation port
nc -zv localhost 8448

# Verify TLS certificate
openssl s_client -connect localhost:8448 -servername matrix.your-domain.com

# Check DNS records
dig _matrix._tcp.matrix.your-domain.com SRV

# Test remote federation
curl -k https://another-server.com/_matrix/key/v2/server/test

# Check blocked lists
# Verify not on blocklist.example.com
```

### DNS Resolution Problems

```bash
# Check DNS configuration
cat /etc/resolv.conf

# Test internal resolution
getent hosts matrix.your-domain.com

# Check for DNS leaks
dig +short myip.opendns.com @resolver1.opendns.com

# Flush DNS cache (if applicable)
sudo systemd-resolve --flush-caches  # systemd-resolved
sudo killall -HUP dnsmasq  # dnsmasq
sudo resolvectl flush-caches  # systemd-resolve
```

---

## Database Problems

### Database Corruption

```bash
# Stop service
sudo systemctl stop rechain

# Backup current database
cp /var/lib/rechain/database.db /var/lib/rechain/database.db.bak

# Check integrity
sqlite3 /var/lib/rechain/database.db "PRAGMA integrity_check;"

# Attempt recovery
sqlite3 /var/lib/rechain/database.db ".recover" > /tmp/recovered.db

# If recovery works
mv /tmp/recovered.db /var/lib/rechain/database.db

# If recovery fails, restore from backup
cp /var/lib/rechain/database.db.bak /var/lib/rechain/database.db

# Fix permissions
sudo chown rechain:rechain /var/lib/rechain/database.db

# Start service
sudo systemctl start rechain
```

### Database Locked Errors

```bash
# Check for running queries
sqlite3 /var/lib/rechain/database.db "SELECT * FROM sqlite_master;"

# Kill hanging connections
sudo pkill -9 -f rechain

# Remove stale lock files
sudo rm -f /var/lib/rechain/database.db-journal
sudo rm -f /var/lib/rechain/database.db-wal
sudo rm -f /var/lib/rechain/database.db-shm

# Restart service
sudo systemctl start rechain
```

### Slow Database Queries

```bash
# Enable query logging
sqlite3 /var/lib/rechain/database.db ".timer ON"

# Analyze tables
sqlite3 /var/lib/rechain/database.db "ANALYZE;"

# Check for missing indexes
sqlite3 /var/lib/rechain/database.db ".indices"

# Optimize database
sqlite3 /var/lib/rechain/database.db "VACUUM;"

# Add performance settings to config
database:
  options:
    cache_size: -64000  # 64MB cache
    synchronous: normal  # Faster than full
    journal_mode: wal    # Better concurrency
```

---

## Federation Issues

### Remote Servers Not Syncing

```bash
# Check federation status
curl -k https://localhost:8448/_matrix/key/v2/server/test

# Verify signing key
cat /etc/rechain/fed_signing_key

# Check key distribution
curl -k https://localhost:8448/_matrix/key/v2/server/your-server

# Test perspective servers
curl -k https://perspective.example.com/_matrix/key/v2/server/your-server

# Check federation rate limits
# Edit config
federation:
  rate_limit:
    requests_per_second: 10  # Increase if needed
```

### Federation Certificate Errors

```bash
# Check certificate expiration
openssl x509 -enddate -noout -in /etc/rechain/tls/cert.pem

# Verify certificate chain
openssl verify -CAfile /etc/ssl/certs/ca-certificates.crt /etc/rechain/tls/cert.pem

# Regenerate self-signed certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/rechain/tls/key.pem \
  -out /etc/rechain/tls/cert.pem \
  -subj "/CN=matrix.your-domain.com"

# Restart service
sudo systemctl restart rechain
```

### Room State Conflicts

```bash
# Check room state
curl -k http://localhost:8008/_matrix/client/r0/rooms/!roomid:domain/_state

# Force state resolution
# Edit room state via admin API
curl -X POST http://localhost:8008/_synapse/admin/v1/rooms/!roomid/state \
  -H "Authorization: Bearer <admin_token>" \
  -d '{
    "event_type": "m.room.aliases",
    "content": {}
  }'
```

---

## Bridge Problems

### Bridge Connection Failures

```bash
# Check bridge service status
sudo systemctl status rechain-bridge-telegram

# Check bridge logs
sudo journalctl -u rechain-bridge-telegram -n 50

# Test bridge endpoint
curl http://localhost:29328/_matrix/app/v1/ping

# Verify bridge configuration
cat /etc/rechain/bridges/telegram.yaml

# Restart bridge
sudo systemctl restart rechain-bridge-telegram
```

### Message Sync Issues

```bash
# Check bridge sync status
curl http://localhost:29328/_matrix/app/v1/bridge_status

# Check for errors in logs
sudo journalctl -u rechain-bridge-telegram | grep -i error

# Verify room mappings
sqlite3 /var/lib/bridge/database.db "SELECT * FROM room_mappings;"

# Restart sync
sudo systemctl restart rechain-bridge-telegram
```

---

## Security Issues

### Unauthorized Access

```bash
# Check recent login attempts
sudo journalctl -u rechain | grep "login|failed|authentication"

# Check for suspicious IPs
sudo cat /var/log/rechain/rechain.log | jq 'select(.type == "login_failed")'

# Block suspicious IP
sudo ufw insert 1 deny from <suspicious_ip>

# Revoke all sessions
curl -X POST http://localhost:8008/_synapse/admin/v1/session \
  -H "Authorization: Bearer <admin_token>" \
  -d '{"delete_sessions": true}'

# Force password reset for user
curl -X POST http://localhost:8008/_synapse/admin/v1/reset_password \
  -H "Authorization: Bearer <admin_token>" \
  -d '{"user_id": "@user:domain", "new_password": "<temp_password>"}'
```

### Certificate Expiration

```bash
# Check all certificates
find /etc/rechain/tls -name "*.pem" -exec openssl x509 -enddate -noout -in {} \;

# Set up auto-renewal (Let's Encrypt)
sudo certbot renew --dry-run

# Add to cron
# 0 0 * * * /usr/bin/certbot renew --quiet
```

---

## Log Analysis

### Common Log Patterns

```bash
# Failed login attempts
grep "Failed login" /var/log/rechain/rechain.log

# Database errors
grep -i "database\|sql\|query" /var/log/rechain/rechain.log

# Federation issues
grep -i "federation\|server\_server" /var/log/rechain/rechain.log

# Performance warnings
grep -i "timeout\|slow\|latency" /var/log/rechain/rechain.log

# Bridge errors
grep -i "bridge\|telegram\|discord" /var/log/rechain/rechain.log
```

### Log Format Parsing

```bash
# JSON log parsing with jq
cat /var/log/rechain/rechain.log | jq '. | select(.level == "ERROR")'

# Filter by time range
jq 'select(.timestamp >= "2024-01-15T10:00:00Z" and .timestamp <= "2024-01-15T11:00:00Z")'

# Count error types
cat /var/log/rechain/rechain.log | jq -r '.type' | sort | uniq -c | sort -rn

# Extract user actions
cat /var/log/rechain/rechain.log | jq '. | select(.user_id != null)'
```

### Log Rotation

```bash
# Check log rotation configuration
cat /etc/logrotate.d/rechain

# Force log rotation
sudo logrotate -f /etc/logrotate.d/rechain

# Check for large log files
find /var/log/rechain -type f -size +100M
```

---

## Recovery Procedures

### Full System Recovery

```bash
#!/bin/bash
# recovery.sh - Full recovery script

BACKUP_DATE="$1"

if [ -z "$BACKUP_DATE" ]; then
    echo "Usage: ./recovery.sh <backup_date> (e.g., 20240115)"
    exit 1
fi

BACKUP_DIR="/backup/rechain/rechain_${BACKUP_DATE}"

echo "=== REChain Recovery ==="
echo "Backup: $BACKUP_DIR"
echo ""

# Stop services
echo "Stopping services..."
sudo systemctl stop rechain
sudo systemctl stop redis

# Backup current state
echo "Backing up current state..."
mkdir -p /tmp/recovery_old
cp -r /var/lib/rechain /tmp/recovery_old/
cp -r /etc/rechain /tmp/recovery_old/

# Restore data
echo "Restoring data..."
rm -rf /var/lib/rechain
rm -rf /etc/rechain

tar -xzf ${BACKUP_DIR}/rechain_data.tar.gz -C /
tar -xzf ${BACKUP_DIR}/rechain_config.tar.gz -C /

# Fix permissions
echo "Fixing permissions..."
sudo chown -R rechain:rechain /var/lib/rechain
sudo chown -R root:root /etc/rechain
sudo chmod 755 /etc/rechain

# Start services
echo "Starting services..."
sudo systemctl start redis
sudo systemctl start rechain

# Verify
echo "Verifying recovery..."
curl -s http://localhost:8008/_matrix/client/versions

echo ""
echo "Recovery complete!"
echo "Review logs: sudo journalctl -u rechain -f"
```

### Partial Recovery

```bash
# Restore only database
sudo systemctl stop rechain
sqlite3 /var/lib/rechain/database.db ".restore /backup/rechain_<date>/database.db"
sudo systemctl start rechain

# Restore only config
sudo systemctl stop rechain
cp /backup/rechain_<date>/config.yaml /etc/rechain/config.yaml
sudo systemctl start rechain

# Restore specific room
sqlite3 /var/lib/rechain/database.db \
  "DELETE FROM rooms WHERE room_id = '!roomid:domain';"
sqlite3 /var/lib/rechain/database.db \
  ".import /backup/room_data.csv rooms"
```

### Emergency Mode

```bash
# Start in minimal mode
sudo systemctl edit rechain
# Add:
# [Service]
# Environment="RECHAIN_MODE=minimal"

sudo systemctl daemon-reload
sudo systemctl restart rechain

# Emergency commands available in minimal mode:
# /usr/bin/rechainctl --help
```

---

## Getting Help

### Before Submitting Issue

1. Run health check script
2. Collect relevant logs
3. Document error messages
4. Note environment details

### Collect Debug Information

```bash
#!/bin/bash
# collect-debug.sh - Debug information collector

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
DEBUG_DIR="/tmp/rechain_debug_${TIMESTAMP}"

mkdir -p $DEBUG_DIR

# System information
echo "=== System Info ===" > $DEBUG_DIR/system.txt
uname -a >> $DEBUG_DIR/system.txt
cat /etc/os-release >> $DEBUG_DIR/system.txt

# Service configuration
echo "=== Configuration ===" > $DEBUG_DIR/config.txt
cat /etc/rechain/config.yaml >> $DEBUG_DIR/config.txt 2>/dev/null

# Logs
echo "=== Logs (last 500 lines) ===" > $DEBUG_DIR/logs.txt
journalctl -u rechain -n 500 >> $DEBUG_DIR/logs.txt 2>/dev/null

# Database stats
echo "=== Database Stats ===" > $DEBUG_DIR/database.txt
sqlite3 /var/lib/rechain/database.db ".stats" >> $DEBUG_DIR/database.txt 2>/dev/null

# Compress
tar -czf /tmp/rechain_debug_${TIMESTAMP}.tar.gz $DEBUG_DIR

echo "Debug archive created: /tmp/rechain_debug_${TIMESTAMP}.tar.gz"
```

### Support Channels

- **GitHub Issues**: https://github.com/sorydima/REChain-/issues
- **Matrix Support**: #rechain:rechain.network
- **Email**: support@rechain.network

When submitting an issue, include:
- Debug archive (if applicable)
- REChain version: `rechain --version`
- Operating system and version
- Steps to reproduce
- Expected vs actual behavior
