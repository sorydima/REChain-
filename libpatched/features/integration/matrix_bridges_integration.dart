import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Bridges Integration Service
/// Provides bridges to other communication platforms and protocols
class MatrixBridgesIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Bridge services
  bool _ircBridgeEnabled = false;
  bool _discordBridgeEnabled = false;
  bool _telegramBridgeEnabled = false;
  bool _slackBridgeEnabled = false;
  bool _whatsappBridgeEnabled = false;
  bool _signalBridgeEnabled = false;
  bool _emailBridgeEnabled = false;
  bool _xmppBridgeEnabled = false;
  bool _mastodonBridgeEnabled = false;
  bool _twitterBridgeEnabled = false;

  MatrixBridgesIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-bridges.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix bridges
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Initializing Matrix bridges...');
      }

      // Test connection to Matrix Bridges API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Bridges API is not available');
      }

      // Initialize individual bridges
      await _initializeIrcBridge();
      await _initializeDiscordBridge();
      await _initializeTelegramBridge();
      await _initializeSlackBridge();
      await _initializeWhatsappBridge();
      await _initializeSignalBridge();
      await _initializeEmailBridge();
      await _initializeXmppBridge();
      await _initializeMastodonBridge();
      await _initializeTwitterBridge();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Matrix bridges initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Bridges API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize IRC Bridge
  Future<void> _initializeIrcBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/irc/initialize');
      if (response.statusCode == 200) {
        _ircBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] IRC bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Discord Bridge
  Future<void> _initializeDiscordBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/discord/initialize');
      if (response.statusCode == 200) {
        _discordBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Discord bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Telegram Bridge
  Future<void> _initializeTelegramBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/telegram/initialize');
      if (response.statusCode == 200) {
        _telegramBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Telegram bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Slack Bridge
  Future<void> _initializeSlackBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/slack/initialize');
      if (response.statusCode == 200) {
        _slackBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Slack bridge initialization failed: $e');
      }
    }
  }

  /// Initialize WhatsApp Bridge
  Future<void> _initializeWhatsappBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/whatsapp/initialize');
      if (response.statusCode == 200) {
        _whatsappBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] WhatsApp bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Signal Bridge
  Future<void> _initializeSignalBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/signal/initialize');
      if (response.statusCode == 200) {
        _signalBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Signal bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Email Bridge
  Future<void> _initializeEmailBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/email/initialize');
      if (response.statusCode == 200) {
        _emailBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Email bridge initialization failed: $e');
      }
    }
  }

  /// Initialize XMPP Bridge
  Future<void> _initializeXmppBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/xmpp/initialize');
      if (response.statusCode == 200) {
        _xmppBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] XMPP bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Mastodon Bridge
  Future<void> _initializeMastodonBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/mastodon/initialize');
      if (response.statusCode == 200) {
        _mastodonBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Mastodon bridge initialization failed: $e');
      }
    }
  }

  /// Initialize Twitter Bridge
  Future<void> _initializeTwitterBridge() async {
    try {
      final response = await _makeRequest('POST', '/bridges/twitter/initialize');
      if (response.statusCode == 200) {
        _twitterBridgeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBridgesIntegration] Twitter bridge initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'irc_bridge': _ircBridgeEnabled,
    'discord_bridge': _discordBridgeEnabled,
    'telegram_bridge': _telegramBridgeEnabled,
    'slack_bridge': _slackBridgeEnabled,
    'whatsapp_bridge': _whatsappBridgeEnabled,
    'signal_bridge': _signalBridgeEnabled,
    'email_bridge': _emailBridgeEnabled,
    'xmpp_bridge': _xmppBridgeEnabled,
    'mastodon_bridge': _mastodonBridgeEnabled,
    'twitter_bridge': _twitterBridgeEnabled,
  };

  /// IRC Bridge - Connect to IRC
  Future<Map<String, dynamic>> connectIrcBridge({
    required String matrixRoomId,
    required String ircChannel,
    required String ircServer,
    String? ircNick,
    Map<String, dynamic>? options,
  }) async {
    if (!_ircBridgeEnabled) {
      throw Exception('IRC bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/irc/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'irc_channel': ircChannel,
          'irc_server': ircServer,
          if (ircNick != null) 'irc_nick': ircNick,
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
        throw Exception('Failed to connect IRC bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Discord Bridge - Connect to Discord
  Future<Map<String, dynamic>> connectDiscordBridge({
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
        '/bridges/discord/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'discord_channel_id': discordChannelId,
          'discord_token': discordToken,
          'options': options ?? {
            'sync_messages': true,
            'sync_embeds': true,
            'sync_reactions': true,
            'sync_files': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to connect Discord bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Telegram Bridge - Connect to Telegram
  Future<Map<String, dynamic>> connectTelegramBridge({
    required String matrixRoomId,
    required String telegramChatId,
    required String telegramToken,
    Map<String, dynamic>? options,
  }) async {
    if (!_telegramBridgeEnabled) {
      throw Exception('Telegram bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/telegram/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'telegram_chat_id': telegramChatId,
          'telegram_token': telegramToken,
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
        throw Exception('Failed to connect Telegram bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Slack Bridge - Connect to Slack
  Future<Map<String, dynamic>> connectSlackBridge({
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
        '/bridges/slack/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'slack_channel_id': slackChannelId,
          'slack_token': slackToken,
          'options': options ?? {
            'sync_messages': true,
            'sync_threads': true,
            'sync_reactions': true,
            'sync_files': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to connect Slack bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// WhatsApp Bridge - Connect to WhatsApp
  Future<Map<String, dynamic>> connectWhatsappBridge({
    required String matrixRoomId,
    required String whatsappNumber,
    required String whatsappToken,
    Map<String, dynamic>? options,
  }) async {
    if (!_whatsappBridgeEnabled) {
      throw Exception('WhatsApp bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/whatsapp/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'whatsapp_number': whatsappNumber,
          'whatsapp_token': whatsappToken,
          'options': options ?? {
            'sync_messages': true,
            'sync_media': true,
            'sync_status': true,
            'sync_contacts': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to connect WhatsApp bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Signal Bridge - Connect to Signal
  Future<Map<String, dynamic>> connectSignalBridge({
    required String matrixRoomId,
    required String signalNumber,
    required String signalDeviceId,
    Map<String, dynamic>? options,
  }) async {
    if (!_signalBridgeEnabled) {
      throw Exception('Signal bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/signal/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'signal_number': signalNumber,
          'signal_device_id': signalDeviceId,
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
        throw Exception('Failed to connect Signal bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Email Bridge - Connect to Email
  Future<Map<String, dynamic>> connectEmailBridge({
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
        '/bridges/email/connect',
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
        throw Exception('Failed to connect Email bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// XMPP Bridge - Connect to XMPP
  Future<Map<String, dynamic>> connectXmppBridge({
    required String matrixRoomId,
    required String xmppJid,
    required String xmppPassword,
    required String xmppServer,
    Map<String, dynamic>? options,
  }) async {
    if (!_xmppBridgeEnabled) {
      throw Exception('XMPP bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/xmpp/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'xmpp_jid': xmppJid,
          'xmpp_password': xmppPassword,
          'xmpp_server': xmppServer,
          'options': options ?? {
            'sync_messages': true,
            'sync_presence': true,
            'sync_roster': true,
            'sync_files': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to connect XMPP bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Mastodon Bridge - Connect to Mastodon
  Future<Map<String, dynamic>> connectMastodonBridge({
    required String matrixRoomId,
    required String mastodonInstance,
    required String mastodonToken,
    Map<String, dynamic>? options,
  }) async {
    if (!_mastodonBridgeEnabled) {
      throw Exception('Mastodon bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/mastodon/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'mastodon_instance': mastodonInstance,
          'mastodon_token': mastodonToken,
          'options': options ?? {
            'sync_posts': true,
            'sync_boosts': true,
            'sync_replies': true,
            'sync_media': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to connect Mastodon bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Twitter Bridge - Connect to Twitter
  Future<Map<String, dynamic>> connectTwitterBridge({
    required String matrixRoomId,
    required String twitterApiKey,
    required String twitterApiSecret,
    required String twitterAccessToken,
    required String twitterAccessSecret,
    Map<String, dynamic>? options,
  }) async {
    if (!_twitterBridgeEnabled) {
      throw Exception('Twitter bridge is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/twitter/connect',
        body: {
          'matrix_room_id': matrixRoomId,
          'twitter_api_key': twitterApiKey,
          'twitter_api_secret': twitterApiSecret,
          'twitter_access_token': twitterAccessToken,
          'twitter_access_secret': twitterAccessSecret,
          'options': options ?? {
            'sync_tweets': true,
            'sync_replies': true,
            'sync_retweets': true,
            'sync_media': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to connect Twitter bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get bridge status
  Future<Map<String, dynamic>> getBridgeStatus(String bridgeType) async {
    try {
      final response = await _makeRequest('GET', '/bridges/$bridgeType/status');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get bridge status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Disconnect bridge
  Future<Map<String, dynamic>> disconnectBridge(String bridgeType, String bridgeId) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/$bridgeType/disconnect',
        body: {'bridge_id': bridgeId},
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

  /// Get all active bridges
  Future<List<Map<String, dynamic>>> getActiveBridges() async {
    try {
      final response = await _makeRequest('GET', '/bridges/active');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['bridges'] ?? []);
      } else {
        throw Exception('Failed to get active bridges: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixBridges/1.0',
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