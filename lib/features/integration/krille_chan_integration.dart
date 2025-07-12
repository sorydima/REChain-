import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Krille-chan Integration Service
/// Provides integration with Krille-chan lightweight Matrix client
class KrilleChanIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Krille-chan services
  bool _webClientEnabled = false;
  bool _desktopClientEnabled = false;
  bool _mobileClientEnabled = false;
  bool _minimalUIEnabled = false;
  bool _performanceModeEnabled = false;
  bool _resourceOptimizationEnabled = false;
  bool _fastSyncEnabled = false;
  bool _lightweightModeEnabled = false;

  KrilleChanIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.krille-chan.dev',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Krille-chan services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Initializing Krille-chan services...');
      }

      // Test connection to Krille-chan API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Krille-chan API is not available');
      }

      // Initialize individual services
      await _initializeWebClient();
      await _initializeDesktopClient();
      await _initializeMobileClient();
      await _initializeMinimalUI();
      await _initializePerformanceMode();
      await _initializeResourceOptimization();
      await _initializeFastSync();
      await _initializeLightweightMode();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[KrilleChanIntegration] Krille-chan services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[KrilleChanIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Krille-chan API
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
          print('[KrilleChanIntegration] Web client status: $_webClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Web client initialization failed: $e');
      }
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
          print('[KrilleChanIntegration] Desktop client status: $_desktopClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Desktop client initialization failed: $e');
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
          print('[KrilleChanIntegration] Mobile client status: $_mobileClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Mobile client initialization failed: $e');
      }
    }
  }

  /// Initialize Minimal UI
  Future<void> _initializeMinimalUI() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/ui/minimal/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _minimalUIEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[KrilleChanIntegration] Minimal UI status: $_minimalUIEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Minimal UI initialization failed: $e');
      }
    }
  }

  /// Initialize Performance Mode
  Future<void> _initializePerformanceMode() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/performance/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _performanceModeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[KrilleChanIntegration] Performance mode status: $_performanceModeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Performance mode initialization failed: $e');
      }
    }
  }

  /// Initialize Resource Optimization
  Future<void> _initializeResourceOptimization() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/resources/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _resourceOptimizationEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[KrilleChanIntegration] Resource optimization status: $_resourceOptimizationEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Resource optimization initialization failed: $e');
      }
    }
  }

  /// Initialize Fast Sync
  Future<void> _initializeFastSync() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/sync/fast/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _fastSyncEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[KrilleChanIntegration] Fast sync status: $_fastSyncEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Fast sync initialization failed: $e');
      }
    }
  }

  /// Initialize Lightweight Mode
  Future<void> _initializeLightweightMode() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/lightweight/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _lightweightModeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[KrilleChanIntegration] Lightweight mode status: $_lightweightModeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[KrilleChanIntegration] Lightweight mode initialization failed: $e');
      }
    }
  }

  /// Create Krille-chan Web Session
  Future<Map<String, dynamic>> createWebSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
    bool enableMinimalUI = true,
    bool enablePerformanceMode = true,
  }) async {
    if (!_webClientEnabled) {
      throw Exception('Krille-chan Web client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/web/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_krillechan_web',
            'display_name': 'REChain Krille-chan Web',
          },
          'settings': {
            'minimal_ui': enableMinimalUI && _minimalUIEnabled,
            'performance_mode': enablePerformanceMode && _performanceModeEnabled,
            'lightweight_mode': _lightweightModeEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Krille-chan Web session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Create Krille-chan Desktop Session
  Future<Map<String, dynamic>> createDesktopSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
    bool enableMinimalUI = true,
    bool enablePerformanceMode = true,
  }) async {
    if (!_desktopClientEnabled) {
      throw Exception('Krille-chan Desktop client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/desktop/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_krillechan_desktop',
            'display_name': 'REChain Krille-chan Desktop',
          },
          'settings': {
            'minimal_ui': enableMinimalUI && _minimalUIEnabled,
            'performance_mode': enablePerformanceMode && _performanceModeEnabled,
            'lightweight_mode': _lightweightModeEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Krille-chan Desktop session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Create Krille-chan Mobile Session
  Future<Map<String, dynamic>> createMobileSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
    bool enableMinimalUI = true,
    bool enablePerformanceMode = true,
  }) async {
    if (!_mobileClientEnabled) {
      throw Exception('Krille-chan Mobile client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/mobile/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_krillechan_mobile',
            'display_name': 'REChain Krille-chan Mobile',
          },
          'settings': {
            'minimal_ui': enableMinimalUI && _minimalUIEnabled,
            'performance_mode': enablePerformanceMode && _performanceModeEnabled,
            'lightweight_mode': _lightweightModeEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Krille-chan Mobile session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Performance Mode
  Future<Map<String, dynamic>> enablePerformanceMode({
    required String sessionId,
    Map<String, dynamic>? performanceSettings,
  }) async {
    if (!_performanceModeEnabled) {
      throw Exception('Performance mode is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/performance/enable',
        body: {
          'session_id': sessionId,
          'settings': performanceSettings ?? {
            'fast_sync': _fastSyncEnabled,
            'resource_optimization': _resourceOptimizationEnabled,
            'lightweight_mode': _lightweightModeEnabled,
            'minimal_ui': _minimalUIEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable performance mode: ${response.statusCode}');
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
    if (!_performanceModeEnabled) {
      throw Exception('Performance mode is not enabled');
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

  /// Optimize Resource Usage
  Future<Map<String, dynamic>> optimizeResources({
    required String sessionId,
    Map<String, dynamic>? optimizationSettings,
  }) async {
    if (!_resourceOptimizationEnabled) {
      throw Exception('Resource optimization is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/resources/optimize',
        body: {
          'session_id': sessionId,
          'settings': optimizationSettings ?? {
            'memory_limit': '512MB',
            'cpu_limit': '50%',
            'network_limit': '1MB/s',
            'cache_size': '100MB',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to optimize resources: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Fast Sync
  Future<Map<String, dynamic>> enableFastSync({
    required String sessionId,
    Map<String, dynamic>? syncSettings,
  }) async {
    if (!_fastSyncEnabled) {
      throw Exception('Fast sync is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/sync/fast/enable',
        body: {
          'session_id': sessionId,
          'settings': syncSettings ?? {
            'batch_size': 100,
            'sync_interval': 5000, // 5 seconds
            'priority_rooms': [],
            'background_sync': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable fast sync: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enable Lightweight Mode
  Future<Map<String, dynamic>> enableLightweightMode({
    required String sessionId,
    Map<String, dynamic>? lightweightSettings,
  }) async {
    if (!_lightweightModeEnabled) {
      throw Exception('Lightweight mode is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/lightweight/enable',
        body: {
          'session_id': sessionId,
          'settings': lightweightSettings ?? {
            'disable_animations': true,
            'reduce_image_quality': true,
            'limit_message_history': 100,
            'disable_rich_text': true,
            'minimal_notifications': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to enable lightweight mode: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get UI Themes
  Future<List<Map<String, dynamic>>> getUIThemes({
    bool? isMinimal,
    bool? isDark,
  }) async {
    if (!_minimalUIEnabled) {
      throw Exception('Minimal UI is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/ui/themes',
        queryParams: {
          if (isMinimal != null) 'is_minimal': isMinimal.toString(),
          if (isDark != null) 'is_dark': isDark.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['themes'] ?? []);
      } else {
        throw Exception('Failed to get UI themes: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Apply UI Theme
  Future<Map<String, dynamic>> applyUITheme({
    required String sessionId,
    required String themeId,
  }) async {
    if (!_minimalUIEnabled) {
      throw Exception('Minimal UI is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/ui/themes/apply',
        body: {
          'session_id': sessionId,
          'theme_id': themeId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to apply UI theme: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Krille-chan Rooms (Optimized)
  Future<List<Map<String, dynamic>>> getRooms({
    String? userId,
    bool? lightweight,
    Map<String, dynamic>? filters,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/rooms',
        queryParams: {
          if (userId != null) 'user_id': userId,
          if (lightweight != null) 'lightweight': lightweight.toString(),
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

  /// Get System Status
  Future<Map<String, dynamic>> getSystemStatus() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/system/status');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'status': 'healthy',
          'services': serviceStatus,
          'last_error': _lastError,
          'system_info': data,
        };
      } else {
        return {
          'status': 'unhealthy',
          'services': serviceStatus,
          'last_error': 'System status check failed',
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

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'web_client': _webClientEnabled,
    'desktop_client': _desktopClientEnabled,
    'mobile_client': _mobileClientEnabled,
    'minimal_ui': _minimalUIEnabled,
    'performance_mode': _performanceModeEnabled,
    'resource_optimization': _resourceOptimizationEnabled,
    'fast_sync': _fastSyncEnabled,
    'lightweight_mode': _lightweightModeEnabled,
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
      'User-Agent': 'REChain-KrilleChan/1.0',
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