# Development Guide for REChain

This guide provides detailed information for developers working on the REChain project.

## Prerequisites

- Flutter 3.32.8 or higher
- Dart SDK
- Git
- Rust toolchain (for vodozemac compilation)
- Android Studio or Xcode for platform-specific development

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/sorydima/REChain-.git
   cd REChain-
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up pre-commit hooks (optional):
   ```bash
   pip install pre-commit
   pre-commit install
   ```

4. Configure environment variables (if needed):
   - Copy `config.sample.json` to `config.json`
   - Update configuration values as required

## Development Workflow

### Branching Strategy

- Use feature branches for new work: `git checkout -b feature/your-feature-name`
- Keep branches up to date with main: `git rebase origin/main`
- Follow conventional commit messages

### Code Style

- Use the provided `.editorconfig` for consistent formatting
- Run `flutter format` to format Dart code
- Use `flutter analyze` for static analysis

### Testing

- Write unit tests for new features
- Run tests: `flutter test`
- Integration tests: `flutter drive --target=test_driver/app.dart`

### Building

- Debug build: `flutter run`
- Release build: `flutter build apk` or `flutter build ios`

## Architecture Overview

REChain follows a modular architecture:

- **Core Layer**: Matrix protocol, IPFS, blockchain integrations
- **Service Layer**: AI, analytics, serverless functions
- **UI Layer**: Flutter-based user interface
- **Platform Layer**: Native code for Android, iOS, etc.

## Key Components

### Matrix Integration
- Located in `lib/matrix/`
- Handles messaging, federation, and bridges

### Blockchain Module
- Located in `lib/blockchain/`
- Manages wallets, transactions, and smart contracts

### IPFS Storage
- Located in `lib/ipfs/`
- Handles decentralized file storage and retrieval

### AI Services
- Located in `lib/ai/`
- Integrates GPT, moderation, and analytics

## Contributing

- Follow the [Contributing Guidelines](Contributing.md)
- Use the [Code Style Guide](CODE_STYLE.md)
- Submit pull requests against the main branch

## Debugging

- Use Flutter DevTools for performance profiling
- Enable verbose logging in debug mode
- Use breakpoints and hot reload for rapid iteration

## Deployment

- Use Codemagic for CI/CD
- Shorebird for code push updates
- Follow platform-specific deployment guides

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Matrix Protocol](https://matrix.org/docs/)
- [IPFS Documentation](https://docs.ipfs.io/)
- [Blockchain Guides](https://ethereum.org/en/developers/docs/)

---

*This development guide is part of the REChain documentation suite.*
