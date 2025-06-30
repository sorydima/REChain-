import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Cinny Integration Service
/// Provides integration with Cinny modern web Matrix client
class CinnyIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Cinny services
  bool _webClientEnabled = false;
  bool _pwaSupportEnabled = false;
  bool _responsiveDesignEnabled = false;
  bool _modernUIEnabled = false;
  bool _customizationEnabled = false;
  bool _accessibilityEnabled = false;
  bool _performanceOptimizationEnabled = false;
  bool _offlineSupportEnabled = false;

  CinnyIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.cinny.in',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Cinny services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[CinnyIntegration] Initializing Cinny services...');
      }

      // Test connection to Cinny API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Cinny API is not available');
      }

      // Initialize individual services
      await _initializeWebClient();
      await _initializePWASupport();
      await _initializeResponsiveDesign();
      await _initializeModernUI();
      await _initializeCustomization();
      await _initializeAccessibility();
      await _initializePerformanceOptimization();
      await _initializeOfflineSupport();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[CinnyIntegration] Cinny services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[CinnyIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Cinny API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Web Client
  Future<void> _initializeWebClient() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/web/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _webClientEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[CinnyIntegration] Web client status: $_webClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[CinnyIntegration] Web client initialization failed: $e');
      }
    }
  }

  /// Initialize PWA Support
  Future<void> _initializePWASupport() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/pwa/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _pwaSupportEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[CinnyIntegration] PWA support status: $_pwaSupportEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[CinnyIntegration] PWA support initialization failed: $e');
      }
    }
  }

  /// Initialize Responsive Design
  Future<void> _initializeResponsiveDesign() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/responsive/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _responsiveDesignEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[CinnyIntegration] Responsive design status: $_responsiveDesignEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[CinnyIntegration] Responsive design initialization failed: $e');
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
          print('[CinnyIntegration] Modern UI status: $_modernUIEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[CinnyIntegration] Modern UI initialization failed: $e');
      }
    }
  }

  /// Initialize Customization
  Future<void> _initializeCustomization() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/customization/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _customizationEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[CinnyIntegration] Customization status: $_customizationEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[CinnyIntegration] Customization initialization failed: $e');
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
          print('[CinnyIntegration] Accessibility status: $_accessibilityEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[CinnyIntegration] Accessibility initialization failed: $e');
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
          print('[CinnyIntegration] Performance optimization status: $_performanceOptimizationEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[CinnyIntegration] Performance optimization initialization failed: $e');
      }
    }
  }

  /// Initialize Offline Support
  Future<void> _initializeOfflineSupport() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/offline/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _offlineSupportEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[CinnyIntegration] Offline support status: $_offlineSupportEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[CinnyIntegration] Offline support initialization failed: $e');
      }
    }
  }

  /// Create Cinny Web Session
  Future<Map<String, dynamic>> createWebSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
    Map<String, dynamic>? webSettings,
  }) async {
    if (!_webClientEnabled) {
      throw Exception('Cinny Web client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/web/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_cinny_web',
            'display_name': 'REChain Cinny Web',
          },
          'web_settings': webSettings ?? {
            'pwa_support': _pwaSupportEnabled,
            'responsive_design': _responsiveDesignEnabled,
            'modern_ui': _modernUIEnabled,
            'customization': _customizationEnabled,
            'accessibility': _accessibilityEnabled,
            'performance_optimization': _performanceOptimizationEnabled,
            'offline_support': _offlineSupportEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Cinny Web session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable PWA Support
  Future<Map<String, dynamic>> enablePWASupport({
    required String sessionId,
    Map<String, dynamic>? pwaSettings,
  }) async {
    if (!_pwaSupportEnabled) {
      throw Exception('PWA support is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/pwa/enable',
        body: {
          'session_id': sessionId,
          'settings': pwaSettings ?? {
            'install_prompt': true,
            'offline_caching': true,
            'background_sync': true,
            'push_notifications': true,
            'app_manifest': {
              'name': 'Cinny - REChain',
              'short_name': 'Cinny',
              'theme_color': '#1976d2',
              'background_color': '#ffffff',
            },
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable PWA support: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Responsive Design
  Future<Map<String, dynamic>> configureResponsiveDesign({
    required String sessionId,
    Map<String, dynamic>? responsiveSettings,
  }) async {
    if (!_responsiveDesignEnabled) {
      throw Exception('Responsive design is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/responsive/configure',
        body: {
          'session_id': sessionId,
          'settings': responsiveSettings ?? {
            'breakpoints': {
              'mobile': 768,
              'tablet': 1024,
              'desktop': 1200,
            },
            'adaptive_layout': true,
            'touch_friendly': true,
            'mobile_optimized': true,
            'responsive_images': true,
            'flexible_grid': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure responsive design: ${response.statusCode}');
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
            'icon_set': 'material',
            'color_scheme': 'blue',
            'layout_style': 'modern',
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

  /// Configure Customization
  Future<Map<String, dynamic>> configureCustomization({
    required String sessionId,
    Map<String, dynamic>? customizationSettings,
  }) async {
    if (!_customizationEnabled) {
      throw Exception('Customization is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/customization/configure',
        body: {
          'session_id': sessionId,
          'settings': customizationSettings ?? {
            'theme_customization': true,
            'color_customization': true,
            'font_customization': true,
            'layout_customization': true,
            'sidebar_customization': true,
            'message_customization': true,
            'notification_customization': true,
            'keyboard_shortcuts': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure customization: ${response.statusCode}');
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
            'code_splitting': true,
            'caching_strategy': 'aggressive',
            'compression': true,
            'minification': true,
            'prefetching': true,
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

  /// Enable Offline Support
  Future<Map<String, dynamic>> enableOfflineSupport({
    required String sessionId,
    Map<String, dynamic>? offlineSettings,
  }) async {
    if (!_offlineSupportEnabled) {
      throw Exception('Offline support is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/offline/enable',
        body: {
          'session_id': sessionId,
          'settings': offlineSettings ?? {
            'offline_caching': true,
            'message_queue': true,
            'sync_when_online': true,
            'offline_indicator': true,
            'cache_strategy': 'network_first',
            'storage_quota': '100MB',
            'background_sync': true,
            'offline_ui': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable offline support: ${response.statusCode}');
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
    if (!_customizationEnabled) {
      throw Exception('Customization is not enabled');
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
    if (!_customizationEnabled) {
      throw Exception('Customization is not enabled');
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

  /// Get Offline Status
  Future<Map<String, dynamic>> getOfflineStatus({
    required String sessionId,
  }) async {
    if (!_offlineSupportEnabled) {
      throw Exception('Offline support is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/offline/status',
        queryParams: {
          'session_id': sessionId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get offline status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Cinny Rooms
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
    'web_client': _webClientEnabled,
    'pwa_support': _pwaSupportEnabled,
    'responsive_design': _responsiveDesignEnabled,
    'modern_ui': _modernUIEnabled,
    'customization': _customizationEnabled,
    'accessibility': _accessibilityEnabled,
    'performance_optimization': _performanceOptimizationEnabled,
    'offline_support': _offlineSupportEnabled,
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
      'User-Agent': 'REChain-Cinny/1.0',
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