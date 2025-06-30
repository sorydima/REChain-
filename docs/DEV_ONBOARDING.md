# Developer Onboarding

Welcome to the REChain Ecosystem! This guide will help you get up and running as a developer.

## 1. Setup
- Clone the repo: `git clone https://github.com/sorydima/REChain-.git`
- Install dependencies:
  - `flutter pub get` (Dart/Flutter)
  - `pip install -r bridges/telegram_super_tma/requirements.txt` (Python bridge)
- Set up config files as needed (see `config.yaml`, `roles.yaml`, etc.)

## 2. Codebase Tour
- `lib/` — Main Flutter app (features, config, UI, integrations)
- `bridges/telegram_super_tma/` — Python Super TMA bridge, plugins, API, admin tools
- `docs/` — Architecture, API, integration, security, scaling, and more
- `test/` — Dart tests
- `.github/workflows/` — CI/CD pipelines

## 3. Best Practices
- Use clear commit messages and PR descriptions
- Write modular, testable, and well-documented code
- Add/maintain tests for new features and bug fixes
- Follow RBAC and security guidelines

## 4. Contribution Workflow
- Fork the repo and create a feature branch
- Make your changes and add tests/docs
- Open a pull request and participate in code review
- See [CONTRIBUTING.md](CONTRIBUTING.md) for more

--- 