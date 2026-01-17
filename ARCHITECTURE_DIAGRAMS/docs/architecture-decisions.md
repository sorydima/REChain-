# Architecture Decision Records (ADRs)

## 📋 Overview

This document records key architectural decisions made for REChain v4.1.10+1160.

**Version:** 4.1.10+1160  
**Last Updated:** 2025-12-06

---

## 📁 ADR Index

### Core Architecture

| ADR ID | Title | Status | Date |
|--------|-------|--------|------|
| ADR-001 | Flutter for Cross-Platform | ✅ Accepted | 2024-01 |
| ADR-002 | Matrix Protocol Foundation | ✅ Accepted | 2024-01 |
| ADR-003 | Modular Plugin Architecture | ✅ Accepted | 2024-06 |
| ADR-004 | Multi-Provider IPFS | ✅ Accepted | 2024-08 |
| ADR-005 | E2E Encryption with Olm/Megolm | ✅ Accepted | 2024-01 |
| ADR-006 | Kubernetes Orchestration | ✅ Accepted | 2024-03 |

### Data Layer

| ADR ID | Title | Status | Date |
|--------|-------|--------|------|
| ADR-010 | PostgreSQL for Primary Data | ✅ Accepted | 2024-01 |
| ADR-011 | Redis for Caching | ✅ Accepted | 2024-01 |
| ADR-012 | SQLCipher for Local Storage | ✅ Accepted | 2024-02 |
| ADR-013 | IPFS for File Storage | ✅ Accepted | 2024-04 |

### Security

| ADR ID | Title | Status | Date |
|--------|-------|--------|------|
| ADR-020 | Zero-Knowledge Architecture | ✅ Accepted | 2024-01 |
| ADR-021 | Certificate Pinning | ✅ Accepted | 2024-02 |
| ADR-022 | OAuth2/OIDC Authentication | ✅ Accepted | 2024-01 |
| ADR-023 | RBAC Authorization Model | ✅ Accepted | 2024-03 |

### Integration

| ADR ID | Title | Status | Date |
|--------|-------|--------|------|
| ADR-030 | TON Blockchain Integration | ✅ Accepted | 2024-05 |
| ADR-031 | Ethereum/Web3 Support | ✅ Accepted | 2024-05 |
| ADR-032 | Telegram Bridge via TBA | ✅ Accepted | 2024-06 |
| ADR-033 | AI Services Layer | ✅ Accepted | 2024-07 |

---

## 📖 ADR Details

### ADR-001: Flutter for Cross-Platform

**Status:** ✅ Accepted  
**Date:** 2024-01  
**Deciders:** Core Team

#### Context
Need to build applications for mobile (iOS/Android), web, and desktop from a single codebase.

#### Decision
Use Flutter SDK for all client applications.

#### Consequences

**Pros:**
- Single codebase for all platforms
- Excellent performance (compiled to native)
- Rich widget library
- Strong developer community
- Hot reload for fast development

**Cons:**
- Larger app size compared to native
- Some platform-specific features require plugins
- Desktop support less mature than mobile

**Mitigations:**
- Use code splitting for feature modules
- Implement platform channels for native features
- Focus on core functionality first

#### Related Decisions
- ADR-002: Matrix Protocol Foundation
- ADR-003: Modular Plugin Architecture

---

### ADR-002: Matrix Protocol Foundation

**Status:** ✅ Accepted  
**Date:** 2024-01  
**Deciders:** Core Team

#### Context
Need a secure, decentralized communication protocol with federation support.

#### Decision
Adopt Matrix protocol as the core communication layer.

#### Consequences

**Pros:**
- Decentralized/federated architecture
- End-to-end encryption support
- Open standard (no vendor lock-in)
- Bridging capabilities (Telegram, Discord, etc.)
- Active community and development

**Cons:**
- Complex server setup
- Performance at scale requires optimization
- Learning curve for developers

**Mitigations:**
- Provide Docker Compose setup
- Create comprehensive documentation
- Build management dashboard

#### Technical Details
- **Server:** Synapse (Python) or Dendrite (Go)
- **Client SDK:** matrix-dart-sdk
- **Encryption:** Olm/Megolm protocols
- **Bridges:** Python matrix-appservice-bridge

#### Related Decisions
- ADR-005: E2E Encryption
- ADR-032: Telegram Bridge

---

### ADR-003: Modular Plugin Architecture

**Status:** ✅ Accepted  
**Date:** 2024-06  
**Deciders:** Core Team

#### Context
Need extensible architecture for third-party features and integrations.

#### Decision
Implement dynamic plugin system with hot-reload capability.

#### Consequences

**Pros:**
- Extensibility without modifying core
- Third-party development ecosystem
- Hot-reload without app restart
- Sandboxed execution for security
- Web-based UI components

**Cons:**
- Performance overhead
- Complex lifecycle management
- Security considerations for plugin code

**Mitigations:**
- Implement plugin sandboxing
- Use WebAssembly for performance
- Comprehensive API documentation

#### Technical Details
```dart
abstract class Plugin {
  String get id;
  String get version;
  Future<void> initialize(PluginContext context);
  Future<void> dispose();
}
```

---

### ADR-004: Multi-Provider IPFS

**Status:** ✅ Accepted  
**Date:** 2024-08  
**Deciders:** Core Team

#### Context
Need decentralized file storage with reliability and redundancy.

#### Decision
Implement multi-provider IPFS strategy with client-side encryption.

#### Consequences

**Pros:**
- No single point of failure
- Censorship resistance
- Cost-effective storage
- Built-in deduplication
- CDN-like distribution

**Cons:**
- Variable retrieval times
- Content pinning required
- Complexity in key management

**Mitigations:**
- Pin popular content automatically
- Cache frequently accessed files
- Use multiple gateway providers

#### Technical Details
```dart
class IPFSService {
  final List<IPFSProvider> providers;
  final EncryptionService encryption;
  
  Future<CID> upload(EncryptedFile file);
  Future<DecryptedFile> download(CID cid);
}
```

---

### ADR-005: E2E Encryption with Olm/Megolm

**Status:** ✅ Accepted  
**Date:** 2024-01  
**Deciders:** Core Team

#### Context
Need to ensure message privacy even from service providers.

#### Decision
Implement Olm and Megolm encryption protocols from Matrix specification.

#### Consequences

**Pros:**
- True end-to-end encryption
- Forward secrecy
- Device-to-device key verification
- Backward compatible updates

**Cons:**
- Complexity in key management
- No search/indexing of encrypted content
- Recovery/backup challenges

**Mitigations:**
- Secure key backup with encryption
- Device verification flows
- Clear user education

#### Technical Details
- **Olm:** Per-device key exchange
- **Megolm:** Group chat encryption
- **Key Backup:** Encrypted storage with recovery key

---

### ADR-006: Kubernetes Orchestration

**Status:** ✅ Accepted  
**Date:** 2024-03  
**Deciders:** DevOps Team

#### Context
Need scalable, manageable infrastructure for multi-region deployment.

#### Decision
Adopt Kubernetes for container orchestration with Helm charts.

#### Consequences

**Pros:**
- Horizontal scaling
- Self-healing infrastructure
- Declarative configuration
- Multi-cloud support
- Strong ecosystem

**Cons:**
- Complex setup and management
- Resource overhead
- Steep learning curve

**Mitigations:**
- Provide production-ready Helm charts
- Create deployment automation
- Comprehensive runbooks

---

## 📝 Template

### ADR-XXX: Title

**Status:** [✅ Accepted | ❌ Rejected | 🔄 Deprecated]  
**Date:** YYYY-MM-DD  
**Deciders:** Team Name

#### Context
[Description of the situation and problem]

#### Decision
[What was decided and why]

#### Consequences

**Pros:**
- [Positive outcomes]

**Cons:**
- [Negative outcomes]

**Mitigations:**
- [How to address cons]

#### Technical Details
```[Language]
[Code examples if applicable]
```

#### Related Decisions
- [Link to other ADRs]

---

## 🔄 Change Log

| Version | Date | Description |
|---------|------|-------------|
| 4.1.10+1160 | 2025-12-06 | Added AI Services ADR |
| 4.1.10+1152 | 2025-07-08 | Initial ADRs documented |

