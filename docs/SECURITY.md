# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in REChain, please report it responsibly:

- **Email:** support@rechain.network
- **Do not** open public issues for security vulnerabilities.
- We will respond as quickly as possible and coordinate a fix.

## Supported Versions
- Only the latest stable release is supported for security updates.

## Best Practices
- Follow secure coding guidelines.
- Use strong authentication and encryption.
- Review dependencies for vulnerabilities.

# Security & Scaling

## RBAC & SSO
- Use `roles.yaml` and RBAC UI for fine-grained permissions
- Secure all APIs and UIs with OAuth2/SSO

## End-to-End Encryption (E2EE)
- Matrix E2EE supported via matrix-nio (see `e2ee_stub.py`)
- Telegram E2EE not available for bots/groups

## High Availability & Scaling
- Use Redis Sentinel/Cluster for HA
- Deploy multiple bridge/API instances (Docker, k8s, Helm, HPA)
- Use persistent volumes for logs/state

## Backup & Restore
- Use `backup.sh`, `restore.sh`, and `verify_backup.sh` for state and logs
- Test restore in staging before production

## Best Practices
- Regularly update dependencies and test backups
- Monitor with Prometheus, Grafana, Sentry, and Alertmanager
- Review and test all plugins before enabling in production

---

Thank you for helping keep REChain and its users safe! 