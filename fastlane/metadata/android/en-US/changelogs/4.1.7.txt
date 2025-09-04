## [v4.1.8+1152] - 2025-07-08

### Major Features & Integrations
- Integrated Matrix (advanced backend, bridges, federation, encryption, bots)
- Integrated Telegram via Super TMA bridge (two-way sync, admin, analytics, AI moderation, plugin system)
- Added blockchain support (TON, Ethereum, Bitget, Web3)
- Implemented multi-provider IPFS with analytics and encryption
- Integrated AI services (moderation, translation, analytics)

### Developer Experience & Extensibility
- Built dynamic plugin system (hot-reload, web UI, enable/disable)
- Added admin tools: RBAC UI, SSO/OAuth2, audit log
- Unified API (REST, WebSocket, OpenAPI)
- Persistent logging, Prometheus metrics, Sentry, Grafana dashboards, Alertmanager
- Redis-based scaling, Docker, docker-compose, systemd, Kubernetes, Helm, HPA
- Automated backup/restore, E2EE stubs, multi-language/i18n
- Advanced dashboard widgets (real-time charts, log viewer, plugin controls)

### Testing & CI/CD
- Added unit, integration, and E2E Selenium tests (bot, dashboard, RBAC UI)
- GitHub Actions workflows for CI/CD and E2E

### REChain Service Integrations
- Created stubs and plugins for REChain identity and payments

### Documentation & Onboarding
- Upgraded README.md with overview, architecture, feature matrix, quickstart, and links
- Expanded `docs/` and wiki: architecture, API, onboarding, integration, security, scaling, plugin dev, end-user how-tos
- Added doc comments and code samples to Dart files; prepared for dartdoc

### Operational Excellence
- Guides/scripts for HA/multi-region deployment, disaster recovery, backup verification, scaling
- Documented all features, workflows, and best practices

---

## [v4.1.8 + 1152] - 2025-06-08

### ✨ Features
- Add confirmation dialog before accepting invite  
- Add feature flag for refresh tokens  
- Add setting to toggle space navigation rail on mobile  
- Introduce background audio player  
- Enable markdown checkbox toggling in messages  
- Allow creating lists with checkboxes via "+" menu  
- Limit height of text messages and allow expansion on tap  
- Integrate video player into multi-image viewer  
- Show all supported image/video file types in file picker  
- Enable WebM video support when selecting videos for upload  

### 🐛 Fixes
- Prevent crash on page navigation with open popup menu  
- Fix app crash on window resize in chat  
- Fix crash when accessing settings in desktop mode  
- Prevent crash when logging out via client chooser button  
- Fix avatar rendering with anti-aliased clipping for smoother edges  
- Correct `PNGs` to `PNG` in file selector for consistency  
- Join new room after room upgrade  
- Persist state in text input dialogs  
- Properly show WebP images with lowercase extensions  
- Add missing mounted check to `mxcImage` component  
- Improve localization handling  

### 🛠 Build
- Update SDK to `0.40.2`  
- Upgrade to Flutter `3.32.1`  
- Update Android packages: record, shared_preferences  
- Apply workaround for Flutter Secure Storage on Linux  
- Added script: `scripts/update-dependencies.sh` for dependency upgrades

### 🧹 Chore
- Crop and cache shortcut file on Android  
- Display loading dialog while preparing voice messages  
- Format `lib/utils/file_selector.dart`  
- Let users define custom title in error reporter  
- Narrow space navigation bar on mobile and match theme  
- Improve checkbox visuals  
- Preload server file config before upload  
- Remove unused translations and custom error widget builder  
- Simplify voice message getter and update localization  

### 🧼 Refactor
- Always use `HtmlMessage`  
- Reduce notification avatar size to 128px  

### 🌐 Translations (via Weblate)

**New Languages**
- Cantonese (Traditional Han script)  
- Danish  
- Yue (yue_HK)  

**Updated Languages**
- Arabic  
- Basque  
- Catalan  
- Chinese (Simplified & Traditional)  
- Dutch  
- Estonian  
- Finnish  
- Galician  
- German  
- Hebrew  
- Hungarian  
- Indonesian  
- Irish  
- Italian  
- Latvian  
- Polish  
- Portuguese (Brazil)  
- Russian  
- Ukrainian