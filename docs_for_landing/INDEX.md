ocs_for_landing/INDEX.md</path>
<parameter name="content">
# REChain - Secure. Private. Decentralized.

REChain is a modern, secure messaging platform built on Matrix protocol with enhanced privacy features and enterprise-grade capabilities.

![REChain Banner](assets/banner.png)

---

## Why Choose REChain?

| Feature | Benefit |
|---------|---------|
| **End-to-End Encryption** | Messages are encrypted on your device, not ours |
| **Self-Hosted** | Run on your own infrastructure |
| **Federated** | Connect with other Matrix servers worldwide |
| **Feature-Rich** | Audio/video calls, file sharing, integrations |
| **Open Source** | Transparent, auditable code |
| **Compliance Ready** | GDPR, SOC2 compatible |

---

## Quick Start

### 1. Try REChain Online

Visit our hosted instance at [rechain.online](https://rechain.online) to get started immediately.

### 2. Self-Host Your Own

```bash
# Using Docker (recommended)
docker run -d \
  --name rechain \
  -p 8008:8008 \
  -p 8448:8448 \
  -v rechain_data:/var/lib/rechain \
  rechain/rechain:latest
```

### 3. Download Apps

| Platform | Download |
|----------|----------|
| Android | [Google Play](link) / [F-Droid](link) |
| iOS | [App Store](link) |
| Desktop | [Windows](link) / [macOS](link) / [Linux](link) |
| Web | [Web App](https://app.rechain.online) |

---

## Features

### Core Messaging

- **Instant Messaging** - Real-time message delivery
- **Media Sharing** - Share files, images, and videos
- **Voice/Video Calls** - HD audio and video calls
- **Message History** - Access your history from any device
- **Emoji Reactions** - React to messages with emojis
- **Message Editing/Deletion** - Edit or remove messages
- **Thread Support** - Organize conversations with threads

### Security & Privacy

- **End-to-End Encryption** - Only you and recipients can read
- **Device Verification** - Verify devices to prevent MITM attacks
- **Message Disappearing** - Auto-delete messages after set time
- **User Verification** - Verify identity of contacts
- **Privacy Controls** - Control who can contact you
- **Data Export** - Export all your data anytime

### Integrations

- **Telegram Bridge** - Connect with Telegram users
- **Discord Bridge** - Bridge with Discord servers
- **Signal/WhatsApp** - Coming soon
- **Custom Bridges** - Build your own integrations
- **Webhooks** - Connect with external services
- **Bots** - Automate tasks with bots

### Enterprise Features

- **SSO Integration** - Single sign-on with your IdP
- **Admin Dashboard** - Manage users and rooms
- **Audit Logs** - Track all activities
- **Role-Based Access** - Granular permissions
- **Compliance Export** - Export for eDiscovery
- **High Availability** - 99.99% uptime SLA

---

## Architecture

```
┌─────────────────────────────────────┐
│         Client Applications         │
│   (Web, Desktop, Mobile, CLI)       │
└─────────────────────────────────────┘
                │
                ▼
┌─────────────────────────────────────┐
│         REChain Server              │
│  ┌─────────────────────────────┐    │
│  │     Core Services           │    │
│  │  • Authentication           │    │
│  │  • Room Management          │    │
│  │  • Message Handling         │    │
│  │  • Federation               │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
                │
    ┌───────────┼───────────┐
    ▼           ▼           ▼
┌────────┐ ┌────────┐ ┌────────┐
│Database│ │ Cache  │ │ Storage│
│(SQL)   │ │(Redis) │ │(Files) │
└────────┘ └────────┘ └────────┘
```

---

## Use Cases

### Personal Communication

Secure messaging for individuals and families who value privacy.

### Team Collaboration

Real-time communication for remote teams with features like:

- Project rooms
- File sharing
- Video calls
- Integrations with GitHub, Jira, Slack

### Enterprise

Compliant communication for regulated industries:

- Healthcare (HIPAA)
- Finance (SOX, PCI-DSS)
- Government (FedRAMP)

### Communities

Build and grow communities:

- Open membership options
- Moderation tools
- Public room directory
- Event coordination

---

## Supported Platforms

| Platform | Status | Notes |
|----------|--------|-------|
| 🐧 Linux | ✅ Supported | Ubuntu, Debian, Fedora, RHEL, Arch |
| 🍎 macOS | ✅ Supported | Intel and Apple Silicon |
| 🪟 Windows | ✅ Supported | 10 and 11 |
| 📱 Android | ✅ Supported | 8.0+ |
| 🍏 iOS | ✅ Supported | 14.0+ |
| 🌐 Web | ✅ Supported | All modern browsers |

---

## Deployment Options

### Cloud Hosting

| Provider | Setup Time | Cost |
|----------|------------|------|
| AWS | 10 min | Pay-as-you-go |
| Azure | 10 min | Pay-as-you-go |
| GCP | 10 min | Pay-as-you-go |
| DigitalOcean | 5 min | $15+/mo |

### Self-Hosting

| Option | Difficulty | Best For |
|--------|------------|----------|
| Docker | ⭐ Easy | Small teams |
| Binary | ⭐⭐ Medium | Custom setups |
| Source | ⭐⭐⭐ Advanced | Developers |

### Managed Services

- **REChain Cloud** - Fully managed hosting
- **Enterprise** - Custom deployments with support

---

## Security

### Encryption Standards

- **E2EE**: Olm/Megolm ( industry standard)
- **TLS**: TLS 1.3 for all connections
- **Key Rotation**: Automatic every 30 days
- **Verification**: Cross-signing enabled

### Privacy Features

- No message content on servers
- Metadata minimization
- No tracking or analytics
- GDPR compliant
- Data portability

### Compliance

- ✅ SOC2 Type II
- ✅ GDPR
- ✅ HIPAA
- ✅ CCPA
- ✅ ISO 27001

---

## Get Started

### For Users

1. Create account at [rechain.online](https://rechain.online)
2. Download apps for your devices
3. Invite friends and family

### For Teams

1. Deploy your own server
2. Configure SSO and admin settings
3. Invite team members
4. Set up integrations

### For Enterprises

1. Contact sales@rechain.network
2. Get custom deployment quote
3. Set up proof of concept
4. Production deployment with support

---

## Resources

### Documentation

- [User Guide](https://docs.rechain.network/user-guide)
- [Admin Guide](https://docs.rechain.network/admin-guide)
- [API Reference](https://docs.rechain.network/api)
- [Deployment Guide](https://docs.rechain.network/deployment)

### Community

- **Matrix**: [#rechain:rechain.network](https://matrix.to/#/#rechain:rechain.network)
- **GitHub**: [github.com/sorydima/REChain-](https://github.com/sorydima/REChain-)
- **Twitter**: [@REChainNetwork](https://twitter.com/REChainNetwork)

### Support

- 📧 Email: support@rechain.network
- 📖 Knowledge Base: https://docs.rechain.network
- 🐛 Issues: GitHub Issues

---

## Pricing

| Plan | Price | Features |
|------|-------|----------|
| **Free** | $0 | Unlimited users, 1GB storage, basic features |
| **Pro** | $10/mo | 100GB storage, priority support, analytics |
| **Team** | $25/mo/user | SSO, audit logs, admin tools |
| **Enterprise** | Custom | Custom deployment, 24/7 support, SLA |

---

## Compare REChain

| Feature | REChain | Signal | Telegram | WhatsApp |
|---------|---------|--------|----------|----------|
| E2E Encryption | ✅ | ✅ | ✅ (secret chats) | ✅ |
| Self-Hosted | ✅ | ❌ | ❌ | ❌ |
| Federation | ✅ | ❌ | ❌ | ❌ |
| Open Source | ✅ | ⚠️ Server closed | ⚠️ Server closed | ❌ |
| Custom Bridges | ✅ | ❌ | ❌ | ❌ |
| Enterprise Features | ✅ | ❌ | ❌ | ❌ |

---

## Open Source

REChain is open source under the MIT License.

### Repository Structure

```
REChain/
├── lib/              # Core application code
├── bridges/          # Bridge implementations
├── docs/             # Documentation
├── scripts/          # Build and deployment scripts
├── web/              # Web client
├── android/          # Android app
├── ios/              # iOS app
└── desktop/          # Desktop apps
```

### Contributing

We welcome contributions!

1. Fork the repository
2. Create feature branch
3. Make your changes
4. Submit pull request

See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

---

## Stay Updated

- 📰 [Blog](https://rechain.network/blog)
- 🐦 [Twitter](https://twitter.com/REChainNetwork)
- 📧 [Newsletter](https://rechain.network/newsletter)
- ⭐ [GitHub Stars](https://github.com/sorydima/REChain-)

---

## License

REChain is licensed under the [MIT License](LICENSE).

---

**REChain** - Secure. Private. Decentralized.

[Website](https://rechain.network) | [Docs](https://docs.rechain.network) | [GitHub](https://github.com/sorydima/REChain-) | [Matrix](https://matrix.to/#/#rechain:rechain.network)
