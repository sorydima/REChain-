import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// FluffyChat Integration Service
/// Provides integration with FluffyChat Matrix client services
class FluffyChatIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // FluffyChat services
  bool _mobileClientEnabled = false;
  bool _webClientEnabled = false;
  bool _desktopClientEnabled = false;
  bool _fileSharingEnabled = false;
  bool _voiceMessagesEnabled = false;
  bool _stickersEnabled = false;
  bool _groupChatsEnabled = false;
  bool _themesEnabled = false;

  FluffyChatIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.fluffychat.im',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all FluffyChat services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[FluffyChatIntegration] Initializing FluffyChat services...');
      }

      // Test connection to FluffyChat API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('FluffyChat API is not available');
      }

      // Initialize individual services
      await _initializeMobileClient();
      await _initializeWebClient();
      await _initializeDesktopClient();
      await _initializeFileSharing();
      await _initializeVoiceMessages();
      await _initializeStickers();
      await _initializeGroupChats();
      await _initializeThemes();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[FluffyChatIntegration] FluffyChat services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[FluffyChatIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to FluffyChat API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
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
          print('[FluffyChatIntegration] Mobile client status: $_mobileClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FluffyChatIntegration] Mobile client initialization failed: $e');
      }
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
          print('[FluffyChatIntegration] Web client status: $_webClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FluffyChatIntegration] Web client initialization failed: $e');
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
          print('[FluffyChatIntegration] Desktop client status: $_desktopClientEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FluffyChatIntegration] Desktop client initialization failed: $e');
      }
    }
  }

  /// Initialize File Sharing
  Future<void> _initializeFileSharing() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/filesharing/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _fileSharingEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[FluffyChatIntegration] File sharing status: $_fileSharingEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FluffyChatIntegration] File sharing initialization failed: $e');
      }
    }
  }

  /// Initialize Voice Messages
  Future<void> _initializeVoiceMessages() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/voicemessages/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _voiceMessagesEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[FluffyChatIntegration] Voice messages status: $_voiceMessagesEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FluffyChatIntegration] Voice messages initialization failed: $e');
      }
    }
  }

  /// Initialize Stickers
  Future<void> _initializeStickers() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/stickers/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _stickersEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[FluffyChatIntegration] Stickers status: $_stickersEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FluffyChatIntegration] Stickers initialization failed: $e');
      }
    }
  }

  /// Initialize Group Chats
  Future<void> _initializeGroupChats() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/groupchats/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _groupChatsEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[FluffyChatIntegration] Group chats status: $_groupChatsEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FluffyChatIntegration] Group chats initialization failed: $e');
      }
    }
  }

  /// Initialize Themes
  Future<void> _initializeThemes() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/themes/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _themesEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[FluffyChatIntegration] Themes status: $_themesEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[FluffyChatIntegration] Themes initialization failed: $e');
      }
    }
  }

  /// Create FluffyChat Mobile Session
  Future<Map<String, dynamic>> createMobileSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
  }) async {
    if (!_mobileClientEnabled) {
      throw Exception('FluffyChat Mobile client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/mobile/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_fluffychat_mobile',
            'display_name': 'REChain FluffyChat Mobile',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create FluffyChat Mobile session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Create FluffyChat Web Session
  Future<Map<String, dynamic>> createWebSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
  }) async {
    if (!_webClientEnabled) {
      throw Exception('FluffyChat Web client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/web/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_fluffychat_web',
            'display_name': 'REChain FluffyChat Web',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create FluffyChat Web session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Create FluffyChat Desktop Session
  Future<Map<String, dynamic>> createDesktopSession({
    required String userId,
    required String password,
    Map<String, dynamic>? deviceInfo,
  }) async {
    if (!_desktopClientEnabled) {
      throw Exception('FluffyChat Desktop client is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/desktop/login',
        body: {
          'user_id': userId,
          'password': password,
          'device_info': deviceInfo ?? {
            'device_id': 'rechain_fluffychat_desktop',
            'display_name': 'REChain FluffyChat Desktop',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create FluffyChat Desktop session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Upload File via FluffyChat
  Future<Map<String, dynamic>> uploadFile({
    required String roomId,
    required String fileName,
    required List<int> fileData,
    String? mimeType,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_fileSharingEnabled) {
      throw Exception('File sharing is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/filesharing/upload',
        body: {
          'room_id': roomId,
          'file_name': fileName,
          'file_data': base64Encode(fileData),
          'mime_type': mimeType ?? 'application/octet-stream',
          'metadata': metadata ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to upload file: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Send Voice Message
  Future<Map<String, dynamic>> sendVoiceMessage({
    required String roomId,
    required List<int> audioData,
    int duration = 0,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_voiceMessagesEnabled) {
      throw Exception('Voice messages are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/voicemessages/send',
        body: {
          'room_id': roomId,
          'audio_data': base64Encode(audioData),
          'duration': duration,
          'metadata': metadata ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send voice message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Available Stickers
  Future<List<Map<String, dynamic>>> getStickers({
    String? category,
    int? limit,
    int? offset,
  }) async {
    if (!_stickersEnabled) {
      throw Exception('Stickers are not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/stickers',
        queryParams: {
          if (category != null) 'category': category,
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['stickers'] ?? []);
      } else {
        throw Exception('Failed to get stickers: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Send Sticker
  Future<Map<String, dynamic>> sendSticker({
    required String roomId,
    required String stickerId,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_stickersEnabled) {
      throw Exception('Stickers are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/stickers/send',
        body: {
          'room_id': roomId,
          'sticker_id': stickerId,
          'metadata': metadata ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send sticker: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Create Group Chat
  Future<Map<String, dynamic>> createGroupChat({
    required String name,
    required List<String> participants,
    String? description,
    Map<String, dynamic>? settings,
  }) async {
    if (!_groupChatsEnabled) {
      throw Exception('Group chats are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/groupchats/create',
        body: {
          'name': name,
          'participants': participants,
          'description': description ?? '',
          'settings': settings ?? {
            'encryption': true,
            'public': false,
            'allow_guest_access': false,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create group chat: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get Group Chat Info
  Future<Map<String, dynamic>> getGroupChatInfo({
    required String roomId,
  }) async {
    if (!_groupChatsEnabled) {
      throw Exception('Group chats are not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/api/v1/groupchats/$roomId/info');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get group chat info: ${response.statusCode}');
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
    if (!_themesEnabled) {
      throw Exception('Themes are not enabled');
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
    required String themeId,
    required String clientType, // 'mobile', 'web', 'desktop'
  }) async {
    if (!_themesEnabled) {
      throw Exception('Themes are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/themes/apply',
        body: {
          'theme_id': themeId,
          'client_type': clientType,
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

  /// Get FluffyChat Rooms
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
    'mobile_client': _mobileClientEnabled,
    'web_client': _webClientEnabled,
    'desktop_client': _desktopClientEnabled,
    'file_sharing': _fileSharingEnabled,
    'voice_messages': _voiceMessagesEnabled,
    'stickers': _stickersEnabled,
    'group_chats': _groupChatsEnabled,
    'themes': _themesEnabled,
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
      'User-Agent': 'REChain-FluffyChat/1.0',
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