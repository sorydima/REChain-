import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Element Bridge Integration Service
/// Provides integration with external platforms through Element Bridge
class ElementBridgeIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Bridge types
  bool _slackBridgeEnabled = false;
  bool _discordBridgeEnabled = false;
  bool _telegramBridgeEnabled = false;
  bool _whatsappBridgeEnabled = false;
  bool _signalBridgeEnabled = false;
  bool _ircBridgeEnabled = false;
  bool _emailBridgeEnabled = false;
  bool _githubBridgeEnabled = false;

  ElementBridgeIntegration({
    required String apiKey,
    String baseUrl = 'https://bridge.element.io',
    http.Client? client,
  })  : _apiKey = apiKey,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize Element Bridge services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] Initializing Element Bridge services...');
      }

      // Test connection to Element Bridge API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Element Bridge API is not available');
      }

      // Initialize bridge types
      await _initializeSlackBridge();
      await _initializeDiscordBridge();
      await _initializeTelegramBridge();
      await _initializeWhatsAppBridge();
      await _initializeSignalBridge();
      await _initializeIrcBridge();
      await _initializeEmailBridge();
      await _initializeGitHubBridge();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[ElementBridgeIntegration] Element Bridge services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[ElementBridgeIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Element Bridge API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Slack bridge
  Future<void> _initializeSlackBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridges/slack/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _slackBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementBridgeIntegration] Slack bridge status: $_slackBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] Slack bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Discord bridge
  Future<void> _initializeDiscordBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridges/discord/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _discordBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementBridgeIntegration] Discord bridge status: $_discordBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] Discord bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Telegram bridge
  Future<void> _initializeTelegramBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridges/telegram/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _telegramBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementBridgeIntegration] Telegram bridge status: $_telegramBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] Telegram bridge initialization failed: $e');
      }
    }
  }

  /// Initialize WhatsApp bridge
  Future<void> _initializeWhatsAppBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridges/whatsapp/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _whatsappBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementBridgeIntegration] WhatsApp bridge status: $_whatsappBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] WhatsApp bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Signal bridge
  Future<void> _initializeSignalBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridges/signal/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _signalBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementBridgeIntegration] Signal bridge status: $_signalBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] Signal bridge initialization failed: $e');
      }
    }
  }

  /// Initialize IRC bridge
  Future<void> _initializeIrcBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridges/irc/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _ircBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementBridgeIntegration] IRC bridge status: $_ircBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] IRC bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Email bridge
  Future<void> _initializeEmailBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridges/email/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _emailBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementBridgeIntegration] Email bridge status: $_emailBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] Email bridge initialization failed: $e');
      }
    }
  }

  /// Initialize GitHub bridge
  Future<void> _initializeGitHubBridge() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/bridges/github/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _githubBridgeEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementBridgeIntegration] GitHub bridge status: $_githubBridgeEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementBridgeIntegration] GitHub bridge initialization failed: $e');
      }
    }
  }

  /// Configure Slack bridge
  Future<Map<String, dynamic>> configureSlackBridge({
    required String matrixRoomId,
    required String slackChannelId,
    required String slackToken,
    Map<String, dynamic>? options,
  }) async {
    if (!_slackBridgeEnabled) {
      throw Exception('Slack bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/slack/configure',
        body: {
          'matrix_room_id': matrixRoomId,
          'slack_channel_id': slackChannelId,
          'slack_token': slackToken,
          'options': options ?? {
            'sync_messages': true,
            'sync_reactions': true,
            'sync_files': true,
            'sync_threads': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure Slack bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Discord bridge
  Future<Map<String, dynamic>> configureDiscordBridge({
    required String matrixRoomId,
    required String discordChannelId,
    required String discordToken,
    Map<String, dynamic>? options,
  }) async {
    if (!_discordBridgeEnabled) {
      throw Exception('Discord bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/discord/configure',
        body: {
          'matrix_room_id': matrixRoomId,
          'discord_channel_id': discordChannelId,
          'discord_token': discordToken,
          'options': options ?? {
            'sync_messages': true,
            'sync_reactions': true,
            'sync_files': true,
            'sync_embeds': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure Discord bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Telegram bridge
  Future<Map<String, dynamic>> configureTelegramBridge({
    required String matrixRoomId,
    required String telegramChatId,
    required String telegramBotToken,
    Map<String, dynamic>? options,
  }) async {
    if (!_telegramBridgeEnabled) {
      throw Exception('Telegram bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/telegram/configure',
        body: {
          'matrix_room_id': matrixRoomId,
          'telegram_chat_id': telegramChatId,
          'telegram_bot_token': telegramBotToken,
          'options': options ?? {
            'sync_messages': true,
            'sync_media': true,
            'sync_stickers': true,
            'sync_reactions': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure Telegram bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure WhatsApp bridge
  Future<Map<String, dynamic>> configureWhatsAppBridge({
    required String matrixRoomId,
    required String whatsappGroupId,
    required String whatsappToken,
    Map<String, dynamic>? options,
  }) async {
    if (!_whatsappBridgeEnabled) {
      throw Exception('WhatsApp bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/whatsapp/configure',
        body: {
          'matrix_room_id': matrixRoomId,
          'whatsapp_group_id': whatsappGroupId,
          'whatsapp_token': whatsappToken,
          'options': options ?? {
            'sync_messages': true,
            'sync_media': true,
            'sync_status': true,
            'sync_reactions': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure WhatsApp bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Signal bridge
  Future<Map<String, dynamic>> configureSignalBridge({
    required String matrixRoomId,
    required String signalGroupId,
    required String signalPhoneNumber,
    Map<String, dynamic>? options,
  }) async {
    if (!_signalBridgeEnabled) {
      throw Exception('Signal bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/signal/configure',
        body: {
          'matrix_room_id': matrixRoomId,
          'signal_group_id': signalGroupId,
          'signal_phone_number': signalPhoneNumber,
          'options': options ?? {
            'sync_messages': true,
            'sync_media': true,
            'sync_reactions': true,
            'sync_typing': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure Signal bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure IRC bridge
  Future<Map<String, dynamic>> configureIrcBridge({
    required String matrixRoomId,
    required String ircChannel,
    required String ircServer,
    Map<String, dynamic>? options,
  }) async {
    if (!_ircBridgeEnabled) {
      throw Exception('IRC bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/irc/configure',
        body: {
          'matrix_room_id': matrixRoomId,
          'irc_channel': ircChannel,
          'irc_server': ircServer,
          'options': options ?? {
            'sync_messages': true,
            'sync_nicks': true,
            'sync_joins': true,
            'sync_modes': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure IRC bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure Email bridge
  Future<Map<String, dynamic>> configureEmailBridge({
    required String matrixRoomId,
    required String emailAddress,
    required Map<String, dynamic> smtpConfig,
    Map<String, dynamic>? options,
  }) async {
    if (!_emailBridgeEnabled) {
      throw Exception('Email bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/email/configure',
        body: {
          'matrix_room_id': matrixRoomId,
          'email_address': emailAddress,
          'smtp_config': smtpConfig,
          'options': options ?? {
            'sync_incoming': true,
            'sync_outgoing': true,
            'sync_attachments': true,
            'sync_threads': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure Email bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure GitHub bridge
  Future<Map<String, dynamic>> configureGitHubBridge({
    required String matrixRoomId,
    required String githubRepo,
    required String githubToken,
    Map<String, dynamic>? options,
  }) async {
    if (!_githubBridgeEnabled) {
      throw Exception('GitHub bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/github/configure',
        body: {
          'matrix_room_id': matrixRoomId,
          'github_repo': githubRepo,
          'github_token': githubToken,
          'options': options ?? {
            'sync_issues': true,
            'sync_pull_requests': true,
            'sync_commits': true,
            'sync_releases': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure GitHub bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get bridge status
  Future<List<Map<String, dynamic>>> getBridgeStatus({
    String? bridgeType,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/bridges/status',
        queryParams: {
          if (bridgeType != null) 'bridge_type': bridgeType,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['bridges'] ?? []);
      } else {
        throw Exception('Failed to get bridge status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get bridge statistics
  Future<Map<String, dynamic>> getBridgeStatistics({
    String? bridgeType,
    Duration? timeRange,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/bridges/statistics',
        queryParams: {
          if (bridgeType != null) 'bridge_type': bridgeType,
          if (timeRange != null) 'time_range': timeRange.inSeconds.toString(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get bridge statistics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Disconnect bridge
  Future<Map<String, dynamic>> disconnectBridge({
    required String bridgeId,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/bridges/$bridgeId/disconnect',
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to disconnect bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'slack_bridge': _slackBridgeEnabled,
    'discord_bridge': _discordBridgeEnabled,
    'telegram_bridge': _telegramBridgeEnabled,
    'whatsapp_bridge': _whatsappBridgeEnabled,
    'signal_bridge': _signalBridgeEnabled,
    'irc_bridge': _ircBridgeEnabled,
    'email_bridge': _emailBridgeEnabled,
    'github_bridge': _githubBridgeEnabled,
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
      'User-Agent': 'REChain-ElementBridge/1.0',
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