# REChain Architecture Diagrams

## High-Level System Overview

```mermaid
graph TD
  A["User/Client Apps"] -->|"Matrix, Blockchain, IPFS, AI"| B["REChain Core"]
  B --> C["Matrix Integrations"]
  B --> D["Blockchain Integrations"]
  B --> E["IPFS Providers"]
  B --> F["AI Services"]
  C --> C1["Matrix Clients"]
  C --> C2["Bridges"]
  D --> D1["Wallets"]
  D --> D2["NFTs"]
  D --> D3["Smart Contracts"]
  E --> E1["Pinata"]
  E --> E2["Web3.Storage"]
  E --> E3["Infura"]
  F --> F1["Moderation"]
  F --> F2["Translation"]
  F --> F3["Summarization"]
  B --> G["API Layer (REST/gRPC/Serverless)"]
  G --> H["External Integrations"]
  B --> I["UI/UX Dashboards"]
  B --> J["Monitoring & Analytics"]
  B --> K["Security & Auth"]
```

### Description
- **User/Client Apps** interact with the REChain Core via Matrix, Blockchain, IPFS, and AI services.
- **REChain Core** orchestrates all integrations, APIs, dashboards, and security.
- **API Layer** exposes REST, gRPC, and serverless endpoints for automation and external integrations.
- **Dashboards** provide modern UI/UX for management and analytics.

For more, see [docs/Architecture.md](../docs/Architecture.md). 