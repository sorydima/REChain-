import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';

/// Telegram Authentication Service
/// Provides Telegram login and bot integration
class TelegramAuthService {
  final String _baseUrl;
  final String _apiKey;
  final String _botToken;
  final http.Client _client;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Telegram services
  bool _loginEnabled = false;
  bool _botIntegrationEnabled = false;
  bool _messagingEnabled = false;
  bool _channelManagementEnabled = false;
  bool _groupManagementEnabled = false;
  bool _notificationEnabled = false;
  bool _analyticsEnabled = false;
  bool _webhookEnabled = false;

  // User state
  Map<String, dynamic>? _userInfo;
  List<Map<String, dynamic>> _chats = [];
  List<Map<String, dynamic>> _messages = [];
  Map<String, dynamic>? _botInfo;

  // Stream controllers for real-time updates
  final StreamController<Map<String, dynamic>> _userUpdateController = 
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _messageController = 
      StreamController<Map<String, dynamic>>.broadcast();

  TelegramAuthService({
    required String apiKey,
    required String botToken,
    String baseUrl = 'https://api.telegram-auth.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _botToken = botToken,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize Telegram authentication services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[TelegramAuthService] Initializing Telegram authentication services...');
      }

      // Test connection to Telegram Auth API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Telegram Auth API is not available');
      }

      // Initialize individual services
      await _initializeLogin();
      await _initializeBotIntegration();
      await _initializeMessaging();
      await _initializeChannelManagement();
      await _initializeGroupManagement();
      await _initializeNotification();
      await _initializeAnalytics();
      await _initializeWebhook();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[TelegramAuthService] Telegram authentication services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[TelegramAuthService] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Telegram Auth API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Login
  Future<void> _initializeLogin() async {
    try {
      final response = await _makeRequest('POST', '/auth/login/initialize');
      if (response.statusCode == 200) {
        _loginEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TelegramAuthService] Login initialization failed: $e');
      }
    }
  }

  /// Initialize Bot Integration
  Future<void> _initializeBotIntegration() async {
    try {
      final response = await _makeRequest('POST', '/auth/bot/initialize');
      if (response.statusCode == 200) {
        _botIntegrationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TelegramAuthService] Bot integration initialization failed: $e');
      }
    }
  }

  /// Initialize Messaging
  Future<void> _initializeMessaging() async {
    try {
      final response = await _makeRequest('POST', '/auth/messaging/initialize');
      if (response.statusCode == 200) {
        _messagingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TelegramAuthService] Messaging initialization failed: $e');
      }
    }
  }

  /// Initialize Channel Management
  Future<void> _initializeChannelManagement() async {
    try {
      final response = await _makeRequest('POST', '/auth/channels/initialize');
      if (response.statusCode == 200) {
        _channelManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TelegramAuthService] Channel management initialization failed: $e');
      }
    }
  }

  /// Initialize Group Management
  Future<void> _initializeGroupManagement() async {
    try {
      final response = await _makeRequest('POST', '/auth/groups/initialize');
      if (response.statusCode == 200) {
        _groupManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TelegramAuthService] Group management initialization failed: $e');
      }
    }
  }

  /// Initialize Notification
  Future<void> _initializeNotification() async {
    try {
      final response = await _makeRequest('POST', '/auth/notifications/initialize');
      if (response.statusCode == 200) {
        _notificationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TelegramAuthService] Notification initialization failed: $e');
      }
    }
  }

  /// Initialize Analytics
  Future<void> _initializeAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/auth/analytics/initialize');
      if (response.statusCode == 200) {
        _analyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TelegramAuthService] Analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Webhook
  Future<void> _initializeWebhook() async {
    try {
      final response = await _makeRequest('POST', '/auth/webhook/initialize');
      if (response.statusCode == 200) {
        _webhookEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TelegramAuthService] Webhook initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'login': _loginEnabled,
    'bot_integration': _botIntegrationEnabled,
    'messaging': _messagingEnabled,
    'channel_management': _channelManagementEnabled,
    'group_management': _groupManagementEnabled,
    'notification': _notificationEnabled,
    'analytics': _analyticsEnabled,
    'webhook': _webhookEnabled,
  };

  /// Get user update stream
  Stream<Map<String, dynamic>> get userUpdateStream => _userUpdateController.stream;

  /// Get message stream
  Stream<Map<String, dynamic>> get messageStream => _messageController.stream;

  /// Get user info
  Map<String, dynamic>? get userInfo => _userInfo;

  /// Get bot info
  Map<String, dynamic>? get botInfo => _botInfo;

  /// Get chats
  List<Map<String, dynamic>> get chats => _chats;

  /// Get messages
  List<Map<String, dynamic>> get messages => _messages;

  /// Login with Telegram
  Future<Map<String, dynamic>> loginWithTelegram({
    required Map<String, dynamic> authData,
    Map<String, dynamic>? loginParams,
  }) async {
    if (!_loginEnabled) {
      throw Exception('Login is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/login/telegram',
        body: {
          'auth_data': authData,
          if (loginParams != null) 'login_params': loginParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _userInfo = data['user_info'];
        _userUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to login with Telegram: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Logout
  Future<Map<String, dynamic>> logout() async {
    if (!_loginEnabled) {
      throw Exception('Login is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/logout',
        body: {
          'user_id': _userInfo?['id'],
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _userInfo = null;
        _chats.clear();
        _messages.clear();
        _userUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to logout: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get bot info
  Future<Map<String, dynamic>> getBotInfo() async {
    if (!_botIntegrationEnabled) {
      throw Exception('Bot integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/auth/bot/info',
        queryParams: {
          'bot_token': _botToken,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _botInfo = data;
        return data;
      } else {
        throw Exception('Failed to get bot info: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Send message
  Future<Map<String, dynamic>> sendMessage({
    required String chatId,
    required String text,
    Map<String, dynamic>? messageParams,
  }) async {
    if (!_messagingEnabled) {
      throw Exception('Messaging is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/messaging/send',
        body: {
          'chat_id': chatId,
          'text': text,
          'bot_token': _botToken,
          if (messageParams != null) 'message_params': messageParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _messages.add(data);
        _messageController.add(data);
        return data;
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get user chats
  Future<List<Map<String, dynamic>>> getUserChats() async {
    if (!_messagingEnabled) {
      throw Exception('Messaging is not enabled');
    }

    try {
      if (_userInfo == null) {
        throw Exception('User not logged in');
      }

      final response = await _makeRequest(
        'GET',
        '/auth/messaging/chats',
        queryParams: {
          'user_id': _userInfo!['id'].toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _chats = List<Map<String, dynamic>>.from(data['chats'] ?? []);
        return _chats;
      } else {
        throw Exception('Failed to get user chats: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get chat messages
  Future<List<Map<String, dynamic>>> getChatMessages({
    required String chatId,
    int? limit,
  }) async {
    if (!_messagingEnabled) {
      throw Exception('Messaging is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/auth/messaging/messages',
        queryParams: {
          'chat_id': chatId,
          if (limit != null) 'limit': limit.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['messages'] ?? []);
      } else {
        throw Exception('Failed to get chat messages: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Create channel
  Future<Map<String, dynamic>> createChannel({
    required String title,
    required String description,
    Map<String, dynamic>? channelParams,
  }) async {
    if (!_channelManagementEnabled) {
      throw Exception('Channel management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/channels/create',
        body: {
          'title': title,
          'description': description,
          'bot_token': _botToken,
          if (channelParams != null) 'channel_params': channelParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create channel: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Create group
  Future<Map<String, dynamic>> createGroup({
    required String title,
    Map<String, dynamic>? groupParams,
  }) async {
    if (!_groupManagementEnabled) {
      throw Exception('Group management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/groups/create',
        body: {
          'title': title,
          'bot_token': _botToken,
          if (groupParams != null) 'group_params': groupParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create group: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Send notification
  Future<Map<String, dynamic>> sendNotification({
    required String userId,
    required String message,
    Map<String, dynamic>? notificationParams,
  }) async {
    if (!_notificationEnabled) {
      throw Exception('Notification is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/notifications/send',
        body: {
          'user_id': userId,
          'message': message,
          'bot_token': _botToken,
          if (notificationParams != null) 'notification_params': notificationParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send notification: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get analytics
  Future<Map<String, dynamic>> getAnalytics({
    String? timeRange,
  }) async {
    if (!_analyticsEnabled) {
      throw Exception('Analytics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/auth/analytics/dashboard',
        queryParams: {
          'bot_token': _botToken,
          if (timeRange != null) 'time_range': timeRange,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get analytics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Set webhook
  Future<Map<String, dynamic>> setWebhook({
    required String url,
    Map<String, dynamic>? webhookParams,
  }) async {
    if (!_webhookEnabled) {
      throw Exception('Webhook is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/webhook/set',
        body: {
          'url': url,
          'bot_token': _botToken,
          if (webhookParams != null) 'webhook_params': webhookParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to set webhook: ${response.statusCode}');
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
      'User-Agent': 'REChain-TelegramAuth/1.0',
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
    _userUpdateController.close();
    _messageController.close();
    _isInitialized = false;
  }
} 