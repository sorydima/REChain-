# REChain macOS - Complete Implementation Guide

## 🚀 Overview

This document describes the complete macOS implementation for REChain, including autonomous push notifications, system integration, crash reporting, and build optimization for macOS desktop applications.

## 📱 Features Implemented

### ✅ Core macOS Features
- **Native Swift Implementation**: Full Swift codebase with modern macOS APIs
- **Autonomous Notifications**: Complete UNUserNotifications framework integration
- **System Integration**: Apple Events, file access, and system preferences
- **Crash Reporting**: Firebase Crashlytics integration with detailed logging
- **Permission Management**: Comprehensive permission handling for all macOS features
- **Build Optimization**: Xcode project configuration and CocoaPods setup
- **Sandbox Compliance**: Proper entitlements and security configurations

### ✅ Notification System
- Message notifications with reply actions
- Call notifications with accept/decline actions
- User activity notifications (join/leave)
- File upload notifications
- System notifications (sync errors, login success)
- Security notifications (device verification, backup)
- Space and room notifications
- macOS 12+ interruption levels support

### ✅ macOS-Specific Features
- **App Sandbox**: Proper sandboxing with required entitlements
- **File Access**: Downloads, documents, and user-selected files
- **System Integration**: Apple Events and automation support
- **Menu Bar**: Native macOS menu integration ready
- **Dock Integration**: Badge counts and dock menu support
- **Spotlight**: Search integration ready

## 🏗️ Architecture

### macOS Components
```
Runner/
├── AppDelegate.swift                         # Main app delegate with full setup
├── MainFlutterWindow.swift                   # Flutter window controller
├── AutonomousNotificationService.swift       # Notification service
├── CrashReportingManager.swift              # Crash reporting
├── PermissionManager.swift                  # Permission handling
├── BuildConfigHelper.swift                 # Build info utilities
└── DebugViewController.swift                # Debug testing interface

RunnerTests/
├── RunnerTests.swift                        # Unit tests

RunnerUITests/
├── RunnerUITests.swift                      # UI tests
```

### Configuration Files
```
Runner/
├── Info.plist                               # App configuration
├── Release.entitlements                     # Production entitlements
├── DebugProfile.entitlements               # Debug entitlements
├── ExportOptions.plist                      # Archive export options
└── Assets.xcassets/                         # App icons and images
```

## 🔧 Build Configuration

### Xcode Features
- **macOS 12.2+** minimum deployment target
- **Swift 5.0+** with modern concurrency
- **Firebase** integration (Crashlytics, Analytics, Messaging)
- **CocoaPods** dependency management
- **App Sandbox** enabled with proper entitlements
- **Hardened Runtime** for security

### Build Scripts
- `scripts/build_macos.sh` - Complete macOS build script
- `scripts/test_macos.sh` - macOS testing script

## 📋 Permissions & Entitlements

### Required Entitlements
- **App Sandbox** - `com.apple.security.app-sandbox`
- **Network Client** - `com.apple.security.network.client`
- **Network Server** - `com.apple.security.network.server`
- **Camera Access** - `com.apple.security.device.camera`
- **Microphone Access** - `com.apple.security.device.audio-input`
- **File Access** - User-selected and downloads folders
- **Location Access** - `com.apple.security.personal-information.location`
- **Apple Events** - `com.apple.security.automation.apple-events`

### Usage Descriptions
- **Camera** - Video calls and photo sharing
- **Microphone** - Voice calls and voice messages
- **Contacts** - Contact discovery and sharing
- **Location** - Location sharing (when chosen)
- **Photo Library** - Image and video sharing
- **Calendar** - Event sharing
- **Apple Events** - System integration and automation

## 🔔 Notification Types

| Type | Actions | Interruption Level | Description |
|------|---------|-------------------|-------------|
| `message_received` | Reply | Active | New message with reply action |
| `call_incoming` | Accept/Decline | Critical | Incoming call with high priority |
| `call_missed` | None | Active | Missed call notification |
| `user_joined` | None | Passive | User joined room |
| `file_uploaded` | None | Passive | File upload completed |
| `sync_error` | None | Critical | Sync/connection errors |
| `login_success` | None | Passive | Successful login |
| `device_verified` | None | Active | Device verification |
| `space_joined` | None | Passive | Space membership |

## 🧪 Testing

### Unit Tests
- `RunnerTests.swift` - Core functionality tests
- Notification service tests
- Permission manager tests
- Build config tests
- Device info validation

### UI Tests
- `RunnerUITests.swift` - User interface tests
- App launch and window management tests
- Menu bar and keyboard shortcut tests
- Memory usage and termination tests

### Debug Features
- `DebugViewController` - Manual notification testing
- OSLog structured logging
- Crash reporting with custom keys

## 🚀 Build & Deploy

### Development Build
```bash
# Build debug version
./scripts/build_macos.sh
```

### Testing
```bash
# Run all tests
./scripts/test_macos.sh

# Manual testing with debug interface
# Launch app and navigate to debug screen
```

### Release Build
1. Configure signing in Xcode project settings
2. Update `ExportOptions.plist` with your team ID and provisioning profiles
3. Run build script for archive and app bundle
4. Notarize for distribution outside Mac App Store

## 🔧 Configuration

### Firebase Setup
1. Add `GoogleService-Info.plist` to `macos/Runner/`
2. Configure Firebase project with bundle ID `com.rechain.online`
3. Enable Crashlytics, Analytics, and Cloud Messaging

### Signing Configuration
1. Open `macos/Runner.xcworkspace` in Xcode
2. Select Runner target → Signing & Capabilities
3. Configure Team and Provisioning Profile
4. Update `ExportOptions.plist` with correct provisioning profile names

### Notarization (for distribution outside Mac App Store)
```bash
# After building, notarize the app
xcrun notarytool submit REChain.app.zip --keychain-profile "AC_PASSWORD" --wait

# Staple the notarization
xcrun stapler staple REChain.app
```

## 📊 Monitoring

### Crash Reporting
- Firebase Crashlytics integration
- Custom crash keys (version, device info, build type)
- Automatic exception logging in release builds
- Non-fatal error reporting

### Logging
- OSLog for structured logging
- Debug logs in development
- Error/warning logs in production
- Crash reporting integration

### System Integration
- Apple Events for automation
- File system access monitoring
- Permission state tracking
- Thermal state monitoring

## 🔍 Troubleshooting

### Common Issues

1. **Notification Permission Denied**
   - Check Info.plist usage descriptions
   - Verify notification entitlements
   - Test with DebugViewController

2. **Sandbox Violations**
   - Review entitlements in Release.entitlements
   - Check Console.app for sandbox violation messages
   - Ensure proper file access patterns

3. **Build Failures**
   - Run `pod install` in macos directory
   - Clean build folder in Xcode
   - Check macOS deployment target compatibility

4. **Firebase Integration Issues**
   - Verify GoogleService-Info.plist is added to Xcode project
   - Check bundle ID matches Firebase configuration
   - Ensure Firebase pods are properly installed

### Debug Tools
- **Console.app** - View system logs and crash reports
- **Xcode Organizer** - Crash reports and analytics
- **Firebase Console** - Crashlytics dashboard
- **DebugViewController** - In-app notification testing
- **Activity Monitor** - Performance monitoring

## 📈 Performance

### Optimizations
- Swift symbol stripping enabled
- Proper memory management with ARC
- Efficient notification handling
- Optimized file access patterns

### Memory Management
- Weak references in delegates
- Proper cleanup in deinit
- Notification center observer cleanup
- File handle management

## 🔐 Security

### App Sandbox
- Minimal required entitlements
- Proper file access scoping
- Network access restrictions
- System resource protection

### Data Protection
- Keychain integration ready
- Secure file storage
- Privacy-preserving analytics
- Encrypted data transmission

### Code Signing
- Developer ID signing for distribution
- Hardened runtime enabled
- Notarization for security
- Entitlement validation

## 📱 System Integration

### File System
- User-selected file access
- Downloads folder access
- Temporary file handling
- Document-based app ready

### System Services
- Spotlight search integration ready
- Quick Look preview support ready
- Services menu integration ready
- Drag and drop support ready

### Accessibility
- VoiceOver support ready
- Keyboard navigation
- High contrast support
- Reduced motion support

## 🖥️ macOS Compatibility

### Version Support
- **macOS 12.2+** - Minimum supported version
- **macOS 13+** - Full feature support
- **macOS 14+** - Latest notification features
- **Apple Silicon** - Native ARM64 support
- **Intel Macs** - x86_64 support

### Hardware Features
- **Touch Bar** - Integration ready
- **Touch ID** - Authentication ready
- **Camera/Microphone** - Full access support
- **Multiple Displays** - Window management ready

---

## 📞 Support

For issues or questions regarding the macOS implementation:
1. Check system logs with Console.app
2. Use DebugViewController for notification testing
3. Review crash reports in Firebase Console
4. Check Xcode build logs and analyzer results
5. Test sandbox compliance with proper entitlements
6. Verify notarization for distribution builds
