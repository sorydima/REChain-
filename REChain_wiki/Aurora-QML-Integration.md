# QML Integration for Aurora OS

## Overview
Aurora OS supports QML for custom UI/UX. You can integrate QML with your Flutter app for advanced native features.

## Adding QML Files
- Place QML files in `aurora/qml/` or a similar directory.
- Reference QML files in your CMakeLists.txt if needed.

## Connecting QML with Dart/Flutter
- Use platform channels or FFI to communicate between Dart and QML/C++.
- Example: Expose a QML property and update it from Dart via a method channel.

## Best Practices
- Keep business logic in Dart; use QML for UI/UX and platform-specific features.
- Test QML integration on real devices/emulators.
- Use QML for notifications, dialogs, and system integration.

---

For more, see the [Aurora OS Platform Support](Platform-Support.md) guide. 