# Matrix Clients Integration

This document provides comprehensive information about the integration of FluffyChat and Krille-chan Matrix clients into the REChain ecosystem.

## Table of Contents

1. [Overview](#overview)
2. [FluffyChat Integration](#fluffychat-integration)
3. [Krille-chan Integration](#krille-chan-integration)
4. [Configuration](#configuration)
5. [Usage Examples](#usage-examples)
6. [API Reference](#api-reference)
7. [Troubleshooting](#troubleshooting)

## Overview

The Matrix Clients integration provides unified access to multiple Matrix client services:

- **FluffyChat**: Modern, cross-platform Matrix client with rich features
- **Krille-chan**: Lightweight, performance-focused Matrix client
- **Element.io**: Professional Matrix client suite (existing integration)

### Key Features

- **Unified Session Management**: Create sessions across different Matrix clients
- **Service Health Monitoring**: Real-time status monitoring for all services
- **Feature-Specific Actions**: Access to client-specific features and capabilities
- **Performance Optimization**: Resource management and performance tuning
- **Cross-Platform Support**: Web, desktop, and mobile client support

## FluffyChat Integration

### Overview

FluffyChat is a modern, cross-platform Matrix client that provides:

- Beautiful, intuitive user interface
- Group chat management
- File sharing capabilities
- Voice message support
- Custom sticker packs
- Theme customization
- Cross-platform availability (Web, Desktop, Mobile)

### Services

| Service | Description | Status |
|---------|-------------|--------|
| Mobile Client | iOS and Android applications | ✅ Enabled |
| Web Client | Browser-based access | ✅ Enabled |
| Desktop Client | Native desktop applications | ✅ Enabled |
| File Sharing | Secure file upload and sharing | ✅ Enabled |
| Voice Messages | Audio message support | ✅ Enabled |
| Stickers | Custom sticker packs | ✅ Enabled |
| Group Chats | Advanced group management | ✅ Enabled |
| Themes | Customizable UI themes | ✅ Enabled |

### Setup

1. **Configure API Key**:
   ```dart
   // In your configuration file
   const fluffychatConfig = {
     'api_key': 'your_fluffychat_api_key_here',
     'base_url': 'https://api.fluffychat.im',
   };
   ```

2. **Initialize Service**:
   ```dart
   final fluffyChatIntegration = FluffyChatIntegration(
     apiKey: 'your_api_key',
     baseUrl: 'https://api.fluffychat.im',
   );
   
   await fluffyChatIntegration.initialize();
   ```

3. **Add to Integration Manager**:
   ```dart
   final integrationManager = IntegrationManager(
     fluffyChatIntegration: fluffyChatIntegration,
     // ... other services
   );
   ```

### Usage Examples

#### Create Web Session
```dart
final session = await fluffyChatIntegration.createWebSession(
  userId: '@user:example.com',
  password: 'secure_password',
  deviceInfo: {
    'device_id': 'rechain_fluffychat_web',
    'display_name': 'REChain FluffyChat Web',
  },
);
```

#### Upload File
```dart
final result = await fluffyChatIntegration.uploadFile(
  roomId: '!room:example.com',
  fileName: 'document.pdf',
  fileData: fileBytes,
  mimeType: 'application/pdf',
  metadata: {
    'description': 'Important document',
    'tags': ['document', 'pdf'],
  },
);
```

#### Send Voice Message
```dart
final result = await fluffyChatIntegration.sendVoiceMessage(
  roomId: '!room:example.com',
  audioData: audioBytes,
  duration: 30, // seconds
  metadata: {
    'quality': 'high',
    'format': 'ogg',
  },
);
```

#### Get Available Stickers
```dart
final stickers = await fluffyChatIntegration.getStickers(
  category: 'emotions',
  limit: 20,
  offset: 0,
);
```

#### Create Group Chat
```dart
final group = await fluffyChatIntegration.createGroupChat(
  name: 'Project Team',
  participants: ['@user1:example.com', '@user2:example.com'],
  description: 'Team collaboration space',
  settings: {
    'encryption': true,
    'public': false,
    'allow_guest_access': false,
  },
);
```

#### Apply Theme
```dart
final result = await fluffyChatIntegration.applyTheme(
  themeId: 'dark_purple',
  clientType: 'web',
);
```

## Krille-chan Integration

### Overview

Krille-chan is a lightweight, performance-focused Matrix client that provides:

- Minimal, distraction-free user interface
- Optimized performance and resource usage
- Fast message synchronization
- Lightweight mode for low-resource environments
- Cross-platform availability

### Services

| Service | Description | Status |
|---------|-------------|--------|
| Web Client | Browser-based access | ✅ Enabled |
| Desktop Client | Native desktop applications | ✅ Enabled |
| Mobile Client | iOS and Android applications | ✅ Enabled |
| Minimal UI | Clean, distraction-free interface | ✅ Enabled |
| Performance Mode | Optimized for speed | ✅ Enabled |
| Resource Optimization | Low memory and CPU usage | ✅ Enabled |
| Fast Sync | Quick message synchronization | ✅ Enabled |
| Lightweight Mode | Reduced feature set for performance | ✅ Enabled |

### Setup

1. **Configure API Key**:
   ```dart
   // In your configuration file
   const krilleChanConfig = {
     'api_key': 'your_krille_chan_api_key_here',
     'base_url': 'https://api.krille-chan.dev',
   };
   ```

2. **Initialize Service**:
   ```dart
   final krilleChanIntegration = KrilleChanIntegration(
     apiKey: 'your_api_key',
     baseUrl: 'https://api.krille-chan.dev',
   );
   
   await krilleChanIntegration.initialize();
   ```

3. **Add to Integration Manager**:
   ```dart
   final integrationManager = IntegrationManager(
     krilleChanIntegration: krilleChanIntegration,
     // ... other services
   );
   ```

### Usage Examples

#### Create Web Session with Performance Mode
```dart
final session = await krilleChanIntegration.createWebSession(
  userId: '@user:example.com',
  password: 'secure_password',
  deviceInfo: {
    'device_id': 'rechain_krillechan_web',
    'display_name': 'REChain Krille-chan Web',
  },
  enableMinimalUI: true,
  enablePerformanceMode: true,
);
```

#### Enable Performance Mode
```dart
final result = await krilleChanIntegration.enablePerformanceMode(
  sessionId: 'session_id',
  performanceSettings: {
    'fast_sync': true,
    'resource_optimization': true,
    'lightweight_mode': true,
    'minimal_ui': true,
  },
);
```

#### Get Performance Metrics
```dart
final metrics = await krilleChanIntegration.getPerformanceMetrics(
  sessionId: 'session_id',
);
```

#### Optimize Resources
```dart
final result = await krilleChanIntegration.optimizeResources(
  sessionId: 'session_id',
  optimizationSettings: {
    'memory_limit': '512MB',
    'cpu_limit': '50%',
    'network_limit': '1MB/s',
    'cache_size': '100MB',
  },
);
```

#### Enable Fast Sync
```dart
final result = await krilleChanIntegration.enableFastSync(
  sessionId: 'session_id',
  syncSettings: {
    'batch_size': 100,
    'sync_interval': 5000, // 5 seconds
    'priority_rooms': [],
    'background_sync': true,
  },
);
```

#### Enable Lightweight Mode
```dart
final result = await krilleChanIntegration.enableLightweightMode(
  sessionId: 'session_id',
  lightweightSettings: {
    'disable_animations': true,
    'reduce_image_quality': true,
    'limit_message_history': 100,
    'disable_rich_text': true,
    'minimal_notifications': true,
  },
);
```

#### Apply UI Theme
```dart
final result = await krilleChanIntegration.applyUITheme(
  sessionId: 'session_id',
  themeId: 'minimal_dark',
);
```

## Configuration

### Environment Variables

```bash
# FluffyChat Configuration
FLUFFYCHAT_API_KEY=your_fluffychat_api_key
FLUFFYCHAT_BASE_URL=https://api.fluffychat.im
FLUFFYCHAT_TIMEOUT=30000

# Krille-chan Configuration
KRILLE_CHAN_API_KEY=your_krille_chan_api_key
KRILLE_CHAN_BASE_URL=https://api.krille-chan.dev
KRILLE_CHAN_TIMEOUT=15000
```

### Configuration File

```dart
// lib/config/matrix_clients_config.dart
class MatrixClientsConfig {
  static const Map<String, dynamic> fluffychatConfig = {
    'api_key': 'your_fluffychat_api_key_here',
    'base_url': 'https://api.fluffychat.im',
    'timeout': 30000,
    'retry_attempts': 3,
    // ... additional configuration
  };

  static const Map<String, dynamic> krilleChanConfig = {
    'api_key': 'your_krille_chan_api_key_here',
    'base_url': 'https://api.krille-chan.dev',
    'timeout': 15000,
    'retry_attempts': 2,
    // ... additional configuration
  };
}
```

## Usage Examples

### Unified Session Management

```dart
// Create session for any Matrix client
final session = await integrationManager.createUnifiedMatrixSession(
  userId: '@user:example.com',
  password: 'secure_password',
  clientType: 'fluffychat', // or 'krille_chan', 'element'
  deviceInfo: {
    'device_id': 'rechain_unified',
    'display_name': 'REChain Unified Client',
  },
  settings: {
    'minimal_ui': true,
    'performance_mode': true,
  },
);
```

### Service Health Monitoring

```dart
// Get comprehensive health overview
final health = await integrationManager.getSystemHealthOverview();

// Get Matrix client services overview
final matrixOverview = await integrationManager.getMatrixClientServicesOverview();

// Check specific service status
final fluffyChatHealth = await fluffyChatIntegration.getHealthStatus();
final krilleChanHealth = await krilleChanIntegration.getHealthStatus();
```

### Dashboard Integration

```dart
// Navigate to Matrix Clients Dashboard
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => MatrixClientsDashboard(
      integrationManager: integrationManager,
    ),
  ),
);
```

## API Reference

### FluffyChatIntegration

#### Methods

| Method | Description | Parameters |
|--------|-------------|------------|
| `initialize()` | Initialize all FluffyChat services | None |
| `createWebSession()` | Create web client session | `userId`, `password`, `deviceInfo` |
| `createMobileSession()` | Create mobile client session | `userId`, `password`, `deviceInfo` |
| `createDesktopSession()` | Create desktop client session | `userId`, `password`, `deviceInfo` |
| `uploadFile()` | Upload file to room | `roomId`, `fileName`, `fileData`, `mimeType`, `metadata` |
| `sendVoiceMessage()` | Send voice message | `roomId`, `audioData`, `duration`, `metadata` |
| `getStickers()` | Get available stickers | `category`, `limit`, `offset` |
| `sendSticker()` | Send sticker to room | `roomId`, `stickerId`, `metadata` |
| `createGroupChat()` | Create group chat | `name`, `participants`, `description`, `settings` |
| `getGroupChatInfo()` | Get group chat information | `roomId` |
| `getThemes()` | Get available themes | `category`, `isDark` |
| `applyTheme()` | Apply theme to client | `themeId`, `clientType` |
| `getRooms()` | Get user rooms | `userId`, `filters` |
| `getHealthStatus()` | Get service health status | None |
| `dispose()` | Clean up resources | None |

#### Properties

| Property | Type | Description |
|----------|------|-------------|
| `serviceStatus` | `Map<String, bool>` | Status of all services |
| `_isInitialized` | `bool` | Initialization status |
| `_lastError` | `String?` | Last error message |

### KrilleChanIntegration

#### Methods

| Method | Description | Parameters |
|--------|-------------|------------|
| `initialize()` | Initialize all Krille-chan services | None |
| `createWebSession()` | Create web client session | `userId`, `password`, `deviceInfo`, `enableMinimalUI`, `enablePerformanceMode` |
| `createDesktopSession()` | Create desktop client session | `userId`, `password`, `deviceInfo`, `enableMinimalUI`, `enablePerformanceMode` |
| `createMobileSession()` | Create mobile client session | `userId`, `password`, `deviceInfo`, `enableMinimalUI`, `enablePerformanceMode` |
| `enablePerformanceMode()` | Enable performance mode | `sessionId`, `performanceSettings` |
| `getPerformanceMetrics()` | Get performance metrics | `sessionId` |
| `optimizeResources()` | Optimize resource usage | `sessionId`, `optimizationSettings` |
| `enableFastSync()` | Enable fast synchronization | `sessionId`, `syncSettings` |
| `enableLightweightMode()` | Enable lightweight mode | `sessionId`, `lightweightSettings` |
| `getUIThemes()` | Get available UI themes | `isMinimal`, `isDark` |
| `applyUITheme()` | Apply UI theme | `sessionId`, `themeId` |
| `getRooms()` | Get user rooms | `userId`, `lightweight`, `filters` |
| `getSystemStatus()` | Get system status | None |
| `getHealthStatus()` | Get service health status | None |
| `dispose()` | Clean up resources | None |

#### Properties

| Property | Type | Description |
|----------|------|-------------|
| `serviceStatus` | `Map<String, bool>` | Status of all services |
| `_isInitialized` | `bool` | Initialization status |
| `_lastError` | `String?` | Last error message |

## Troubleshooting

### Common Issues

#### 1. Service Not Available

**Problem**: Service returns "not available" error

**Solution**:
- Check API key configuration
- Verify service endpoint is accessible
- Ensure service is enabled in configuration

```dart
// Check service status
final status = await integration.getHealthStatus();
print('Service status: ${status['status']}');
```

#### 2. Authentication Failed

**Problem**: Session creation fails with authentication error

**Solution**:
- Verify user credentials
- Check Matrix server connectivity
- Ensure user account exists

```dart
// Validate credentials before creating session
if (!MatrixClientsConfig.isValidUserId(userId)) {
  throw Exception('Invalid user ID format');
}
```

#### 3. File Upload Failed

**Problem**: File upload returns error

**Solution**:
- Check file size limits
- Verify supported file formats
- Ensure sufficient storage space

```dart
// Validate file before upload
if (!MatrixClientsConfig.isValidFileSize(fileSize)) {
  throw Exception('File size exceeds limit');
}
```

#### 4. Performance Issues

**Problem**: Slow response times or high resource usage

**Solution**:
- Enable performance mode (Krille-chan)
- Optimize resource settings
- Use lightweight mode

```dart
// Enable performance optimizations
await krilleChanIntegration.enablePerformanceMode(
  sessionId: sessionId,
  performanceSettings: {
    'fast_sync': true,
    'resource_optimization': true,
  },
);
```

### Error Codes

| Error Code | Description | Solution |
|------------|-------------|----------|
| `SERVICE_UNAVAILABLE` | Service is not available | Check service status and configuration |
| `AUTHENTICATION_FAILED` | Invalid credentials | Verify user credentials |
| `FILE_TOO_LARGE` | File exceeds size limit | Reduce file size or use compression |
| `UNSUPPORTED_FORMAT` | File format not supported | Convert to supported format |
| `ROOM_NOT_FOUND` | Room does not exist | Verify room ID and permissions |
| `PERMISSION_DENIED` | Insufficient permissions | Check user permissions |
| `NETWORK_ERROR` | Network connection failed | Check internet connectivity |
| `TIMEOUT_ERROR` | Request timed out | Increase timeout or retry |

### Debug Mode

Enable debug mode for detailed logging:

```dart
// Enable debug logging
if (kDebugMode) {
  print('[FluffyChatIntegration] Initializing services...');
  print('[KrilleChanIntegration] Performance mode enabled');
}
```

### Health Checks

Regular health checks help identify issues early:

```dart
// Periodic health check
Timer.periodic(const Duration(minutes: 5), (timer) async {
  final health = await integration.getHealthStatus();
  if (health['status'] != 'healthy') {
    print('Service health issue: ${health['last_error']}');
  }
});
```

## Next Steps

1. **Complete Implementation**: Implement remaining dialog functionality
2. **Testing**: Add comprehensive unit and integration tests
3. **Performance Optimization**: Fine-tune performance settings
4. **User Experience**: Enhance UI/UX for better usability
5. **Documentation**: Add more detailed API documentation
6. **Monitoring**: Implement advanced monitoring and alerting

## Support

For support and questions:

- **Documentation**: Check this document and inline code comments
- **Issues**: Report issues through the project's issue tracker
- **Community**: Join the REChain community for discussions
- **Development**: Contribute to the integration development

---

*Last updated: December 2024* 