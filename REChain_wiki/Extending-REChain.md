# Extending REChain

## Architecture Overview
- REChain uses a modular, service/provider-based architecture
- Each integration (Matrix, Blockchain, IPFS, AI, etc.) is a feature in `lib/features/`

## Adding a New Integration
1. Create a new service/provider in `lib/features/<your_feature>/`
2. Implement the required interfaces and configuration
3. Add UI components in `lib/pages/` or `lib/widgets/`
4. Register your provider in the integration manager
5. Add docs and code samples in the wiki

## Plugins
- Use the plugin pattern for reusable modules
- See existing providers for examples

## Code Pointers
- `lib/features/` — Main integrations
- `lib/config/` — Configuration and keys
- `lib/pages/` — UI and dashboards

---

For more, see [Getting Started](Getting-Started.md) and [API Reference](API-Reference.md). 