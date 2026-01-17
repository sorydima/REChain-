# REChain Security Hardening Guide

Comprehensive security configuration for production deployments.

## Table of Contents

1. [Security Principles](#security-principles)
2. [Network Security](#network-security)
3. [Authentication](#authentication)
4. [Encryption](#encryption)
5. [Access Control](#access-control)
6. [Audit Logging](#audit-logging)
7. [Incident Response](#incident-response)
8. [Compliance](#compliance)

---

## Security Principles

### Defense in Depth

```
Layer 1: Network ─────► Layer 2: Application ─────► Layer 3: Data
┌─────────────────┐    ┌───────────────────────┐   ┌─────────────────┐
│ Firewall, WAF   │    │ Authentication, TLS   │   │ Encryption      │
│ Rate Limiting   │    │ Input Validation      │   │ Access Control  │
│ IDS/IPS         │    │ Session Management    │   │ Backup          │
└─────────────────┘    └───────────────────────┘   └─────────────────┘
```

### Zero Trust Model

```yaml
# Always verify, never trust
security:
  authentication:
    method: "multi_factor"
    require_verification: true
    session_timeout: 3600
    
  network:
    trust_internal: false
    verify_federation: true
```

---

## Network Security

### Firewall Configuration

```bash
# UFW Configuration
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp comment 'SSH'
sudo ufw allow 443/tcp comment 'HTTPS'
sudo ufw allow 8008/tcp comment 'Client API'
sudo ufw allow 8448/tcp comment 'Federation'
sudo ufw enable
```

### Traefik Security Headers

```yaml
# traefik_dynamic.toml
[http.middlewares.security.headers]
  [http.middlewares.security.headers.customFrameOptionsValue]
    value = "SAMEORIGIN"
  [http.middlewares.security.headers.stsSeconds]
    value = 31536000
  [http.middlewares.security.headers.stsIncludeSubdomains]
    value = true
  [http.middlewares.security.headers.contentTypeNosniff]
    value = true
  [http.middlewares.security.headers.browserXSSFilter]
    value = true
  [http.middlewares.security.headers.referrerPolicy]
    value = "strict-origin-when-cross-origin"
```

### Rate Limiting

```yaml
# Application-level rate limiting
security:
  rate_limit:
    enabled: true
    global:
      requests_per_minute: 1000
      burst_size: 2000
    per_user:
      requests_per_minute: 60
      burst_size: 100
    per_room:
      messages_per_minute: 100
```

### DDoS Protection

```yaml
# Cloudflare/Traefik DDoS protection
security:
  ddos_protection:
    enabled: true
    threshold: 10000  # requests per minute
    block_duration: 3600  # seconds
    rules:
      - pattern: "^/.*(curl|wget|python)"
        action: block
```

---

## Authentication

### Multi-Factor Authentication

```yaml
security:
  authentication:
    methods:
      - password
      - totp
      - webhook  # SSO integration
      
    mfa:
      enabled: true
      backup_codes: 10
      totp_issuer: "REChain"
      
    password:
      min_length: 16
      require_uppercase: true
      require_lowercase: true
      require_number: true
      require_special: true
      max_age: 90  # days
      history: 12  # previous passwords
```

### Session Management

```yaml
security:
  sessions:
    timeout: 3600  # 1 hour
    absolute_timeout: 86400  # 24 hours
    concurrent_limit: 5
    device_management: true
    rotation_interval: 3600
```

### Token Configuration

```yaml
security:
  tokens:
    algorithm: "RS256"  # Asymmetric keys
    access_token_expiry: 3600
    refresh_token_expiry: 604800  # 7 days
    signing_key:
      path: "/etc/rechain/jwt_signing_key"
      rotation: 2592000  # 30 days
```

### SSO Integration

```yaml
security:
  sso:
    enabled: true
    providers:
      - type: "oidc"
        issuer: "https://sso.example.com"
        client_id: "rechain"
        client_secret: "__SECRET__"
        scopes:
          - openid
          - profile
          - email
        groups_claim: "groups"
        admin_groups:
          - "rechain-admins"
```

---

## Encryption

### TLS Configuration

```yaml
security:
  tls:
    enabled: true
    min_version: "TLSv1.3"
    cipher_suites:
      - "TLS_AES_256_GCM_SHA384"
      - "TLS_CHACHA20_POLY1305_SHA256"
      - "TLS_AES_128_GCM_SHA256"
    certificate:
      path: "/etc/rechain/tls/cert.pem"
      key_path: "/etc/rechain/tls/key.pem"
      reload_interval: 86400
```

### End-to-End Encryption

```yaml
security:
  e2ee:
    enabled: true
    default_algorithm: "m.megolm.v1.aes-sha2"
    per_room_algorithm: true
    include_pattern:
      - ".*"  # All rooms by default
    exclude_pattern:
      - "admin-.*"
      - "support-.*"
    device_verification: "strict"
```

### Encryption at Rest

```yaml
security:
  encryption:
    at_rest:
      enabled: true
      algorithm: "AES-256-GCM"
      key_file: "/etc/rechain/db_key.bin"
      key_rotation: 2592000  # 30 days
```

### Database Encryption

```sql
-- Enable WAL mode for encryption
PRAGMA journal_mode = WAL;

-- Set encryption key (SQLite extension)
PRAGMA key = "x'developer_key_here'";
```

---

## Access Control

### Role-Based Access Control

```yaml
security:
  rbac:
    enabled: true
    roles:
      admin:
        permissions:
          - "*"  # All permissions
        users:
          - "@admin:your.domain.tld"
      moderator:
        permissions:
          - "room:write"
          - "room:moderate"
          - "user:kick"
          - "user:ban"
        users: []
      user:
        permissions:
          - "room:join"
          - "room:write"
          - "user:profile:read"
```

### Room Permissions

```yaml
rooms:
  defaults:
    # Default power levels
    power_levels:
      users:
        default: 0
        moderator: 50
        admin: 100
      events:
        default: 0
        room.avatar: 50
        room.name: 50
        room.message: 0
        room.encrypted: 0
      state_default: 50
      ban: 50
      kick: 50
      redact: 50
```

### Federation Access Control

```yaml
federation:
  access_control:
    allow_list:
      - "trusted-server-1.com"
      - "trusted-server-2.com"
    deny_list:
      - "blocked-server.com"
    policy: "allow_list"  # or "deny_list"
```

---

## Audit Logging

### Logging Configuration

```yaml
logging:
  level: "info"
  format: "json"
  audit:
    enabled: true
    path: "/var/log/rechain/audit.log"
    events:
      - user_login
      - user_logout
      - user_created
      - user_deleted
      - password_changed
      - mfa_enabled
      - room_created
      - room_deleted
      - user_kicked
      - user_banned
      - message_deleted
      - permissions_changed
      - config_changed
```

### Log Analysis

```bash
# Search for failed login attempts
grep "login failed" /var/log/rechain/audit.log

# Search for permission changes
grep "permissions_changed" /var/log/rechain/audit.log

# Search for user actions
grep "user_deleted" /var/log/rechain/audit.log | jq '.user_id'
```

### SIEM Integration

```yaml
logging:
  siem:
    enabled: true
    endpoint: "https://siem.example.com/ingest"
    api_key: "__SECRET__"
    batch_size: 100
    flush_interval: 60
```

---

## Incident Response

### Security Monitoring

```yaml
security:
  monitoring:
    enabled: true
    alerts:
      - name: "failed_logins"
        condition: "rate > 10 per minute"
        severity: "high"
        action: "notify_admin"
      - name: "unusual_activity"
        condition: "user_activity > 1000 events/hour"
        severity: "medium"
        action: "log"
      - name: "config_change"
        condition: "event_type == 'config_changed'"
        severity: "high"
        action: "audit"
```

### Incident Response Plan

```bash
#!/bin/bash
# /usr/local/bin/rechain-incident-response.sh

# 1. Capture current state
echo "=== REChain Incident Response ===" > /tmp/incident_$(date +%Y%m%d_%H%M%S).log
echo "Time: $(date)" >> /tmp/incident_*.log
echo "" >> /tmp/incident_*.log

# 2. Capture logs
journalctl -u rechain --since "1 hour ago" > /tmp/rechain_logs.log

# 3. Capture network connections
netstat -tulpn > /tmp/network_connections.log

# 4. Capture process list
ps auxf > /tmp/process_list.log

# 5. Compress evidence
tar -czf /tmp/incident_evidence_$(date +%Y%m%d_%H%M%S).tar.gz \
    /tmp/incident_*.log \
    /tmp/rechain_logs.log \
    /tmp/network_connections.log \
    /tmp/process_list.log

echo "Evidence saved to /tmp/incident_evidence_*.tar.gz"
```

### Emergency Procedures

```bash
# 1. Block suspicious IP
sudo ufw insert 1 deny from <suspicious_ip>

# 2. Disable federation temporarily
# Edit /etc/rechain/config.yaml
federation:
  enabled: false

# 3. Restart service
sudo systemctl restart rechain

# 4. Revoke all user sessions
# Via admin API
curl -X POST http://localhost:8008/_synapse/admin/v1/session \
  -H "Authorization: Bearer <admin_token>" \
  -d '{"delete_sessions": true}'
```

---

## Compliance

### GDPR Compliance

```yaml
compliance:
  gdpr:
    enabled: true
    data_retention:
      personal_data: 365  # days
      message_history: 730  # days
      logs: 90  # days
    data_export:
      enabled: true
      format: "json"
    data_deletion:
      enabled: true
      method: "secure_wipe"
      verification: true
```

### Audit Trail

```yaml
compliance:
  audit:
    enabled: true
    retention: 2555  # 7 years
    integrity_check: true
    hash_algorithm: "SHA-256"
```

### Security Standards

```yaml
compliance:
  standards:
    - name: "SOC2"
      enabled: true
      requirements:
        - "access_control"
        - "encryption"
        - "monitoring"
        - "incident_response"
    - name: "ISO27001"
      enabled: true
      requirements:
        - "information_security"
        - "cryptography"
        - "operations_security"
```

---

## Security Checklist

### Pre-Deployment

- [ ] TLS certificates installed
- [ ] Firewall configured
- [ ] Rate limiting enabled
- [ ] Strong passwords required
- [ ] MFA available
- [ ] Audit logging enabled
- [ ] Backup system configured
- [ ] SSL/TLS score A+ (test with SSL Labs)

### Post-Deployment

- [ ] Security scan completed
- [ ] Penetration test passed
- [ ] Monitoring alerts configured
- [ ] Incident response plan documented
- [ ] Access review scheduled
- [ ] Key rotation configured
- [ ] Documentation updated

### Ongoing

- [ ] Weekly log review
- [ ] Monthly access audit
- [ ] Quarterly penetration test
- [ ] Annual security review
- [ ] Certificate renewal tracking
- [ ] Incident response drills

---

## References

- [OWASP Security Guidelines](https://owasp.org)
- [Matrix Security Documentation](https://matrix.org/docs/guides/security)
- [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks)
