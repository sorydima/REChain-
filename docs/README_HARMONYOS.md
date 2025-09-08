# REChain HarmonyOS Platform

## Overview

REChain HarmonyOS is a native implementation of the REChain Matrix client for Huawei's HarmonyOS platform. This implementation provides deep system integration, comprehensive notification support, and robust crash reporting while maintaining feature parity with other REChain platforms.

## Features

### Core Features
- **Native HarmonyOS Integration**: Built using HarmonyOS APIs and ETS (Extended TypeScript)
- **Matrix Protocol Support**: Full Matrix client functionality with end-to-end encryption
- **Real-time Messaging**: Instant message delivery with push notifications
- **Voice & Video Calls**: WebRTC-based calling with HarmonyOS audio/video integration
- **File Sharing**: Support for all media types with HarmonyOS media APIs
- **End-to-End Encryption**: Olm/Megolm encryption with device verification

### HarmonyOS-Specific Features
- **Native Notifications**: Rich notifications with actions, sounds, and vibration
- **System Integration**: Battery, network, and sensor monitoring
- **Crash Reporting**: Comprehensive error tracking and reporting
- **Performance Monitoring**: Real-time performance metrics and optimization
- **Haptic Feedback**: Native vibration and haptic response
- **Background Services**: Efficient background sync and notifications

## Architecture

### Project Structure
```
harmonyos/
├── build-profile.json5          # Build configuration
├── hvigorfile.ts               # Build system configuration
├── entry/                      # Main application module
│   ├── src/main/
│   │   ├── ets/
│   │   │   ├── entryability/   # Application entry point
│   │   │   ├── services/       # Native services
│   │   │   ├── pages/          # UI pages
│   │   │   └── config/         # Configuration management
│   │   ├── resources/          # App resources
│   │   └── module.json5        # Module configuration
│   └── oh-package.json5        # Module dependencies
└── oh-package.json5            # Project dependencies
```

### Native Services Architecture

#### REChainNotificationManager
- **Purpose**: Manages all notification functionality
- **Features**:
  - Rich notifications with custom actions
  - Sound, vibration, and badge support
  - Notification channels and priorities
  - Permission handling
  - Lifecycle management

#### REChainCrashReporter
- **Purpose**: Comprehensive crash and error reporting
- **Features**:
  - Automatic crash detection
  - Breadcrumb tracking
  - User context information
  - Report submission with retry logic
  - Local storage for offline reports

#### REChainSystemIntegration
- **Purpose**: Deep HarmonyOS system integration
- **Features**:
  - Sensor data collection (accelerometer, gyroscope, etc.)
  - Battery and network monitoring
  - Device information gathering
  - Performance metrics
  - System event handling

## Installation

### Prerequisites
- **HarmonyOS SDK**: Version 12 or higher
- **DevEco Studio**: Latest version
- **Node.js**: Version 16 or higher
- **hdc**: HarmonyOS Device Connector

### Development Setup

1. **Install HarmonyOS SDK**:
   ```bash
   # Download from Huawei Developer Portal
   # Set HARMONYOS_SDK_ROOT environment variable
   export HARMONYOS_SDK_ROOT=/path/to/harmonyos/sdk
   ```

2. **Clone Repository**:
   ```bash
   git clone https://github.com/sorydima/REChain-.git
   cd REChain-/harmonyos
   ```

3. **Install Dependencies**:
   ```bash
   npm install
   cd entry && npm install
   ```

4. **Build Project**:
   ```bash
   ./hvigorw assembleHap --mode debug
   ```

### Using Build Scripts

The project includes comprehensive build automation:

```bash
# Build for development
./scripts/build_harmonyos.sh --build-type debug

# Build for production
./scripts/build_harmonyos.sh --build-type release --sign

# Clean build
./scripts/build_harmonyos.sh --clean --build-type release

# Build with specific architecture
./scripts/build_harmonyos.sh --arch arm64-v8a --build-type release
```

## Configuration

### Application Configuration

The app uses `REChainConfig` for centralized configuration management:

```typescript
// Configuration example
const config = {
  // Notification settings
  notificationsEnabled: true,
  soundEnabled: true,
  vibrationEnabled: true,
  maxNotifications: 50,

  // System integration
  systemMonitoringEnabled: true,
  sensorMonitoringEnabled: true,
  batteryMonitoringEnabled: true,

  // Crash reporting
  crashReportingEnabled: true,
  autoSubmitCrashes: true,
  submissionEndpoint: "https://api.rechain.com/crash-reports"
};
```

### Build Configuration

Configure build settings in `build-profile.json5`:

```json5
{
  "app": {
    "signingConfigs": [],
    "products": [
      {
        "name": "default",
        "signingConfig": "default",
        "compatibleSdkVersion": "12",
        "runtimeOS": "HarmonyOS"
      }
    ]
  }
}
```

## Development

### Building the Application

1. **Debug Build**:
   ```bash
   ./hvigorw assembleHap --mode debug
   ```

2. **Release Build**:
   ```bash
   ./hvigorw assembleHap --mode release
   ```

3. **Using Build Script**:
   ```bash
   ./scripts/build_harmonyos.sh --build-type release --clean
   ```

### Testing

Run the comprehensive test suite:

```bash
# Unit tests
./scripts/test_harmonyos.sh

# Integration tests with device
./scripts/test_harmonyos.sh --device-id YOUR_DEVICE_ID

# Performance tests
RUN_PERFORMANCE_TESTS=true ./scripts/test_harmonyos.sh
```

### Deployment

Deploy to HarmonyOS devices:

```bash
# Deploy to connected device
./scripts/deploy_harmonyos.sh --deployment-type device

# Create installer package
./scripts/deploy_harmonyos.sh --deployment-type package

# Deploy and create package
./scripts/deploy_harmonyos.sh --deployment-type all
```

## API Reference

### REChainNotificationManager

```typescript
// Initialize notification manager
const notificationManager = new REChainNotificationManager();
await notificationManager.initialize(config);

// Display notification
const notification = {
  title: "New Message",
  body: "You have a new message from Alice",
  type: 0, // MESSAGE type
  priority: 1 // NORMAL priority
};
await notificationManager.displayNotification(notification);

// Clear notifications
await notificationManager.clearAllNotifications();
```

### REChainCrashReporter

```typescript
// Initialize crash reporter
const crashReporter = new REChainCrashReporter();
await crashReporter.initialize(config);

// Record error
crashReporter.recordError("Network connection failed", {
  endpoint: "https://matrix.org",
  statusCode: 500
});

// Add breadcrumb
crashReporter.addBreadcrumb("user_action", "button_clicked", {
  buttonId: "send_message"
});
```

### REChainSystemIntegration

```typescript
// Initialize system integration
const systemIntegration = new REChainSystemIntegration();
await systemIntegration.initialize(config);

// Get system status
const status = await systemIntegration.getSystemStatus();
console.log(`Battery: ${status.batteryLevel}%`);

// Monitor sensors
systemIntegration.startSensorMonitoring();
systemIntegration.addEventListener('sensorData', (data) => {
  console.log('Sensor data:', data);
});
```

## Permissions

The application requires the following HarmonyOS permissions:

### Required Permissions
- `ohos.permission.INTERNET` - Network communication
- `ohos.permission.NOTIFICATION_CONTROLLER` - Notification management
- `ohos.permission.PUBLISH_AGENT_REMINDER` - Reminder notifications
- `ohos.permission.VIBRATE` - Haptic feedback
- `ohos.permission.SYSTEM_FLOAT_WINDOW` - Floating windows

### Optional Permissions
- `ohos.permission.GET_NETWORK_INFO` - Network status monitoring
- `ohos.permission.ACCELEROMETER` - Motion sensing
- `ohos.permission.GYROSCOPE` - Orientation sensing
- `ohos.permission.READ_MEDIA` - Media file access
- `ohos.permission.WRITE_MEDIA` - Media file storage

## Performance Optimization

### Memory Management
- Efficient object lifecycle management
- Automatic cleanup of unused resources
- Memory leak detection and prevention

### Battery Optimization
- Intelligent background sync scheduling
- Adaptive notification frequency
- Power-aware sensor monitoring

### Network Optimization
- Connection pooling and reuse
- Adaptive sync intervals
- Offline capability with local storage

## Troubleshooting

### Common Issues

#### Build Failures
```bash
# Clean and rebuild
./scripts/build_harmonyos.sh --clean --build-type debug

# Check SDK installation
echo $HARMONYOS_SDK_ROOT
ls -la $HARMONYOS_SDK_ROOT
```

#### Device Connection Issues
```bash
# Check connected devices
hdc list targets

# Enable developer mode on device
# Settings > System > Developer options > USB debugging
```

#### Permission Issues
- Ensure all required permissions are declared in `module.json5`
- Check runtime permission requests in code
- Verify app signing configuration

### Debug Logging

Enable debug logging for troubleshooting:

```typescript
// In REChainConfig
const config = {
  debugMode: true,
  // ... other settings
};
```

View logs using hdc:
```bash
hdc hilog
```

## Security

### Data Protection
- End-to-end encryption for all messages
- Secure key storage using HarmonyOS KeyStore
- Certificate pinning for server connections
- Local data encryption

### Privacy Features
- Optional crash report submission
- Configurable telemetry collection
- User consent for data sharing
- GDPR compliance features

## Contributing

### Development Guidelines
1. Follow HarmonyOS coding standards
2. Use TypeScript/ETS for all code
3. Implement comprehensive error handling
4. Add unit tests for all new features
5. Update documentation for API changes

### Code Style
- Use 2-space indentation
- Follow camelCase naming convention
- Add JSDoc comments for public APIs
- Use async/await for asynchronous operations

### Testing Requirements
- Unit tests for all services
- Integration tests for device features
- Performance tests for critical paths
- Security tests for sensitive operations

## Changelog

### Version 4.1.4
- Initial HarmonyOS implementation
- Native notification system
- Comprehensive crash reporting
- Deep system integration
- Performance monitoring
- Build automation scripts

## License

REChain is licensed under the GNU General Public License v3.0. See [LICENSE](../LICENSE) for details.

## Support

### Documentation
- [API Documentation](API_REFERENCE.md)
- [Development Guide](DEVELOPMENT.md)
- [Deployment Guide](DEPLOYMENT.md)

### Community
- [GitHub Issues](https://github.com/sorydima/REChain-/issues)
- [Matrix Room](https://matrix.to/#/#rechain:matrix.org)
- [Developer Forum](https://forum.rechain.com)

### Commercial Support
For enterprise support and custom development, contact: support@rechain.com

---

**REChain HarmonyOS** - Secure, decentralized communication for the HarmonyOS ecosystem.
