/// Matrix Clients Configuration
/// Configuration settings for FluffyChat and Krille-chan integrations
class MatrixClientsConfig {
  // FluffyChat Configuration
  static const Map<String, dynamic> fluffychatConfig = {
    'api_key': 'your_fluffychat_api_key_here',
    'base_url': 'https://api.fluffychat.im',
    'timeout': 30000, // milliseconds
    'retry_attempts': 3,
    'services': {
      'mobile_client': {
        'enabled': true,
        'features': [
          'group_chats',
          'file_sharing',
          'voice_messages',
          'stickers',
          'themes',
        ],
      },
      'web_client': {
        'enabled': true,
        'features': [
          'group_chats',
          'file_sharing',
          'voice_messages',
          'stickers',
          'themes',
        ],
      },
      'desktop_client': {
        'enabled': true,
        'features': [
          'group_chats',
          'file_sharing',
          'voice_messages',
          'stickers',
          'themes',
        ],
      },
      'file_sharing': {
        'enabled': true,
        'max_file_size': 100 * 1024 * 1024, // 100MB
        'supported_formats': [
          'image/*',
          'video/*',
          'audio/*',
          'application/pdf',
          'text/*',
        ],
      },
      'voice_messages': {
        'enabled': true,
        'max_duration': 300, // 5 minutes
        'supported_formats': ['audio/ogg', 'audio/mp3', 'audio/wav'],
      },
      'stickers': {
        'enabled': true,
        'categories': [
          'emotions',
          'animals',
          'food',
          'activities',
          'custom',
        ],
      },
      'group_chats': {
        'enabled': true,
        'max_participants': 1000,
        'features': [
          'encryption',
          'permissions',
          'moderation',
          'invitations',
        ],
      },
      'themes': {
        'enabled': true,
        'categories': [
          'light',
          'dark',
          'custom',
          'seasonal',
        ],
      },
    },
  };

  // Krille-chan Configuration
  static const Map<String, dynamic> krilleChanConfig = {
    'api_key': 'your_krille_chan_api_key_here',
    'base_url': 'https://api.krille-chan.dev',
    'timeout': 15000, // milliseconds (faster for lightweight client)
    'retry_attempts': 2,
    'services': {
      'web_client': {
        'enabled': true,
        'features': [
          'minimal_ui',
          'performance_mode',
          'resource_optimization',
          'fast_sync',
          'lightweight_mode',
        ],
      },
      'desktop_client': {
        'enabled': true,
        'features': [
          'minimal_ui',
          'performance_mode',
          'resource_optimization',
          'fast_sync',
          'lightweight_mode',
        ],
      },
      'mobile_client': {
        'enabled': true,
        'features': [
          'minimal_ui',
          'performance_mode',
          'resource_optimization',
          'fast_sync',
          'lightweight_mode',
        ],
      },
      'minimal_ui': {
        'enabled': true,
        'features': [
          'disable_animations',
          'reduce_image_quality',
          'limit_message_history',
          'disable_rich_text',
          'minimal_notifications',
        ],
      },
      'performance_mode': {
        'enabled': true,
        'features': [
          'fast_sync',
          'resource_optimization',
          'lightweight_mode',
          'minimal_ui',
        ],
      },
      'resource_optimization': {
        'enabled': true,
        'settings': {
          'memory_limit': '512MB',
          'cpu_limit': '50%',
          'network_limit': '1MB/s',
          'cache_size': '100MB',
        },
      },
      'fast_sync': {
        'enabled': true,
        'settings': {
          'batch_size': 100,
          'sync_interval': 5000, // 5 seconds
          'priority_rooms': [],
          'background_sync': true,
        },
      },
      'lightweight_mode': {
        'enabled': true,
        'features': [
          'disable_animations',
          'reduce_image_quality',
          'limit_message_history',
          'disable_rich_text',
          'minimal_notifications',
        ],
      },
    },
  };

  // Unified Matrix Configuration
  static const Map<String, dynamic> unifiedMatrixConfig = {
    'default_client': 'fluffychat', // 'fluffychat', 'krille_chan', 'element'
    'session_timeout': 3600, // 1 hour
    'auto_reconnect': true,
    'encryption': {
      'enabled': true,
      'algorithm': 'AES-256-GCM',
    },
    'notifications': {
      'enabled': true,
      'types': ['message', 'call', 'mention'],
    },
    'sync': {
      'enabled': true,
      'interval': 5000, // 5 seconds
      'batch_size': 100,
    },
  };

  // API Endpoints
  static const Map<String, String> apiEndpoints = {
    // FluffyChat endpoints
    'fluffychat_health': '/api/v1/health',
    'fluffychat_mobile_status': '/api/v1/mobile/status',
    'fluffychat_web_status': '/api/v1/web/status',
    'fluffychat_desktop_status': '/api/v1/desktop/status',
    'fluffychat_filesharing_status': '/api/v1/filesharing/status',
    'fluffychat_voicemessages_status': '/api/v1/voicemessages/status',
    'fluffychat_stickers_status': '/api/v1/stickers/status',
    'fluffychat_groupchats_status': '/api/v1/groupchats/status',
    'fluffychat_themes_status': '/api/v1/themes/status',
    'fluffychat_mobile_login': '/api/v1/mobile/login',
    'fluffychat_web_login': '/api/v1/web/login',
    'fluffychat_desktop_login': '/api/v1/desktop/login',
    'fluffychat_upload_file': '/api/v1/filesharing/upload',
    'fluffychat_send_voice': '/api/v1/voicemessages/send',
    'fluffychat_get_stickers': '/api/v1/stickers',
    'fluffychat_send_sticker': '/api/v1/stickers/send',
    'fluffychat_create_group': '/api/v1/groupchats/create',
    'fluffychat_group_info': '/api/v1/groupchats/{room_id}/info',
    'fluffychat_get_themes': '/api/v1/themes',
    'fluffychat_apply_theme': '/api/v1/themes/apply',
    'fluffychat_get_rooms': '/api/v1/rooms',

    // Krille-chan endpoints
    'krille_chan_health': '/api/v1/health',
    'krille_chan_web_status': '/api/v1/web/status',
    'krille_chan_desktop_status': '/api/v1/desktop/status',
    'krille_chan_mobile_status': '/api/v1/mobile/status',
    'krille_chan_ui_minimal_status': '/api/v1/ui/minimal/status',
    'krille_chan_performance_status': '/api/v1/performance/status',
    'krille_chan_resources_status': '/api/v1/resources/status',
    'krille_chan_sync_fast_status': '/api/v1/sync/fast/status',
    'krille_chan_lightweight_status': '/api/v1/lightweight/status',
    'krille_chan_web_login': '/api/v1/web/login',
    'krille_chan_desktop_login': '/api/v1/desktop/login',
    'krille_chan_mobile_login': '/api/v1/mobile/login',
    'krille_chan_performance_enable': '/api/v1/performance/enable',
    'krille_chan_performance_metrics': '/api/v1/performance/metrics',
    'krille_chan_resources_optimize': '/api/v1/resources/optimize',
    'krille_chan_sync_fast_enable': '/api/v1/sync/fast/enable',
    'krille_chan_lightweight_enable': '/api/v1/lightweight/enable',
    'krille_chan_ui_themes': '/api/v1/ui/themes',
    'krille_chan_ui_apply_theme': '/api/v1/ui/themes/apply',
    'krille_chan_get_rooms': '/api/v1/rooms',
    'krille_chan_system_status': '/api/v1/system/status',
  };

  // Error Messages
  static const Map<String, String> errorMessages = {
    'fluffychat_not_available': 'FluffyChat service is not available',
    'krille_chan_not_available': 'Krille-chan service is not available',
    'element_not_available': 'Element.io service is not available',
    'invalid_credentials': 'Invalid user credentials',
    'network_error': 'Network connection error',
    'timeout_error': 'Request timeout',
    'file_too_large': 'File size exceeds maximum limit',
    'unsupported_format': 'File format not supported',
    'room_not_found': 'Room not found',
    'permission_denied': 'Permission denied',
    'service_disabled': 'Service is disabled',
  };

  // Success Messages
  static const Map<String, String> successMessages = {
    'session_created': 'Session created successfully',
    'file_uploaded': 'File uploaded successfully',
    'voice_sent': 'Voice message sent successfully',
    'sticker_sent': 'Sticker sent successfully',
    'group_created': 'Group chat created successfully',
    'theme_applied': 'Theme applied successfully',
    'performance_enabled': 'Performance mode enabled',
    'resources_optimized': 'Resources optimized successfully',
    'sync_enabled': 'Fast sync enabled',
    'lightweight_enabled': 'Lightweight mode enabled',
  };

  // Validation Rules
  static const Map<String, dynamic> validationRules = {
    'user_id': {
      'pattern': r'^@[a-zA-Z0-9._%+-]+:[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      'message': 'User ID must be in format @user:domain.com',
    },
    'password': {
      'min_length': 8,
      'max_length': 128,
      'message': 'Password must be between 8 and 128 characters',
    },
    'room_id': {
      'pattern': r'^![a-zA-Z0-9._%+-]+:[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      'message': 'Room ID must be in format !room:domain.com',
    },
    'file_size': {
      'max': 100 * 1024 * 1024, // 100MB
      'message': 'File size must not exceed 100MB',
    },
    'voice_duration': {
      'max': 300, // 5 minutes
      'message': 'Voice message must not exceed 5 minutes',
    },
  };

  // Performance Settings
  static const Map<String, dynamic> performanceSettings = {
    'fluffychat': {
      'sync_interval': 10000, // 10 seconds
      'batch_size': 50,
      'cache_size': '200MB',
      'max_concurrent_requests': 5,
    },
    'krille_chan': {
      'sync_interval': 5000, // 5 seconds
      'batch_size': 100,
      'cache_size': '100MB',
      'max_concurrent_requests': 10,
    },
    'element': {
      'sync_interval': 15000, // 15 seconds
      'batch_size': 25,
      'cache_size': '500MB',
      'max_concurrent_requests': 3,
    },
  };

  // Theme Settings
  static const Map<String, dynamic> themeSettings = {
    'fluffychat': {
      'default_theme': 'light',
      'available_themes': [
        'light',
        'dark',
        'purple',
        'blue',
        'green',
        'custom',
      ],
    },
    'krille_chan': {
      'default_theme': 'minimal_light',
      'available_themes': [
        'minimal_light',
        'minimal_dark',
        'performance_light',
        'performance_dark',
        'custom',
      ],
    },
    'element': {
      'default_theme': 'light',
      'available_themes': [
        'light',
        'dark',
        'high_contrast',
        'custom',
      ],
    },
  };

  /// Get configuration for a specific client
  static Map<String, dynamic> getClientConfig(String clientType) {
    switch (clientType.toLowerCase()) {
      case 'fluffychat':
        return fluffychatConfig;
      case 'krille_chan':
        return krilleChanConfig;
      default:
        throw ArgumentError('Unknown client type: $clientType');
    }
  }

  /// Get API endpoint for a specific service
  static String getApiEndpoint(String endpointKey) {
    return apiEndpoints[endpointKey] ?? '';
  }

  /// Get error message for a specific error
  static String getErrorMessage(String errorKey) {
    return errorMessages[errorKey] ?? 'Unknown error occurred';
  }

  /// Get success message for a specific action
  static String getSuccessMessage(String successKey) {
    return successMessages[successKey] ?? 'Action completed successfully';
  }

  /// Validate user ID format
  static bool isValidUserId(String userId) {
    final pattern = RegExp(validationRules['user_id']['pattern']);
    return pattern.hasMatch(userId);
  }

  /// Validate password
  static bool isValidPassword(String password) {
    return password.length >= validationRules['password']['min_length'] &&
           password.length <= validationRules['password']['max_length'];
  }

  /// Validate room ID format
  static bool isValidRoomId(String roomId) {
    final pattern = RegExp(validationRules['room_id']['pattern']);
    return pattern.hasMatch(roomId);
  }

  /// Validate file size
  static bool isValidFileSize(int fileSize) {
    return fileSize <= validationRules['file_size']['max'];
  }

  /// Validate voice message duration
  static bool isValidVoiceDuration(int duration) {
    return duration <= validationRules['voice_duration']['max'];
  }

  /// Get performance settings for a client
  static Map<String, dynamic> getPerformanceSettings(String clientType) {
    return performanceSettings[clientType] ?? {};
  }

  /// Get theme settings for a client
  static Map<String, dynamic> getThemeSettings(String clientType) {
    return themeSettings[clientType] ?? {};
  }
} 