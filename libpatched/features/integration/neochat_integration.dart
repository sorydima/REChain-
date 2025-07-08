import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// NeoChat Integration Service
/// Provides integration with NeoChat KDE Plasma Matrix client
class NeoChatIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // NeoChat services
  bool _desktopClientEnabled = false;
  bool _mobileClientEnabled = false;
  bool _kdeIntegrationEnabled = false;
  bool _plasmaIntegrationEnabled = false;
  bool _modernUIEnabled = false;
  bool _accessibilityEnabled = false;
  bool _performanceOptimizationEnabled = false;
  bool _crossPlatformEnabled = false;

  NeoChatIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.neochat.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all NeoChat services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[NeoChatIntegration] Initializing NeoChat services...');
      }

      // Test connection to NeoChat API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('NeoChat API is not available');
      }

      // Initialize individual services
      await _initializeDesktopClient();
      await _initializeMobileClient();
      await _initializeKDEIntegration();
      await _initializePlasmaIntegration();
      await _initializeModernUI();
      await _initializeAccessibility();
      await _initializePerformanceOptimization();
      await _initializeCrossPlatform();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[NeoChatIntegration] NeoChat services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[NeoChatIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to NeoChat API
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
          print('[NeoChatIntegration] Desktop client status: $_desktopClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NeoChatIntegration] Desktop client initialization failed: $e');
      }
    }
  }

  /// Initialize Mobile Client
  Future<void> _initializeMobileClient() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/mobile/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _mobileClientEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NeoChatIntegration] Mobile client status: $_mobileClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NeoChatIntegration] Mobile client initialization failed: $e');
      }
    }
  }

  /// Initialize KDE Integration
  Future<void> _initializeKDEIntegration() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/kde/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _kdeIntegrationEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NeoChatIntegration] KDE integration status: $_kdeIntegrationEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NeoChatIntegration] KDE integration initialization failed: $e');
      }
    }
  }

  /// Initialize Plasma Integration
  Future<void> _initializePlasmaIntegration() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/plasma/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _plasmaIntegrationEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NeoChatIntegration] Plasma integration status: $_plasmaIntegrationEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NeoChatIntegration] Plasma integration initialization failed: $e');
      }
    }
  }

  /// Initialize Modern UI
  Future<void> _initializeModernUI() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/ui/modern/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _modernUIEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NeoChatIntegration] Modern UI status: $_modernUIEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NeoChatIntegration] Modern UI initialization failed: $e');
      }
    }
  }

  /// Initialize Accessibility
  Future<void> _initializeAccessibility() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/accessibility/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _accessibilityEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NeoChatIntegration] Accessibility status: $_accessibilityEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NeoChatIntegration] Accessibility initialization failed: $e');
      }
    }
  }

  /// Initialize Performance Optimization
  Future<void> _initializePerformanceOptimization() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/performance/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _performanceOptimizationEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NeoChatIntegration] Performance optimization status: $_performanceOptimizationEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NeoChatIntegration] Performance optimization initialization failed: $e');
      }
    }
  }

  /// Initialize Cross Platform
  Future<void> _initializeCrossPlatform() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/crossplatform/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _crossPlatformEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[NeoChatIntegration] Cross platform status: $_crossPlatformEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[NeoChatIntegration] Cross platform initialization failed: $e');
      }
    }
  }

  /// Create NeoChat Desktop Session
  Future<Map<String, dynamic>> createDesktopSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
    Map<String, dynamic>? desktopSettings,
  }) async {
    if (!_desktopClientEnabled) {
      throw Exception('NeoChat Desktop client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/desktop/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_neochat_desktop',
            'display_name': 'REChain NeoChat Desktop',
          },
          'desktop_settings': desktopSettings ?? {
            'kde_integration': _kdeIntegrationEnabled,
            'plasma_integration': _plasmaIntegrationEnabled,
            'modern_ui': _modernUIEnabled,
            'accessibility': _accessibilityEnabled,
            'performance_optimization': _performanceOptimizationEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create NeoChat Desktop session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Create NeoChat Mobile Session
  Future<Map<String, dynamic>> createMobileSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
    Map<String, dynamic>? mobileSettings,
  }) async {
    if (!_mobileClientEnabled) {
      throw Exception('NeoChat Mobile client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/mobile/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_neochat_mobile',
            'display_name': 'REChain NeoChat Mobile',
          },
          'mobile_settings': mobileSettings ?? {
            'modern_ui': _modernUIEnabled,
            'accessibility': _accessibilityEnabled,
            'performance_optimization': _performanceOptimizationEnabled,
            'cross_platform': _crossPlatformEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create NeoChat Mobile session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable KDE Integration
  Future<Map<String, dynamic>> enableKDEIntegration({
    required String sessionId,
    Map<String, dynamic>? kdeSettings,
  }) async {
    if (!_kdeIntegrationEnabled) {
      throw Exception('KDE integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/kde/enable',
        body: {
          'session_id': sessionId,
          'settings': kdeSettings ?? {
            'kde_notifications': true,
            'kde_wallet_integration': true,
            'kde_theme_integration': true,
            'kde_file_associations': true,
            'kde_url_handling': true,
            'kde_clipboard_integration': true,
            'kde_global_shortcuts': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable KDE integration: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Plasma Integration
  Future<Map<String, dynamic>> enablePlasmaIntegration({
    required String sessionId,
    Map<String, dynamic>? plasmaSettings,
  }) async {
    if (!_plasmaIntegrationEnabled) {
      throw Exception('Plasma integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/plasma/enable',
        body: {
          'session_id': sessionId,
          'settings': plasmaSettings ?? {
            'plasma_notifications': true,
            'plasma_widgets': true,
            'plasma_activities': true,
            'plasma_workspace_integration': true,
            'plasma_theme_integration': true,
            'plasma_global_menu': true,
            'plasma_task_manager': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable Plasma integration: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Modern UI
  Future<Map<String, dynamic>> configureModernUI({
    required String sessionId,
    Map<String, dynamic>? uiSettings,
  }) async {
    if (!_modernUIEnabled) {
      throw Exception('Modern UI is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/ui/modern/configure',
        body: {
          'session_id': sessionId,
          'settings': uiSettings ?? {
            'material_design': true,
            'dark_mode': false,
            'animations': true,
            'smooth_transitions': true,
            'modern_typography': true,
            'icon_set': 'breeze',
            'color_scheme': 'blue',
            'layout_style': 'modern',
            'responsive_design': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure modern UI: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Accessibility
  Future<Map<String, dynamic>> configureAccessibility({
    required String sessionId,
    Map<String, dynamic>? accessibilitySettings,
  }) async {
    if (!_accessibilityEnabled) {
      throw Exception('Accessibility is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/accessibility/configure',
        body: {
          'session_id': sessionId,
          'settings': accessibilitySettings ?? {
            'screen_reader_support': true,
            'high_contrast_mode': false,
            'large_text_mode': false,
            'keyboard_navigation': true,
            'focus_indicators': true,
            'color_blind_friendly': false,
            'reduced_motion': false,
            'alt_text_for_images': true,
            'kde_accessibility_integration': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure accessibility: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Performance Optimization
  Future<Map<String, dynamic>> enablePerformanceOptimization({
    required String sessionId,
    Map<String, dynamic>? performanceSettings,
  }) async {
    if (!_performanceOptimizationEnabled) {
      throw Exception('Performance optimization is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/performance/enable',
        body: {
          'session_id': sessionId,
          'settings': performanceSettings ?? {
            'lazy_loading': true,
            'virtual_scrolling': true,
            'image_optimization': true,
            'memory_optimization': true,
            'cpu_optimization': true,
            'network_optimization': true,
            'caching_strategy': 'aggressive',
            'background_processing': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable performance optimization: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Cross Platform Support
  Future<Map<String, dynamic>> enableCrossPlatformSupport({
    required String sessionId,
    Map<String, dynamic>? crossPlatformSettings,
  }) async {
    if (!_crossPlatformEnabled) {
      throw Exception('Cross platform support is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/crossplatform/enable',
        body: {
          'session_id': sessionId,
          'settings': crossPlatformSettings ?? {
            'linux_support': true,
            'android_support': true,
            'windows_support': true,
            'macos_support': true,
            'web_support': true,
            'unified_experience': true,
            'sync_across_platforms': true,
            'platform_specific_features': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable cross platform support: ${response.statusCode}');
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

  /// Get Performance Metrics
  Future<Map<String, dynamic>> getPerformanceMetrics({
    required String sessionId,
  }) async {
    if (!_performanceOptimizationEnabled) {
      throw Exception('Performance optimization is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/performance/metrics',
        queryParams: {
          'session_id': sessionId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get performance metrics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Platform Information
  Future<Map<String, dynamic>> getPlatformInformation({
    required String sessionId,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/platform/info',
        queryParams: {
          'session_id': sessionId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get platform information: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get NeoChat Rooms
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
    'mobile_client': _mobileClientEnabled,
    'kde_integration': _kdeIntegrationEnabled,
    'plasma_integration': _plasmaIntegrationEnabled,
    'modern_ui': _modernUIEnabled,
    'accessibility': _accessibilityEnabled,
    'performance_optimization': _performanceOptimizationEnabled,
    'cross_platform': _crossPlatformEnabled,
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
      'User-Agent': 'REChain-NeoChat/1.0',
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