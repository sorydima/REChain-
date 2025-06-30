# Security Best Practices

## Secure Coding
- Validate all user input and sanitize outputs
- Avoid hardcoding secrets or credentials in code
- Use parameterized queries for database access

## Authentication & Authorization
- Use strong authentication (OAuth, Web3, etc.)
- Enforce least privilege for API tokens and keys
- Rotate secrets regularly

## Encryption
- Use HTTPS/TLS for all network communication
- Encrypt sensitive data at rest and in transit

## Dependency Management
- Regularly update dependencies
- Use tools to check for vulnerabilities (e.g., `flutter pub outdated`)

## Responsible Disclosure
- Report vulnerabilities privately (see [SECURITY.md](../docs/SECURITY.md))

---

For more, see [Best-Practices.md](Best-Practices.md) and [docs/SECURITY.md](../docs/SECURITY.md). 