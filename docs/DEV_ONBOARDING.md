# Developer Onboarding Guide

Welcome to the REChain project! This guide will help you get started with the development environment, building, testing, and contributing to the project.

## Project Overview

REChain is a multi-platform Flutter application with support for Android, iOS, web, Linux, macOS, and Windows. The project includes various modules and extensive documentation to support development and deployment.

## Prerequisites and Environment Setup

Before you start, ensure you have the following installed on your development machine:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (stable channel recommended)
- [Dart SDK](https://dart.dev/get-dart) (usually included with Flutter)
- [Git](https://git-scm.com/downloads)
- Platform-specific tools:
  - Android Studio and Android SDK for Android builds
  - Xcode for iOS and macOS builds (macOS only)
  - Required build tools for Linux and Windows (e.g., gcc, Visual Studio Build Tools)

Ensure your Flutter environment is set up correctly by running:

```bash
flutter doctor
```

## Cloning the Repository and Installing Dependencies

Clone the repository:

```bash
git clone https://github.com/sorydima/REChain-.git
cd REChain-
```

Install Flutter dependencies:

```bash
flutter pub get
```

If you are working on specific modules or directories (e.g., `docs_for_landing`), navigate there and run `flutter pub get` accordingly.

## Building and Running the Project

You can build and run the project for your target platform using Flutter commands. Examples:

- Android:

  ```bash
  flutter build apk --release
  flutter install
  ```

- iOS:

  ```bash
  flutter build ios --release
  ```

- Web:

  ```bash
  flutter build web --release
  ```

- Linux:

  ```bash
  flutter build linux --release
  ```

- macOS:

  ```bash
  flutter build macos --release
  ```

- Windows:

  ```bash
  flutter build windows --release
  ```

Refer to the [Flutter documentation](https://flutter.dev/docs) for more details on building and running apps.

## Running Tests

Run unit and widget tests using:

```bash
flutter test
```

Integration tests can be run with:

```bash
flutter drive --target=test_driver/app.dart
```

Ensure tests pass before submitting any changes.

## Code Style and Contribution Guidelines

- Follow the [Dart and Flutter style guide](https://dart.dev/guides/language/effective-dart/style).
- Use meaningful commit messages.
- Create feature branches for your work.
- Submit pull requests for review.
- Adhere to the project's [CONTRIBUTING.md](CONTRIBUTING.md) guidelines.

## Useful Resources and Contacts

- Project repository: https://github.com/sorydima/REChain-
- Issue tracker: https://github.com/sorydima/REChain-/issues
- Documentation: https://github.com/sorydima/REChain-/docs
- Communication channels: Refer to `COMMUNICATION_GUIDELINES.md`
- Maintainers and contributors: See `MAINTAINERS.md`

Welcome aboard and happy coding!
