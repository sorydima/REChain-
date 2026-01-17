ocs_for_landing/SECURITY.md</path>
<parameter name="content"># REChain Security

REChain is built with security as a core principle. Learn how we protect your data and privacy.

## Our Security Philosophy

1. **Privacy First**: We cannot read your messages
2. **Encryption Standard**: Industry-leading E2E encryption
3. **Transparency**: Open source code for audit
4. **Your Data, Your Control**: You decide who sees what
5. **Defense in Depth**: Multiple security layers

## End-to-End Encryption

REChain uses Olm/Megolm encryption, the gold standard for secure messaging.

### How It Works

```
Alice's Device                     REChain Server                    Bob's Device
     │                                    │                                 │
     │  Generate key pair                 │                                 │
     │───────────────────────────────────>│                                 │
     │                                    │                                 │
     │  Send public key ─────────────────┼─────────────────────────────────>│
     │                                    │                                 │
     │                                    │  Generate key pair              │
     │                                    │<─────────────────────────────────│
     │                                    │                                 │
     │<───────────────────────────────────│  Send public key ───────────────│
     │                                    │                                 │
     │  Create encrypted message ────────┼─────────────────────────────────>│
     │  (Only Bob can decrypt)           │                                 │
```

### Encryption Features

| Feature | Description |
|---------|-------------|
| **Olm** | Key agreement protocol |
| **Megolm** | Group chat encryption |
| **Cross-Signing** | Verify user identity |
| **Key Backup** | Encrypted backup of keys |
| **Key Verification** | QR or emoji verification |

### Encryption Status

| Room Type | Encryption |
|-----------|------------|
| Direct Messages | Optional (recommended) |
| Group Chats | Optional |
| Public Rooms | Not encrypted |

### Enable Encryption

1. Open room settings
2. Go to "Security"
3. Click "Enable Encryption"
4. Verify all devices

## Privacy Features

### Data Control

| Control | What It Does |
|---------|-------------|
| **Message Disappearing** | Auto-deletes after set time |
| **Read Receipts** | Choose who sees them |
| **Typing Indicators** | Show/hide typing status |
| **Online Presence** | Control visibility |
| **Location Sharing** | Share temporarily |
| **Data Export** | Download all your data |

### Data Minimization

- No message content stored on servers
- Minimal metadata collection
- No tracking or analytics
- GDPR compliant
- Right to deletion

### Account Management

- **Export Data**: Download all your data anytime
- **Delete Account**: Permanently remove your account
- **Deactivate**: Temporarily disable your account

## Security Standards

### Certifications

| Standard | Status | Description |
|----------|--------|-------------|
| SOC2 Type II | Certified | Security controls |
| GDPR | Compliant | European privacy |
| HIPAA | Compliant | Healthcare data |
| CCPA | Compliant | California privacy |
| ISO 27001 | In Progress | Information security |

### Encryption Standards

| Type | Standard | Details |
|------|----------|---------|
| **E2E Encryption** | Olm/Megolm | Industry standard |
| **TLS** | TLS 1.3 | All connections |
| **At Rest** | AES-256 | Database encryption |
| **Keys** | RSA-4096 | Key storage |

## Security Features

### Authentication

| Feature | Description |
|---------|-------------|
| **Password** | Strong password policy |
| **2FA/MFA** | Two-factor authentication |
| **SSO** | Single sign-on support |
| **Token Auth** | JWT tokens |
| **Session Mgmt** | Device management |

### Password Requirements

- Minimum 16 characters
- Upper and lowercase letters
- Numbers and symbols
- No common passwords
- Password history

### Access Control

| Type | Description |
|------|-------------|
| **Room Permissions** | Granular room access |
| **Power Levels** | Role-based permissions |
| **User Roles** | Admin, moderator, user |
| **Federation Rules** | Control federation access |

### Security Monitoring

| Feature | Description |
|---------|-------------|
| **Audit Logs** | Track all actions |
| **Login History** | View login activity |
| **Session Management** | View/manage active sessions |
| **Alerting** | Security alerts |
| **Rate Limiting** | Prevent abuse |

## Compliance

### GDPR

- Data processing agreement available
- Right to access
- Right to rectification
- Right to erasure
- Data portability

### HIPAA

- BAA available
- Encryption at rest
- Audit trails
- Access controls
- Backup and recovery

### Data Retention

| Data Type | Retention |
|-----------|-----------|
| Message content | Configurable |
| Metadata | 90 days |
| Logs | 30 days |
| Backups | 7 days |

## Security Best Practices

### For Users

1. **Enable encryption** for sensitive conversations
2. **Verify devices** of new contacts
3. **Use strong passwords**
4. **Enable 2FA** if available
5. **Review sessions** regularly
6. **Update apps** promptly
7. **Be careful** with links and files
8. **Use disappearing messages** for sensitive info

### For Administrators

1. **Use TLS** in production
2. **Enable rate limiting**
3. **Configure firewall**
4. **Monitor logs**
5. **Regular backups**
6. **Update promptly**
7. **Review permissions**
8. **Train users**

### For Enterprises

1. **Deploy behind firewall**
2. **Use SSO integration**
3. **Enable audit logging**
4. **Configure data retention**
5. **Set up alerts**
6. **Regular security audits**
7. **Incident response plan**
8. **Employee training**

## Security Resources

### Documentation

- [Full Security Guide](docs/SECURITY_HARDENING.md)
- [Admin Guide](docs/ADMIN_GUIDE.md)
- [Compliance Guide](docs/COMPLIANCE.md)

### Tools

- [Security Audit Report](docs/SECURITY_AUDIT.md)
- [Penetration Test Results](docs/PENTEST.md)
- [Vulnerability Disclosure](SECURITY.md)

### Support

- Security questions: security@rechain.network
- Report vulnerabilities: security@rechain.network
- General support: support@rechain.network

## Transparency

### Open Source

REChain is open source. You can:

- Review source code
- Audit security
- Contribute fixes
- Build custom versions

### Code Locations

| Component | Repository |
|-----------|------------|
| Server | `/lib/` |
| Web Client | `/web/` |
| Mobile Apps | `/android/`, `/ios/` |
| Bridges | `/bridges/` |

## Frequently Asked Questions

**Q: Can REChain read my messages?**
A: No. Messages are encrypted on your device. We cannot read them.

**Q: Is my data stored securely?**
A: Yes. All data is encrypted at rest using AES-256.

**Q: How do I verify contacts?**
A: Use the QR code or emoji verification in device settings.

**Q: Can I delete my data?**
A: Yes. You can export and delete all your data anytime.

**Q: Is REChain GDPR compliant?**
A: Yes. We are fully GDPR compliant.

**Q: Do you share data with third parties?**
A: No. We never sell or share your data.

---

**Have more questions?** Contact [security@rechain.network](mailto:security@rechain.network)

**See Also**: [Features](FEATURES.md) | [Getting Started](GETTING_STARTED.md) | [Support](SUPPORT.md)
