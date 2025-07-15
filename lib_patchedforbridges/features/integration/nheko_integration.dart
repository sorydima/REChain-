import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Nheko Integration Service
/// Provides integration with Nheko native desktop Matrix client
class NhekoIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Nheko services
  bool _desktopClientEnabled = false;
  bool _nativeIntegrationEnabled = false;
  bool _advancedFeaturesEnabled = false;
  bool _desktopNotificationsEnabled = false;
  bool _systemTrayEnabled = false;
  bool _keyboardShortcutsEnabled = false;
  bool _themeSupportEnabled = false;
  bool _pluginSystemEnabled = false;

  NhekoIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.nheko.im',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Nheko services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[NhekoIntegration] Initializing Nheko services...');
      }

      // Test connection to Nheko API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Nheko API is not available');
      }

      // Initialize individual services
      await _initializeDesktopClient();
      await _initializeNativeIntegration();
      await _initializeAdvancedFeatures();
      await _initializeDesktopNotifications();
      await _initializeSystemTray();
      await _initializeKeyboardShortcuts();
      await _initializeThemeSupport();
      await _initializePluginSystem();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[NhekoIntegration] Nheko services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[NhekoIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Nheko API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Desktop Client
  Future<void> _initializeDesktopClient() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/desktop/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _desktopClientEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NhekoIntegration] Desktop client status: $_desktopClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NhekoIntegration] Desktop client initialization failed: $e');
      }
    }
  }

  /// Initialize Native Integration
  Future<void> _initializeNativeIntegration() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/native/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _nativeIntegrationEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NhekoIntegration] Native integration status: $_nativeIntegrationEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NhekoIntegration] Native integration initialization failed: $e');
      }
    }
  }

  /// Initialize Advanced Features
  Future<void> _initializeAdvancedFeatures() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/advanced/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _advancedFeaturesEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NhekoIntegration] Advanced features status: $_advancedFeaturesEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NhekoIntegration] Advanced features initialization failed: $e');
      }
    }
  }

  /// Initialize Desktop Notifications
  Future<void> _initializeDesktopNotifications() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/notifications/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _desktopNotificationsEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NhekoIntegration] Desktop notifications status: $_desktopNotificationsEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NhekoIntegration] Desktop notifications initialization failed: $e');
      }
    }
  }

  /// Initialize System Tray
  Future<void> _initializeSystemTray() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/systemtray/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _systemTrayEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NhekoIntegration] System tray status: $_systemTrayEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NhekoIntegration] System tray initialization failed: $e');
      }
    }
  }

  /// Initialize Keyboard Shortcuts
  Future<void> _initializeKeyboardShortcuts() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/shortcuts/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _keyboardShortcutsEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NhekoIntegration] Keyboard shortcuts status: $_keyboardShortcutsEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NhekoIntegration] Keyboard shortcuts initialization failed: $e');
      }
    }
  }

  /// Initialize Theme Support
  Future<void> _initializeThemeSupport() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/themes/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _themeSupportEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NhekoIntegration] Theme support status: $_themeSupportEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NhekoIntegration] Theme support initialization failed: $e');
      }
    }
  }

  /// Initialize Plugin System
  Future<void> _initializePluginSystem() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/plugins/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _pluginSystemEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NhekoIntegration] Plugin system status: $_pluginSystemEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NhekoIntegration] Plugin system initialization failed: $e');
      }
    }
  }

  /// Create Nheko Desktop Session
  Future<Map<String, dynamic>> createDesktopSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
    Map<String, dynamic>? desktopSettings,
  }) async {
    if (!_desktopClientEnabled) {
      throw Exception('Nheko Desktop client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/desktop/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_nheko_desktop',
            'display_name': 'REChain Nheko Desktop',
          },
          'desktop_settings': desktopSettings ?? {
            'native_integration': _nativeIntegrationEnabled,
            'desktop_notifications': _desktopNotificationsEnabled,
            'system_tray': _systemTrayEnabled,
            'keyboard_shortcuts': _keyboardShortcutsEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Nheko Desktop session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Native Integration
  Future<Map<String, dynamic>> enableNativeIntegration({
    required String sessionId,
    Map<String, dynamic>? integrationSettings,
  }) async {
    if (!_nativeIntegrationEnabled) {
      throw Exception('Native integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/native/enable',
        body: {
          'session_id': sessionId,
          'settings': integrationSettings ?? {
            'desktop_notifications': true,
            'system_tray': true,
            'file_associations': true,
            'url_handling': true,
            'clipboard_integration': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable native integration: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Desktop Notifications
  Future<Map<String, dynamic>> configureDesktopNotifications({
    required String sessionId,
    Map<String, dynamic>? notificationSettings,
  }) async {
    if (!_desktopNotificationsEnabled) {
      throw Exception('Desktop notifications are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/notifications/configure',
        body: {
          'session_id': sessionId,
          'settings': notificationSettings ?? {
            'enabled': true,
            'sound': true,
            'badge': true,
            'mention_notifications': true,
            'message_notifications': true,
            'call_notifications': true,
            'quiet_hours': {
              'enabled': false,
              'start': '22:00',
              'end': '08:00',
            },
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure desktop notifications: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure System Tray
  Future<Map<String, dynamic>> configureSystemTray({
    required String sessionId,
    Map<String, dynamic>? traySettings,
  }) async {
    if (!_systemTrayEnabled) {
      throw Exception('System tray is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/systemtray/configure',
        body: {
          'session_id': sessionId,
          'settings': traySettings ?? {
            'enabled': true,
            'show_unread_count': true,
            'minimize_to_tray': true,
            'start_minimized': false,
            'tray_icon': 'default',
            'context_menu': {
              'show_rooms': true,
              'show_quick_actions': true,
              'show_settings': true,
            },
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure system tray: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Keyboard Shortcuts
  Future<Map<String, dynamic>> configureKeyboardShortcuts({
    required String sessionId,
    Map<String, dynamic>? shortcutSettings,
  }) async {
    if (!_keyboardShortcutsEnabled) {
      throw Exception('Keyboard shortcuts are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/shortcuts/configure',
        body: {
          'session_id': sessionId,
          'settings': shortcutSettings ?? {
            'enabled': true,
            'shortcuts': {
              'new_room': 'Ctrl+N',
              'search': 'Ctrl+F',
              'settings': 'Ctrl+,',
              'quit': 'Ctrl+Q',
              'minimize': 'Ctrl+M',
              'toggle_sidebar': 'Ctrl+B',
              'next_room': 'Ctrl+Tab',
              'previous_room': 'Ctrl+Shift+Tab',
            },
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure keyboard shortcuts: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Available Themes
  Future<List<Map<String, dynamic>>> getThemes({
    String? category,
    bool? isDark,
  }) async {
    if (!_themeSupportEnabled) {
      throw Exception('Theme support is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/themes',
        queryParams: {
          if (category != null) 'category': category,
          if (isDark != null) 'is_dark': isDark.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['themes'] ?? []);
      } else {
        throw Exception('Failed to get themes: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Apply Theme
  Future<Map<String, dynamic>> applyTheme({
    required String sessionId,
    required String themeId,
  }) async {
    if (!_themeSupportEnabled) {
      throw Exception('Theme support is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/themes/apply',
        body: {
          'session_id': sessionId,
          'theme_id': themeId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to apply theme: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Available Plugins
  Future<List<Map<String, dynamic>>> getPlugins({
    String? category,
    bool? isEnabled,
  }) async {
    if (!_pluginSystemEnabled) {
      throw Exception('Plugin system is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/plugins',
        queryParams: {
          if (category != null) 'category': category,
          if (isEnabled != null) 'is_enabled': isEnabled.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['plugins'] ?? []);
      } else {
        throw Exception('Failed to get plugins: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Install Plugin
  Future<Map<String, dynamic>> installPlugin({
    required String sessionId,
    required String pluginId,
  }) async {
    if (!_pluginSystemEnabled) {
      throw Exception('Plugin system is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/plugins/install',
        body: {
          'session_id': sessionId,
          'plugin_id': pluginId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to install plugin: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Plugin
  Future<Map<String, dynamic>> enablePlugin({
    required String sessionId,
    required String pluginId,
  }) async {
    if (!_pluginSystemEnabled) {
      throw Exception('Plugin system is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/plugins/enable',
        body: {
          'session_id': sessionId,
          'plugin_id': pluginId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable plugin: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Advanced Features
  Future<List<Map<String, dynamic>>> getAdvancedFeatures({
    String? category,
  }) async {
    if (!_advancedFeaturesEnabled) {
      throw Exception('Advanced features are not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/advanced/features',
        queryParams: {
          if (category != null) 'category': category,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['features'] ?? []);
      } else {
        throw Exception('Failed to get advanced features: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Advanced Feature
  Future<Map<String, dynamic>> enableAdvancedFeature({
    required String sessionId,
    required String featureId,
    Map<String, dynamic>? settings,
  }) async {
    if (!_advancedFeaturesEnabled) {
      throw Exception('Advanced features are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/advanced/enable',
        body: {
          'session_id': sessionId,
          'feature_id': featureId,
          'settings': settings ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable advanced feature: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Nheko Rooms
  Future<List<Map<String, dynamic>>> getRooms({
    String? userId,
    Map<String, dynamic>? filters,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/rooms',
        queryParams: {
          if (userId != null) 'user_id': userId,
          if (filters != null) 'filters': jsonEncode(filters),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['rooms'] ?? []);
      } else {
        throw Exception('Failed to get rooms: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'desktop_client': _desktopClientEnabled,
    'native_integration': _nativeIntegrationEnabled,
    'advanced_features': _advancedFeaturesEnabled,
    'desktop_notifications': _desktopNotificationsEnabled,
    'system_tray': _systemTrayEnabled,
    'keyboard_shortcuts': _keyboardShortcutsEnabled,
    'theme_support': _themeSupportEnabled,
    'plugin_system': _pluginSystemEnabled,
  };

  /// Get service health
  Future<Map<String, dynamic>> getHealthStatus() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/health');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'status': 'healthy',
          'services': serviceStatus,
          'last_error': _lastError,
          'details': data,
        };
      } else {
        return {
          'status': 'unhealthy',
          'services': serviceStatus,
          'last_error': 'Health check failed',
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'services': serviceStatus,
        'last_error': e.toString(),
      };
    }
  }

  /// Make HTTP request
  Future<http.Response> _makeRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    final uri = Uri.parse('$_baseUrl$endpoint').replace(
      queryParameters: queryParams,
    );

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
      'User-Agent': 'REChain-Nheko/1.0',
    };

    try {
      http.Response response;
      
      switch (method.toUpperCase()) {
        case 'GET':
          response = await _client.get(uri, headers: headers);
          break;
        case 'POST':
          response = await _client.post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      return response;
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    _client.close();
    _isInitialized = false;
  }
} 