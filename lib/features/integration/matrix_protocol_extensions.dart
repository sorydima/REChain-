import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Protocol Extensions Integration Service
/// Provides advanced Matrix protocol features, bridges, and extensions
class MatrixProtocolExtensions {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Protocol extensions
  bool _mscExtensionsEnabled = false;
  bool _bridgesEnabled = false;
  bool _appservicesEnabled = false;
  bool _federationEnabled = false;
  bool _encryptionExtensionsEnabled = false;
  bool _voiceVideoExtensionsEnabled = false;
  bool _fileSharingExtensionsEnabled = false;
  bool _botFrameworkEnabled = false;

  MatrixProtocolExtensions({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-protocol.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix protocol extensions
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] Initializing Matrix protocol extensions...');
      }

      // Test connection to Matrix Protocol API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Protocol API is not available');
      }

      // Initialize individual extensions
      await _initializeMSCExtensions();
      await _initializeBridges();
      await _initializeAppServices();
      await _initializeFederation();
      await _initializeEncryptionExtensions();
      await _initializeVoiceVideoExtensions();
      await _initializeFileSharingExtensions();
      await _initializeBotFramework();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixProtocolExtensions] Matrix protocol extensions initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Protocol API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize MSC (Matrix Spec Change) Extensions
  Future<void> _initializeMSCExtensions() async {
    try {
      final response = await _makeRequest('POST', '/msc/initialize');
      if (response.statusCode == 200) {
        _mscExtensionsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] MSC extensions initialization failed: $e');
      }
    }
  }

  /// Initialize Matrix Bridges
  Future<void> _initializeBridges() async {
    try {
      final response = await _makeRequest('POST', '/bridges/initialize');
      if (response.statusCode == 200) {
        _bridgesEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] Bridges initialization failed: $e');
      }
    }
  }

  /// Initialize Application Services
  Future<void> _initializeAppServices() async {
    try {
      final response = await _makeRequest('POST', '/appservices/initialize');
      if (response.statusCode == 200) {
        _appservicesEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] App services initialization failed: $e');
      }
    }
  }

  /// Initialize Federation
  Future<void> _initializeFederation() async {
    try {
      final response = await _makeRequest('POST', '/federation/initialize');
      if (response.statusCode == 200) {
        _federationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] Federation initialization failed: $e');
      }
    }
  }

  /// Initialize Encryption Extensions
  Future<void> _initializeEncryptionExtensions() async {
    try {
      final response = await _makeRequest('POST', '/encryption/initialize');
      if (response.statusCode == 200) {
        _encryptionExtensionsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] Encryption extensions initialization failed: $e');
      }
    }
  }

  /// Initialize Voice/Video Extensions
  Future<void> _initializeVoiceVideoExtensions() async {
    try {
      final response = await _makeRequest('POST', '/voice-video/initialize');
      if (response.statusCode == 200) {
        _voiceVideoExtensionsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] Voice/Video extensions initialization failed: $e');
      }
    }
  }

  /// Initialize File Sharing Extensions
  Future<void> _initializeFileSharingExtensions() async {
    try {
      final response = await _makeRequest('POST', '/file-sharing/initialize');
      if (response.statusCode == 200) {
        _fileSharingExtensionsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixProtocolExtensions] File sharing extensions initialization failed: $e');
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
        print('[MatrixProtocolExtensions] Bot framework initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'msc_extensions': _mscExtensionsEnabled,
    'bridges': _bridgesEnabled,
    'appservices': _appservicesEnabled,
    'federation': _federationEnabled,
    'encryption_extensions': _encryptionExtensionsEnabled,
    'voice_video_extensions': _voiceVideoExtensionsEnabled,
    'file_sharing_extensions': _fileSharingExtensionsEnabled,
    'bot_framework': _botFrameworkEnabled,
  };

  /// MSC Extensions - Advanced Room Features
  Future<Map<String, dynamic>> createAdvancedRoom({
    required String name,
    String? topic,
    List<String>? inviteUsers,
    Map<String, dynamic>? mscFeatures,
    Map<String, dynamic>? roomConfig,
  }) async {
    if (!_mscExtensionsEnabled) {
      throw Exception('MSC extensions are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/msc/rooms/create',
        body: {
          'name': name,
          if (topic != null) 'topic': topic,
          if (inviteUsers != null) 'invite_users': inviteUsers,
          if (mscFeatures != null) 'msc_features': mscFeatures,
          if (roomConfig != null) 'room_config': roomConfig,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create advanced room: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Bridge Management - Create Bridge
  Future<Map<String, dynamic>> createBridge({
    required String bridgeType,
    required String roomId,
    required Map<String, dynamic> config,
    Map<String, dynamic>? options,
  }) async {
    if (!_bridgesEnabled) {
      throw Exception('Bridges are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/bridges/create',
        body: {
          'bridge_type': bridgeType,
          'room_id': roomId,
          'config': config,
          if (options != null) 'options': options,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create bridge: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Application Services - Register Service
  Future<Map<String, dynamic>> registerAppService({
    required String serviceName,
    required String serviceUrl,
    required String asToken,
    required String hsToken,
    Map<String, dynamic>? config,
  }) async {
    if (!_appservicesEnabled) {
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

  /// Federation - Configure Federation
  Future<Map<String, dynamic>> configureFederation({
    required String domain,
    required Map<String, dynamic> config,
    List<String>? allowedDomains,
    List<String>? blockedDomains,
  }) async {
    if (!_federationEnabled) {
      throw Exception('Federation is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/federation/configure',
        body: {
          'domain': domain,
          'config': config,
          if (allowedDomains != null) 'allowed_domains': allowedDomains,
          if (blockedDomains != null) 'blocked_domains': blockedDomains,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure federation: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Encryption Extensions - Advanced Encryption
  Future<Map<String, dynamic>> setupAdvancedEncryption({
    required String roomId,
    required String algorithm,
    Map<String, dynamic>? keyConfig,
    Map<String, dynamic>? rotationPolicy,
  }) async {
    if (!_encryptionExtensionsEnabled) {
      throw Exception('Encryption extensions are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/encryption/setup',
        body: {
          'room_id': roomId,
          'algorithm': algorithm,
          if (keyConfig != null) 'key_config': keyConfig,
          if (rotationPolicy != null) 'rotation_policy': rotationPolicy,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to setup advanced encryption: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Voice/Video Extensions - Create Call
  Future<Map<String, dynamic>> createAdvancedCall({
    required String roomId,
    required String callType,
    Map<String, dynamic>? mediaConfig,
    Map<String, dynamic>? qualitySettings,
  }) async {
    if (!_voiceVideoExtensionsEnabled) {
      throw Exception('Voice/Video extensions are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/voice-video/calls/create',
        body: {
          'room_id': roomId,
          'call_type': callType,
          if (mediaConfig != null) 'media_config': mediaConfig,
          if (qualitySettings != null) 'quality_settings': qualitySettings,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create advanced call: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// File Sharing Extensions - Advanced File Operations
  Future<Map<String, dynamic>> uploadAdvancedFile({
    required String roomId,
    required String fileName,
    required List<int> fileData,
    required String mimeType,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? encryptionConfig,
  }) async {
    if (!_fileSharingExtensionsEnabled) {
      throw Exception('File sharing extensions are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/file-sharing/upload',
        body: {
          'room_id': roomId,
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
        throw Exception('Failed to upload advanced file: ${response.statusCode}');
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

  /// Get available MSC extensions
  Future<List<Map<String, dynamic>>> getAvailableMSCExtensions() async {
    if (!_mscExtensionsEnabled) {
      throw Exception('MSC extensions are not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/msc/extensions');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['extensions'] ?? []);
      } else {
        throw Exception('Failed to get MSC extensions: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get available bridges
  Future<List<Map<String, dynamic>>> getAvailableBridges() async {
    if (!_bridgesEnabled) {
      throw Exception('Bridges are not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/bridges/available');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['bridges'] ?? []);
      } else {
        throw Exception('Failed to get available bridges: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get federation status
  Future<Map<String, dynamic>> getFederationStatus() async {
    if (!_federationEnabled) {
      throw Exception('Federation is not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/federation/status');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get federation status: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixProtocol/1.0',
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