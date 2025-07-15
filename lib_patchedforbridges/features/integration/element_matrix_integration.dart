import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Element.io Matrix Integration Service
/// Provides integration with Element.io Matrix client services
class ElementMatrixIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Element services
  bool _elementWebEnabled = false;
  bool _elementMobileEnabled = false;
  bool _elementCallEnabled = false;
  bool _elementServerEnabled = false;
  bool _elementBridgeEnabled = false;
  bool _elementWidgetsEnabled = false;

  ElementMatrixIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.element.io',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Element.io services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[ElementMatrixIntegration] Initializing Element.io services...');
      }

      // Test connection to Element.io API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Element.io API is not available');
      }

      // Initialize individual services
      await _initializeElementWeb();
      await _initializeElementMobile();
      await _initializeElementCall();
      await _initializeElementServer();
      await _initializeElementBridge();
      await _initializeElementWidgets();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[ElementMatrixIntegration] Element.io services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[ElementMatrixIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Element.io API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Element Web
  Future<void> _initializeElementWeb() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/web/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _elementWebEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementMatrixIntegration] Element Web status: $_elementWebEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementMatrixIntegration] Element Web initialization failed: $e');
      }
    }
  }

  /// Initialize Element Mobile
  Future<void> _initializeElementMobile() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/mobile/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _elementMobileEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementMatrixIntegration] Element Mobile status: $_elementMobileEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementMatrixIntegration] Element Mobile initialization failed: $e');
      }
    }
  }

  /// Initialize Element Call
  Future<void> _initializeElementCall() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/call/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _elementCallEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementMatrixIntegration] Element Call status: $_elementCallEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementMatrixIntegration] Element Call initialization failed: $e');
      }
    }
  }

  /// Initialize Element Server
  Future<void> _initializeElementServer() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/server/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _elementServerEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementMatrixIntegration] Element Server status: $_elementServerEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementMatrixIntegration] Element Server initialization failed: $e');
      }
    }
  }

  /// Initialize Element Bridge
  Future<void> _initializeElementBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridge/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _elementBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementMatrixIntegration] Element Bridge status: $_elementBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementMatrixIntegration] Element Bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Element Widgets
  Future<void> _initializeElementWidgets() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/widgets/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _elementWidgetsEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementMatrixIntegration] Element Widgets status: $_elementWidgetsEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementMatrixIntegration] Element Widgets initialization failed: $e');
      }
    }
  }

  /// Element Web Integration
  Future<Map<String, dynamic>> createElementWebSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
  }) async {
    if (!_elementWebEnabled) {
      throw Exception('Element Web is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/web/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_element_web',
            'display_name': 'REChain Element Web',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Element Web session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Web Room Management
  Future<List<Map<String, dynamic>>> getElementWebRooms({
    String? userId,
    Map<String, dynamic>? filters,
  }) async {
    if (!_elementWebEnabled) {
      throw Exception('Element Web is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/web/rooms',
        queryParams: {
          if (userId != null) 'user_id': userId,
          if (filters != null) 'filters': jsonEncode(filters),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['rooms'] ?? []);
      } else {
        throw Exception('Failed to get Element Web rooms: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Mobile Integration
  Future<Map<String, dynamic>> createElementMobileSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
  }) async {
    if (!_elementMobileEnabled) {
      throw Exception('Element Mobile is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/mobile/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_element_mobile',
            'display_name': 'REChain Element Mobile',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Element Mobile session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Mobile Push Notifications
  Future<Map<String, dynamic>> configurePushNotifications({
    required String deviceId,
    required String pushToken,
    Map<String, dynamic>? settings,
  }) async {
    if (!_elementMobileEnabled) {
      throw Exception('Element Mobile is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/mobile/push',
        body: {
          'device_id': deviceId,
          'push_token': pushToken,
          'settings': settings ?? {
            'enabled': true,
            'sound': true,
            'vibrate': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure push notifications: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Call Integration
  Future<Map<String, dynamic>> createElementCall({
    required String roomId,
    required String callType,
    Map<String, dynamic>? callOptions,
  }) async {
    if (!_elementCallEnabled) {
      throw Exception('Element Call is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/call/create',
        body: {
          'room_id': roomId,
          'call_type': callType, // 'voice' or 'video'
          'options': callOptions ?? {
            'audio': true,
            'video': callType == 'video',
            'screen_share': false,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Element Call: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Call Management
  Future<Map<String, dynamic>> joinElementCall({
    required String callId,
    required String userId,
    Map<String, dynamic>? joinOptions,
  }) async {
    if (!_elementCallEnabled) {
      throw Exception('Element Call is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/call/join',
        body: {
          'call_id': callId,
          'user_id': userId,
          'options': joinOptions ?? {
            'audio': true,
            'video': true,
            'mute_audio': false,
            'mute_video': false,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to join Element Call: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Server Management
  Future<Map<String, dynamic>> getElementServerInfo() async {
    if (!_elementServerEnabled) {
      throw Exception('Element Server is not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/api/v1/server/info');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get Element Server info: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Server User Management
  Future<Map<String, dynamic>> createElementServerUser({
    required String username,
    required String password,
    Map<String, dynamic>? userInfo,
  }) async {
    if (!_elementServerEnabled) {
      throw Exception('Element Server is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/server/users',
        body: {
          'username': username,
          'password': password,
          'user_info': userInfo ?? {
            'display_name': username,
            'avatar_url': null,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Element Server user: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Bridge Integration
  Future<Map<String, dynamic>> configureElementBridge({
    required String bridgeType,
    required Map<String, dynamic> configuration,
  }) async {
    if (!_elementBridgeEnabled) {
      throw Exception('Element Bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridge/configure',
        body: {
          'bridge_type': bridgeType, // 'slack', 'discord', 'telegram', etc.
          'configuration': configuration,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure Element Bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Bridge Status
  Future<List<Map<String, dynamic>>> getElementBridgeStatus() async {
    if (!_elementBridgeEnabled) {
      throw Exception('Element Bridge is not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/api/v1/bridge/status');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['bridges'] ?? []);
      } else {
        throw Exception('Failed to get Element Bridge status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Widgets Integration
  Future<Map<String, dynamic>> createElementWidget({
    required String widgetType,
    required String roomId,
    Map<String, dynamic>? widgetConfig,
  }) async {
    if (!_elementWidgetsEnabled) {
      throw Exception('Element Widgets is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/widgets/create',
        body: {
          'widget_type': widgetType, // 'jitsi', 'custom', 'integration'
          'room_id': roomId,
          'config': widgetConfig ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create Element Widget: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Element Widgets Management
  Future<List<Map<String, dynamic>>> getElementWidgets({
    String? roomId,
    String? widgetType,
  }) async {
    if (!_elementWidgetsEnabled) {
      throw Exception('Element Widgets is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/widgets',
        queryParams: {
          if (roomId != null) 'room_id': roomId,
          if (widgetType != null) 'widget_type': widgetType,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['widgets'] ?? []);
      } else {
        throw Exception('Failed to get Element Widgets: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'element_web': _elementWebEnabled,
    'element_mobile': _elementMobileEnabled,
    'element_call': _elementCallEnabled,
    'element_server': _elementServerEnabled,
    'element_bridge': _elementBridgeEnabled,
    'element_widgets': _elementWidgetsEnabled,
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
      'User-Agent': 'REChain-Element/1.0',
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