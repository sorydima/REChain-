# REChain API Reference

## Overview
REChain exposes multiple APIs for integration and automation:
- **REST API**: For web and mobile clients
- **gRPC API**: For high-performance backend integrations
- **Serverless Functions**: For custom automation and hooks

## Main API Groups
- **Matrix**: Messaging, rooms, users, bridges
- **Blockchain**: Wallets, transactions, smart contracts, NFTs
- **IPFS**: File upload, download, pinning, analytics
- **AI**: Moderation, translation, summarization, code analysis
- **Auth**: Login, OAuth, Web3, identity

## Endpoints
- See `docs/` for detailed API docs and code samples
- Example: `/api/v1/matrix/sendMessage`
- Example: `/api/v1/ipfs/upload`

## Authentication
- Most endpoints require authentication (see [Auth](#auth))

---

For detailed usage, see the [docs](../docs/) and code samples. 