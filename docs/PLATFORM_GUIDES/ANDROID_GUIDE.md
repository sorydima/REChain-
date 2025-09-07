# Android Platform Guide for REChain

This guide provides specific instructions for building and deploying REChain on Android devices.

## Prerequisites

- Android Studio Arctic Fox or later
- Android SDK API level 21 or higher
- Java Development Kit (JDK) 11 or higher

## Setup

1. Open the project in Android Studio
2. Sync Gradle files
3. Configure signing keys for release builds

## Building

### Debug Build
```bash
flutter build apk --debug
```

### Release Build
```bash
flutter build apk --release
```

### App Bundle
```bash
flutter build appbundle
```

## Deployment

- Use Google Play Console for production releases
- Configure in-app updates for Shorebird integration
- Set up Firebase for crash reporting and analytics

## Platform-Specific Features

- Android-specific UI adaptations
- Native Android integrations
- Battery optimization settings

## Troubleshooting

- Gradle sync issues: Clean and rebuild
- Permission errors: Check AndroidManifest.xml
- Build failures: Verify Flutter and Android SDK versions

---

*This Android guide is part of the REChain documentation suite.*
