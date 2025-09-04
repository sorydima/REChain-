# REChain Environment Setup

---

## Latest Release Information

This document is updated for REChain version 4.1.8+1152, released on 2025-07-08.

---

## Overview

This guide provides detailed instructions for setting up the development and production environment for REChain. It covers system requirements, dependencies, configuration, and best practices.

---

## System Requirements

- Supported Operating Systems: Windows 10/11, macOS, Linux (Ubuntu, Debian, Fedora)
- Minimum RAM: 8 GB (16 GB recommended)
- Disk Space: At least 20 GB free
- Network: Stable internet connection

---

## Software Dependencies

- Flutter SDK (version compatible with REChain)
- Dart SDK
- Git
- Docker and Docker Compose
- Node.js and npm (for web components)
- Shorebird CLI (for code push updates)
- Additional platform-specific tools (Xcode for iOS, Android Studio for Android)

---

## Environment Configuration

- Clone the REChain repository: `git clone https://github.com/sorydima/REChain-.git`
- Install Flutter dependencies: `flutter pub get`
- Set environment variables as needed (e.g., PATH updates for Flutter, Shorebird)
- Configure platform-specific settings (e.g., signing keys for iOS and Android)

---

## Development Environment Setup

- Follow the [DEVELOPER_ONBOARDING.md](DEVELOPER_ONBOARDING.md) for detailed setup instructions.
- Use recommended IDEs: Visual Studio Code, Android Studio, or IntelliJ IDEA.
- Enable Flutter and Dart plugins in your IDE.
- Set up debugging and testing configurations.

---

## Production Environment Setup

- Use Docker containers for consistent deployment.
- Configure environment variables for production settings.
- Set up monitoring and logging tools.
- Follow security best practices as outlined in [SECURITY.md](SECURITY.md).

---

## Troubleshooting

- Common issues and solutions.
- Links to community support and documentation.
- Contact support@rechain.network for assistance.

---

## Additional Resources

- [Getting Started Guide](./Getting-Started.md)
- [Deployment Guide](https://github.com/sorydima/REChain-/wiki/Deployment-Guide)
- [Release Notes](./RELEASE_NOTES.md)

---

*This environment setup guide is part of the REChain v4.1.8+1152 release documentation.*
