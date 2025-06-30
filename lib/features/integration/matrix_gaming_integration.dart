import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Gaming Integration Service
/// Provides gaming features for Matrix communication
class MatrixGamingIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Gaming services
  bool _gameServerManagementEnabled = false;
  bool _playerCommunicationEnabled = false;
  bool _voiceChatEnabled = false;
  bool _gameBridgesEnabled = false;
  bool _leaderboardsEnabled = false;
  bool _tournamentsEnabled = false;
  bool _gameAnalyticsEnabled = false;
  bool _crossPlatformEnabled = false;

  MatrixGamingIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-gaming.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix gaming services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Initializing Matrix gaming services...');
      }

      // Test connection to Matrix Gaming API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Gaming API is not available');
      }

      // Initialize individual services
      await _initializeGameServerManagement();
      await _initializePlayerCommunication();
      await _initializeVoiceChat();
      await _initializeGameBridges();
      await _initializeLeaderboards();
      await _initializeTournaments();
      await _initializeGameAnalytics();
      await _initializeCrossPlatform();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixGamingIntegration] Matrix gaming services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Gaming API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Game Server Management
  Future<void> _initializeGameServerManagement() async {
    try {
      final response = await _makeRequest('POST', '/gaming/servers/initialize');
      if (response.statusCode == 200) {
        _gameServerManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Game server management initialization failed: $e');
      }
    }
  }

  /// Initialize Player Communication
  Future<void> _initializePlayerCommunication() async {
    try {
      final response = await _makeRequest('POST', '/gaming/players/initialize');
      if (response.statusCode == 200) {
        _playerCommunicationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Player communication initialization failed: $e');
      }
    }
  }

  /// Initialize Voice Chat
  Future<void> _initializeVoiceChat() async {
    try {
      final response = await _makeRequest('POST', '/gaming/voice/initialize');
      if (response.statusCode == 200) {
        _voiceChatEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Voice chat initialization failed: $e');
      }
    }
  }

  /// Initialize Game Bridges
  Future<void> _initializeGameBridges() async {
    try {
      final response = await _makeRequest('POST', '/gaming/bridges/initialize');
      if (response.statusCode == 200) {
        _gameBridgesEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Game bridges initialization failed: $e');
      }
    }
  }

  /// Initialize Leaderboards
  Future<void> _initializeLeaderboards() async {
    try {
      final response = await _makeRequest('POST', '/gaming/leaderboards/initialize');
      if (response.statusCode == 200) {
        _leaderboardsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Leaderboards initialization failed: $e');
      }
    }
  }

  /// Initialize Tournaments
  Future<void> _initializeTournaments() async {
    try {
      final response = await _makeRequest('POST', '/gaming/tournaments/initialize');
      if (response.statusCode == 200) {
        _tournamentsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Tournaments initialization failed: $e');
      }
    }
  }

  /// Initialize Game Analytics
  Future<void> _initializeGameAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/gaming/analytics/initialize');
      if (response.statusCode == 200) {
        _gameAnalyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Game analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Cross Platform
  Future<void> _initializeCrossPlatform() async {
    try {
      final response = await _makeRequest('POST', '/gaming/cross-platform/initialize');
      if (response.statusCode == 200) {
        _crossPlatformEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixGamingIntegration] Cross platform initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'game_server_management': _gameServerManagementEnabled,
    'player_communication': _playerCommunicationEnabled,
    'voice_chat': _voiceChatEnabled,
    'game_bridges': _gameBridgesEnabled,
    'leaderboards': _leaderboardsEnabled,
    'tournaments': _tournamentsEnabled,
    'game_analytics': _gameAnalyticsEnabled,
    'cross_platform': _crossPlatformEnabled,
  };

  /// Game Server Management - Create game server
  Future<Map<String, dynamic>> createGameServer({
    required String serverName,
    required String gameType,
    required Map<String, dynamic> config,
    Map<String, dynamic>? resources,
  }) async {
    if (!_gameServerManagementEnabled) {
      throw Exception('Game server management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/servers/create',
        body: {
          'server_name': serverName,
          'game_type': gameType,
          'config': config,
          if (resources != null) 'resources': resources,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create game server: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Game Server Management - Get server status
  Future<Map<String, dynamic>> getGameServerStatus({
    required String serverId,
  }) async {
    if (!_gameServerManagementEnabled) {
      throw Exception('Game server management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/gaming/servers/$serverId/status',
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get game server status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Player Communication - Create game room
  Future<Map<String, dynamic>> createGameRoom({
    required String roomName,
    required String gameType,
    required List<String> players,
    Map<String, dynamic>? gameConfig,
  }) async {
    if (!_playerCommunicationEnabled) {
      throw Exception('Player communication is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/players/create-room',
        body: {
          'room_name': roomName,
          'game_type': gameType,
          'players': players,
          if (gameConfig != null) 'game_config': gameConfig,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create game room: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Player Communication - Send game message
  Future<Map<String, dynamic>> sendGameMessage({
    required String roomId,
    required String message,
    required String playerId,
    Map<String, dynamic>? gameData,
  }) async {
    if (!_playerCommunicationEnabled) {
      throw Exception('Player communication is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/players/send-message',
        body: {
          'room_id': roomId,
          'message': message,
          'player_id': playerId,
          if (gameData != null) 'game_data': gameData,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send game message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Voice Chat - Create voice channel
  Future<Map<String, dynamic>> createVoiceChannel({
    required String channelName,
    required String roomId,
    Map<String, dynamic>? voiceConfig,
  }) async {
    if (!_voiceChatEnabled) {
      throw Exception('Voice chat is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/voice/create-channel',
        body: {
          'channel_name': channelName,
          'room_id': roomId,
          'voice_config': voiceConfig ?? {
            'max_participants': 10,
            'audio_quality': 'high',
            'noise_suppression': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create voice channel: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Voice Chat - Join voice channel
  Future<Map<String, dynamic>> joinVoiceChannel({
    required String channelId,
    required String playerId,
    Map<String, dynamic>? audioConfig,
  }) async {
    if (!_voiceChatEnabled) {
      throw Exception('Voice chat is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/voice/join-channel',
        body: {
          'channel_id': channelId,
          'player_id': playerId,
          'audio_config': audioConfig ?? {
            'microphone': true,
            'speakers': true,
            'volume': 100,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to join voice channel: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Game Bridges - Connect to gaming platform
  Future<Map<String, dynamic>> connectGamingPlatform({
    required String platform,
    required String platformId,
    required Map<String, dynamic> credentials,
    Map<String, dynamic>? options,
  }) async {
    if (!_gameBridgesEnabled) {
      throw Exception('Game bridges is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/bridges/connect',
        body: {
          'platform': platform,
          'platform_id': platformId,
          'credentials': credentials,
          'options': options ?? {
            'sync_friends': true,
            'sync_games': true,
            'sync_achievements': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to connect gaming platform: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Leaderboards - Create leaderboard
  Future<Map<String, dynamic>> createLeaderboard({
    required String leaderboardName,
    required String gameType,
    required Map<String, dynamic> scoring,
    Map<String, dynamic>? displayConfig,
  }) async {
    if (!_leaderboardsEnabled) {
      throw Exception('Leaderboards is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/leaderboards/create',
        body: {
          'leaderboard_name': leaderboardName,
          'game_type': gameType,
          'scoring': scoring,
          'display_config': displayConfig ?? {
            'show_rank': true,
            'show_score': true,
            'show_player': true,
            'max_entries': 100,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create leaderboard: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Leaderboards - Update score
  Future<Map<String, dynamic>> updateLeaderboardScore({
    required String leaderboardId,
    required String playerId,
    required int score,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_leaderboardsEnabled) {
      throw Exception('Leaderboards is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/leaderboards/update-score',
        body: {
          'leaderboard_id': leaderboardId,
          'player_id': playerId,
          'score': score,
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update leaderboard score: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Tournaments - Create tournament
  Future<Map<String, dynamic>> createTournament({
    required String tournamentName,
    required String gameType,
    required Map<String, dynamic> format,
    required DateTime startTime,
    required DateTime endTime,
    Map<String, dynamic>? prizes,
  }) async {
    if (!_tournamentsEnabled) {
      throw Exception('Tournaments is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/tournaments/create',
        body: {
          'tournament_name': tournamentName,
          'game_type': gameType,
          'format': format,
          'start_time': startTime.toIso8601String(),
          'end_time': endTime.toIso8601String(),
          if (prizes != null) 'prizes': prizes,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create tournament: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Tournaments - Register player
  Future<Map<String, dynamic>> registerForTournament({
    required String tournamentId,
    required String playerId,
    Map<String, dynamic>? playerInfo,
  }) async {
    if (!_tournamentsEnabled) {
      throw Exception('Tournaments is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/tournaments/register',
        body: {
          'tournament_id': tournamentId,
          'player_id': playerId,
          if (playerInfo != null) 'player_info': playerInfo,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to register for tournament: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Game Analytics - Track game event
  Future<Map<String, dynamic>> trackGameEvent({
    required String eventType,
    required String playerId,
    required Map<String, dynamic> eventData,
    String? gameId,
  }) async {
    if (!_gameAnalyticsEnabled) {
      throw Exception('Game analytics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/analytics/track-event',
        body: {
          'event_type': eventType,
          'player_id': playerId,
          'event_data': eventData,
          if (gameId != null) 'game_id': gameId,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to track game event: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Cross Platform - Sync player data
  Future<Map<String, dynamic>> syncPlayerData({
    required String playerId,
    required String sourcePlatform,
    required String targetPlatform,
    Map<String, dynamic>? syncOptions,
  }) async {
    if (!_crossPlatformEnabled) {
      throw Exception('Cross platform is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/gaming/cross-platform/sync',
        body: {
          'player_id': playerId,
          'source_platform': sourcePlatform,
          'target_platform': targetPlatform,
          'sync_options': syncOptions ?? {
            'sync_profile': true,
            'sync_friends': true,
            'sync_games': true,
            'sync_achievements': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to sync player data: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get gaming dashboard
  Future<Map<String, dynamic>> getGamingDashboard() async {
    try {
      final response = await _makeRequest('GET', '/gaming/dashboard');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get gaming dashboard: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get active game servers
  Future<List<Map<String, dynamic>>> getActiveGameServers() async {
    try {
      final response = await _makeRequest('GET', '/gaming/servers/active');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['servers'] ?? []);
      } else {
        throw Exception('Failed to get active game servers: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixGaming/1.0',
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