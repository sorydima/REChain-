import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Application Services Integration
/// Provides advanced application service features and bot framework capabilities
class MatrixAppServicesIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // App services
  bool _appServicesEnabled = false;
  bool _botFrameworkEnabled = false;
  bool _webhookSupportEnabled = false;
  bool _customEventsEnabled = false;
  bool _roomManagementEnabled = false;
  bool _userManagementEnabled = false;
  bool _mediaHandlingEnabled = false;
  bool _analyticsEnabled = false;

  MatrixAppServicesIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-appservices.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix application services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Initializing Matrix application services...');
      }

      // Test connection to Matrix App Services API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix App Services API is not available');
      }

      // Initialize individual services
      await _initializeAppServices();
      await _initializeBotFramework();
      await _initializeWebhookSupport();
      await _initializeCustomEvents();
      await _initializeRoomManagement();
      await _initializeUserManagement();
      await _initializeMediaHandling();
      await _initializeAnalytics();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Matrix application services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix App Services API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Application Services
  Future<void> _initializeAppServices() async {
    try {
      final response = await _makeRequest('POST', '/appservices/initialize');
      if (response.statusCode == 200) {
        _appServicesEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] App services initialization failed: $e');
      }
    }
  }

  /// Initialize Bot Framework
  Future<void> _initializeBotFramework() async {
    try {
      final response = await _makeRequest('POST', '/bot-framework/initialize');
      if (response.statusCode == 200) {
        _botFrameworkEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Bot framework initialization failed: $e');
      }
    }
  }

  /// Initialize Webhook Support
  Future<void> _initializeWebhookSupport() async {
    try {
      final response = await _makeRequest('POST', '/webhooks/initialize');
      if (response.statusCode == 200) {
        _webhookSupportEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Webhook support initialization failed: $e');
      }
    }
  }

  /// Initialize Custom Events
  Future<void> _initializeCustomEvents() async {
    try {
      final response = await _makeRequest('POST', '/events/initialize');
      if (response.statusCode == 200) {
        _customEventsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Custom events initialization failed: $e');
      }
    }
  }

  /// Initialize Room Management
  Future<void> _initializeRoomManagement() async {
    try {
      final response = await _makeRequest('POST', '/rooms/initialize');
      if (response.statusCode == 200) {
        _roomManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Room management initialization failed: $e');
      }
    }
  }

  /// Initialize User Management
  Future<void> _initializeUserManagement() async {
    try {
      final response = await _makeRequest('POST', '/users/initialize');
      if (response.statusCode == 200) {
        _userManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] User management initialization failed: $e');
      }
    }
  }

  /// Initialize Media Handling
  Future<void> _initializeMediaHandling() async {
    try {
      final response = await _makeRequest('POST', '/media/initialize');
      if (response.statusCode == 200) {
        _mediaHandlingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Media handling initialization failed: $e');
      }
    }
  }

  /// Initialize Analytics
  Future<void> _initializeAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/analytics/initialize');
      if (response.statusCode == 200) {
        _analyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAppServicesIntegration] Analytics initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'app_services': _appServicesEnabled,
    'bot_framework': _botFrameworkEnabled,
    'webhook_support': _webhookSupportEnabled,
    'custom_events': _customEventsEnabled,
    'room_management': _roomManagementEnabled,
    'user_management': _userManagementEnabled,
    'media_handling': _mediaHandlingEnabled,
    'analytics': _analyticsEnabled,
  };

  /// App Services - Register Service
  Future<Map<String, dynamic>> registerAppService({
    required String serviceName,
    required String serviceUrl,
    required String asToken,
    required String hsToken,
    Map<String, dynamic>? config,
    List<String>? namespaces,
  }) async {
    if (!_appServicesEnabled) {
      throw Exception('Application services are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/appservices/register',
        body: {
          'service_name': serviceName,
          'service_url': serviceUrl,
          'as_token': asToken,
          'hs_token': hsToken,
          if (config != null) 'config': config,
          if (namespaces != null) 'namespaces': namespaces,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to register app service: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Bot Framework - Create Bot
  Future<Map<String, dynamic>> createBot({
    required String botName,
    required String botUrl,
    required List<String> capabilities,
    Map<String, dynamic>? config,
    Map<String, dynamic>? permissions,
    Map<String, dynamic>? webhookConfig,
  }) async {
    if (!_botFrameworkEnabled) {
      throw Exception('Bot framework is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bot-framework/create',
        body: {
          'bot_name': botName,
          'bot_url': botUrl,
          'capabilities': capabilities,
          if (config != null) 'config': config,
          if (permissions != null) 'permissions': permissions,
          if (webhookConfig != null) 'webhook_config': webhookConfig,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create bot: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Bot Framework - Send Bot Message
  Future<Map<String, dynamic>> sendBotMessage({
    required String botId,
    required String roomId,
    required String message,
    String? messageType,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_botFrameworkEnabled) {
      throw Exception('Bot framework is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bot-framework/send-message',
        body: {
          'bot_id': botId,
          'room_id': roomId,
          'message': message,
          'message_type': messageType ?? 'm.text',
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send bot message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Webhook Support - Create Webhook
  Future<Map<String, dynamic>> createWebhook({
    required String webhookUrl,
    required List<String> eventTypes,
    Map<String, dynamic>? filters,
    Map<String, dynamic>? headers,
  }) async {
    if (!_webhookSupportEnabled) {
      throw Exception('Webhook support is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/webhooks/create',
        body: {
          'webhook_url': webhookUrl,
          'event_types': eventTypes,
          if (filters != null) 'filters': filters,
          if (headers != null) 'headers': headers,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create webhook: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Custom Events - Send Custom Event
  Future<Map<String, dynamic>> sendCustomEvent({
    required String roomId,
    required String eventType,
    required Map<String, dynamic> content,
    String? stateKey,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_customEventsEnabled) {
      throw Exception('Custom events are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/events/send-custom',
        body: {
          'room_id': roomId,
          'event_type': eventType,
          'content': content,
          if (stateKey != null) 'state_key': stateKey,
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send custom event: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Room Management - Create Room
  Future<Map<String, dynamic>> createRoom({
    required String name,
    String? topic,
    List<String>? inviteUsers,
    bool isPublic = false,
    String? preset,
    Map<String, dynamic>? initialState,
    Map<String, dynamic>? powerLevels,
  }) async {
    if (!_roomManagementEnabled) {
      throw Exception('Room management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/rooms/create',
        body: {
          'name': name,
          if (topic != null) 'topic': topic,
          if (inviteUsers != null) 'invite_users': inviteUsers,
          'is_public': isPublic,
          if (preset != null) 'preset': preset,
          if (initialState != null) 'initial_state': initialState,
          if (powerLevels != null) 'power_levels': powerLevels,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create room: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// User Management - Create User
  Future<Map<String, dynamic>> createUser({
    required String userId,
    required String password,
    Map<String, dynamic>? profile,
    bool isAdmin = false,
    Map<String, dynamic>? deviceInfo,
  }) async {
    if (!_userManagementEnabled) {
      throw Exception('User management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/users/create',
        body: {
          'user_id': userId,
          'password': password,
          if (profile != null) 'profile': profile,
          'is_admin': isAdmin,
          if (deviceInfo != null) 'device_info': deviceInfo,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Media Handling - Upload Media
  Future<Map<String, dynamic>> uploadMedia({
    required String fileName,
    required List<int> fileData,
    required String mimeType,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? encryptionConfig,
  }) async {
    if (!_mediaHandlingEnabled) {
      throw Exception('Media handling is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/media/upload',
        body: {
          'file_name': fileName,
          'file_data': base64Encode(fileData),
          'mime_type': mimeType,
          if (metadata != null) 'metadata': metadata,
          if (encryptionConfig != null) 'encryption_config': encryptionConfig,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to upload media: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Analytics - Track Event
  Future<Map<String, dynamic>> trackEvent({
    required String eventName,
    required Map<String, dynamic> eventData,
    String? userId,
    String? roomId,
    DateTime? timestamp,
  }) async {
    if (!_analyticsEnabled) {
      throw Exception('Analytics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/track',
        body: {
          'event_name': eventName,
          'event_data': eventData,
          if (userId != null) 'user_id': userId,
          if (roomId != null) 'room_id': roomId,
          if (timestamp != null) 'timestamp': timestamp.toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to track event: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get registered app services
  Future<List<Map<String, dynamic>>> getRegisteredAppServices() async {
    try {
      final response = await _makeRequest('GET', '/appservices/registered');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['services'] ?? []);
      } else {
        throw Exception('Failed to get registered app services: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get active bots
  Future<List<Map<String, dynamic>>> getActiveBots() async {
    try {
      final response = await _makeRequest('GET', '/bot-framework/active');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['bots'] ?? []);
      } else {
        throw Exception('Failed to get active bots: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get analytics data
  Future<Map<String, dynamic>> getAnalyticsData({
    String? eventName,
    DateTime? startTime,
    DateTime? endTime,
    String? groupBy,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/analytics/data',
        queryParams: {
          if (eventName != null) 'event_name': eventName,
          if (startTime != null) 'start_time': startTime.toIso8601String(),
          if (endTime != null) 'end_time': endTime.toIso8601String(),
          if (groupBy != null) 'group_by': groupBy,
        },
      );
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get analytics data: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service health
  Future<Map<String, dynamic>> getHealthStatus() async {
    try {
      final response = await _makeRequest('GET', '/health');
      
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
      'User-Agent': 'REChain-MatrixAppServices/1.0',
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