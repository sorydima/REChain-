# REChain Web Platform Documentation

## Overview

The REChain web platform provides a comprehensive, production-ready web application with native-like features including autonomous notifications, crash reporting, PWA capabilities, and robust offline support. This document covers the complete web platform implementation, build system, deployment, and maintenance.

## Table of Contents

- [Architecture](#architecture)
- [Features](#features)
- [Web Services](#web-services)
- [Build System](#build-system)
- [Deployment](#deployment)
- [Configuration](#configuration)
- [Testing](#testing)
- [Performance](#performance)
- [Security](#security)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## Architecture

### Core Components

The REChain web platform consists of several integrated components:

```
REChain Web Platform
├── Flutter Web App (Dart/Flutter)
├── Web Services (JavaScript)
│   ├── AutonomousNotificationService
│   ├── CrashReportingManager
│   ├── WebSystemIntegration
│   ├── AutonomousNotificationIntegration
│   ├── WebPushService
│   └── ErrorHandler
├── Service Worker (sw.js)
├── PWA Configuration (manifest.json)
└── Build & Deployment Scripts
```

### Technology Stack

- **Frontend Framework**: Flutter Web with CanvasKit renderer
- **JavaScript Services**: Native Web APIs integration
- **Service Worker**: Custom caching and push notification handling
- **PWA Features**: Web App Manifest, offline support, installability
- **Build System**: Flutter build tools with custom optimization scripts
- **Deployment**: Multi-platform deployment scripts (Netlify, Vercel, Firebase, GitHub Pages)

## Features

### Core Features

- **Autonomous Notifications**: Native web notifications with service worker integration
- **Push Notifications**: Web push notifications with VAPID key support
- **Crash Reporting**: Comprehensive error tracking and reporting system
- **PWA Support**: Full Progressive Web App capabilities
- **Offline Support**: Service worker caching and offline page
- **System Integration**: Media session, keyboard shortcuts, file handling
- **Error Handling**: Centralized error management with recovery mechanisms

### Advanced Features

- **Background Sync**: Message synchronization when offline
- **Badge API**: Notification badges on app icon
- **Wake Lock**: Prevent screen sleep during active use
- **File Drag & Drop**: Native file handling capabilities
- **Clipboard Integration**: Copy/paste operations
- **Theme Detection**: System theme preference detection
- **Installation Prompts**: PWA installation management

## Web Services

### AutonomousNotificationService

Handles all notification functionality including:

```javascript
// Initialize notification service
const notificationService = new AutonomousNotificationService();
await notificationService.initialize({
  appName: 'REChain',
  icon: '/icons/Icon-192.png',
  soundPath: '/sounds/'
});

// Show notification
await notificationService.showMessageNotification(
  'John Doe',
  'Hello, how are you?',
  'room_123',
  { tag: 'message_room_123' }
);
```

**Features:**
- Multiple notification types (messages, calls, system)
- Sound support with Web Audio API
- Badge management
- Action buttons
- Click/close event handling

### CrashReportingManager

Comprehensive error tracking and logging:

```javascript
// Initialize crash reporting
const crashReporting = new CrashReportingManager();
await crashReporting.initialize({
  appName: 'REChain',
  version: '1.0.0',
  environment: 'production'
});

// Record error
crashReporting.recordError('Operation failed', {
  context: 'user_action',
  userId: 'user123'
});
```

**Features:**
- Global error capture
- Structured logging
- User identification
- Session management
- Breadcrumb tracking
- Performance monitoring

### WebSystemIntegration

System-level integration features:

```javascript
// Initialize system integration
const systemIntegration = new WebSystemIntegration();
await systemIntegration.initialize();

// Handle file drops
systemIntegration.setEventHandlers({
  fileDrop: (files) => handleFileUpload(files),
  visibilityChange: (isVisible) => updateUI(isVisible)
});
```

**Features:**
- PWA installation management
- Media session controls
- Keyboard shortcuts
- File handling
- System event monitoring
- Wake lock management

### WebPushService

Push notification subscription and management:

```javascript
// Initialize push service
const pushService = new WebPushService();
await pushService.initialize({
  vapidPublicKey: 'your-vapid-key',
  serverEndpoint: '/api/push/subscribe'
});

// Subscribe to push notifications
const subscription = await pushService.subscribe();
```

**Features:**
- VAPID key authentication
- Subscription management
- Server synchronization
- Push message handling
- Permission management

### ErrorHandler

Centralized error handling system:

```javascript
// Initialize error handler
const errorHandler = new ErrorHandler();
await errorHandler.initialize(crashReportingManager);

// Handle specific error types
errorHandler.handleNetworkError(error, { context: 'api_call' });
errorHandler.handlePermissionError(error, { permission: 'notifications' });
```

**Features:**
- Global error capture
- Error categorization
- User-friendly messages
- Recovery mechanisms
- Queue management

## Build System

### Build Scripts

The web platform includes comprehensive build scripts:

```bash
# Build for development
./scripts/build_web.sh debug

# Build for production
./scripts/build_web.sh release

# Build with optimizations
./scripts/build_web.sh release
```

### Build Process

1. **Dependency Check**: Verify Flutter and Node.js installation
2. **Clean Build**: Remove previous build artifacts
3. **Get Dependencies**: Install Flutter and npm packages
4. **Pre-build Optimization**: Minify JavaScript files
5. **Flutter Build**: Build Flutter web application
6. **Post-build Optimization**: Optimize assets and generate manifests
7. **Distribution Package**: Create deployment-ready package

### Build Configuration

The build system supports various optimizations:

- **Code Splitting**: Automatic code splitting for better loading
- **Tree Shaking**: Remove unused code
- **Asset Optimization**: Image and resource optimization
- **Service Worker Generation**: Automatic cache manifest generation
- **Security Headers**: Generate security configuration files

## Deployment

### Supported Platforms

The deployment system supports multiple hosting platforms:

```bash
# Deploy to Netlify
./scripts/deploy_web.sh netlify

# Deploy to Vercel
./scripts/deploy_web.sh vercel production

# Deploy to Firebase Hosting
./scripts/deploy_web.sh firebase

# Deploy to GitHub Pages
./scripts/deploy_web.sh github-pages

# Deploy to custom server
DEPLOY_HOST=user@server DEPLOY_PATH=/var/www/html ./scripts/deploy_web.sh custom
```

### Deployment Configuration

Each platform has specific configuration files:

- **Netlify**: `netlify.toml`
- **Vercel**: `vercel.json`
- **Firebase**: `firebase.json`
- **GitHub Pages**: Automatic gh-pages branch management
- **Custom**: rsync-based deployment

### Environment Configuration

Configure deployment settings in `deployment-config.json`:

```json
{
  "siteName": "rechain-web",
  "domain": "rechain.example.com",
  "buildCommand": "flutter build web --release",
  "publishDir": "build/web",
  "environmentVariables": {
    "NODE_VERSION": "18",
    "FLUTTER_VERSION": "stable"
  }
}
```

## Configuration

### Web Manifest

The PWA manifest (`manifest.json`) includes:

```json
{
  "name": "REChain - Decentralized Communication Platform",
  "short_name": "REChain",
  "display": "standalone",
  "background_color": "#0175C2",
  "theme_color": "#0175C2",
  "icons": [...],
  "shortcuts": [...],
  "share_target": {...},
  "protocol_handlers": [...]
}
```

### Service Worker

The service worker (`sw.js`) provides:

- **Caching Strategies**: Network-first, cache-first, stale-while-revalidate
- **Push Notifications**: Handle incoming push messages
- **Background Sync**: Sync data when connection is restored
- **Offline Support**: Serve cached content when offline

### Security Configuration

Security headers are configured for each deployment platform:

```
X-Frame-Options: SAMEORIGIN
X-Content-Type-Options: nosniff
X-XSS-Protection: 1; mode=block
Referrer-Policy: strict-origin-when-cross-origin
```

## Testing

### Test Suite

Comprehensive testing includes:

```bash
# Run all tests
./scripts/test_web.sh all

# Run specific test types
./scripts/test_web.sh unit
./scripts/test_web.sh integration
./scripts/test_web.sh pwa
./scripts/test_web.sh performance
./scripts/test_web.sh security
```

### Test Categories

1. **Unit Tests**: Flutter widget and Dart code tests
2. **Integration Tests**: End-to-end web functionality tests
3. **JavaScript Tests**: Web service module tests
4. **PWA Tests**: Progressive Web App feature validation
5. **Performance Tests**: Load time and resource analysis
6. **Security Tests**: Security header and vulnerability checks

### Test Reports

Tests generate comprehensive reports:

- **HTML Report**: Visual test results with coverage
- **Coverage Reports**: Code coverage analysis
- **Performance Metrics**: Load time and resource usage
- **Security Analysis**: Vulnerability and configuration checks

## Performance

### Optimization Strategies

1. **Code Splitting**: Lazy load components and routes
2. **Asset Optimization**: Compress images and resources
3. **Caching**: Aggressive caching with service worker
4. **Preloading**: Preload critical resources
5. **Compression**: Enable gzip/brotli compression

### Performance Monitoring

The platform includes performance monitoring:

```javascript
// Performance tracking
const performanceObserver = new PerformanceObserver((list) => {
  for (const entry of list.getEntries()) {
    crashReporting.logPerformance(entry.name, entry.duration);
  }
});
performanceObserver.observe({ entryTypes: ['measure', 'navigation'] });
```

### Metrics

Key performance metrics tracked:

- **First Contentful Paint (FCP)**
- **Largest Contentful Paint (LCP)**
- **First Input Delay (FID)**
- **Cumulative Layout Shift (CLS)**
- **Time to Interactive (TTI)**

## Security

### Security Features

1. **Content Security Policy**: Prevent XSS attacks
2. **HTTPS Enforcement**: Secure communication
3. **Secure Headers**: Security-focused HTTP headers
4. **Input Validation**: Sanitize user inputs
5. **Error Handling**: Secure error reporting

### Security Best Practices

- **VAPID Keys**: Secure push notification authentication
- **Origin Validation**: Validate message origins
- **Permission Handling**: Secure permission requests
- **Data Encryption**: Encrypt sensitive data
- **Audit Logging**: Log security events

### Security Configuration

Security settings in deployment configurations:

```toml
# Netlify example
[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "SAMEORIGIN"
    X-Content-Type-Options = "nosniff"
    X-XSS-Protection = "1; mode=block"
    Strict-Transport-Security = "max-age=31536000; includeSubDomains"
```

## Troubleshooting

### Common Issues

#### Service Worker Not Updating

```javascript
// Force service worker update
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.getRegistrations().then(registrations => {
    registrations.forEach(registration => registration.update());
  });
}
```

#### Notifications Not Working

1. Check notification permissions
2. Verify VAPID key configuration
3. Ensure HTTPS deployment
4. Check service worker registration

#### Build Failures

1. Verify Flutter installation: `flutter doctor`
2. Check dependencies: `flutter pub get`
3. Clear cache: `flutter clean`
4. Check build logs for specific errors

#### Deployment Issues

1. Verify platform CLI installation
2. Check authentication credentials
3. Validate configuration files
4. Review deployment logs

### Debug Mode

Enable debug mode for detailed logging:

```javascript
// Enable debug logging
window.REChainServices.errorHandler.updateConfig({
  enableConsoleLogging: true,
  enableRemoteLogging: false
});
```

### Log Analysis

Check browser console and network tabs for:

- JavaScript errors
- Network request failures
- Service worker messages
- Performance warnings

## Contributing

### Development Setup

1. **Clone Repository**:
   ```bash
   git clone https://github.com/your-org/rechain.git
   cd rechain
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   cd web && npm install
   ```

3. **Run Development Server**:
   ```bash
   flutter run -d chrome --web-port 8080
   ```

### Code Style

- **Dart**: Follow Flutter/Dart style guidelines
- **JavaScript**: Use ESLint configuration
- **Documentation**: Update README files for changes
- **Testing**: Write tests for new features

### Pull Request Process

1. Create feature branch from main
2. Implement changes with tests
3. Update documentation
4. Run full test suite
5. Submit pull request with description

### Release Process

1. Update version numbers
2. Run full test suite
3. Build production version
4. Deploy to staging
5. Validate deployment
6. Deploy to production
7. Tag release

## API Reference

### Notification Service API

```javascript
class AutonomousNotificationService {
  async initialize(config)
  async showMessageNotification(sender, message, roomId, options)
  async showCallNotification(caller, callId, isVideo, options)
  async cancelNotification(tag)
  async cancelAllNotifications()
  setEventHandlers(handlers)
  getNotificationPermission()
  async requestNotificationPermission()
}
```

### Crash Reporting API

```javascript
class CrashReportingManager {
  async initialize(config)
  recordError(message, context)
  logInfo(message, data)
  logWarning(message, data)
  logError(message, data)
  addBreadcrumb(breadcrumb)
  setUserIdentification(userId, email, username)
  setCustomKey(key, value)
}
```

### System Integration API

```javascript
class WebSystemIntegration {
  async initialize()
  setEventHandlers(handlers)
  async requestWakeLock()
  releaseWakeLock()
  async shareContent(data)
  detectInstallationStatus()
  showInstallPrompt()
}
```

## License

This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.

## Support

For support and questions:

- **Documentation**: Check this README and inline code comments
- **Issues**: Report bugs on GitHub Issues
- **Discussions**: Use GitHub Discussions for questions
- **Community**: Join our community channels

---

**Last Updated**: $(date)
**Version**: 1.0.0
**Maintainers**: REChain Development Team
