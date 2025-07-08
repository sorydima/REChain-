import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Federation Integration Service
/// Provides advanced federation features and server-to-server communication
class MatrixFederationIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Federation services
  bool _federationEnabled = false;
  bool _serverDiscoveryEnabled = false;
  bool _keyVerificationEnabled = false;
  bool _eventExchangeEnabled = false;
  bool _roomDirectoryEnabled = false;
  bool _userDirectoryEnabled = false;
  bool _mediaProxyEnabled = false;
  bool _federationMetricsEnabled = false;

  MatrixFederationIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-federation.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix federation services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixFederationIntegration] Initializing Matrix federation...');
      }

      // Test connection to Matrix Federation API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Federation API is not available');
      }

      // Initialize individual services
      await _initializeFederation();
      await _initializeServerDiscovery();
      await _initializeKeyVerification();
      await _initializeEventExchange();
      await _initializeRoomDirectory();
      await _initializeUserDirectory();
      await _initializeMediaProxy();
      await _initializeFederationMetrics();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixFederationIntegration] Matrix federation initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixFederationIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Federation API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
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
        print('[MatrixFederationIntegration] Federation initialization failed: $e');
      }
    }
  }

  /// Initialize Server Discovery
  Future<void> _initializeServerDiscovery() async {
    try {
      final response = await _makeRequest('POST', '/discovery/initialize');
      if (response.statusCode == 200) {
        _serverDiscoveryEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixFederationIntegration] Server discovery initialization failed: $e');
      }
    }
  }

  /// Initialize Key Verification
  Future<void> _initializeKeyVerification() async {
    try {
      final response = await _makeRequest('POST', '/keys/initialize');
      if (response.statusCode == 200) {
        _keyVerificationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixFederationIntegration] Key verification initialization failed: $e');
      }
    }
  }

  /// Initialize Event Exchange
  Future<void> _initializeEventExchange() async {
    try {
      final response = await _makeRequest('POST', '/events/initialize');
      if (response.statusCode == 200) {
        _eventExchangeEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixFederationIntegration] Event exchange initialization failed: $e');
      }
    }
  }

  /// Initialize Room Directory
  Future<void> _initializeRoomDirectory() async {
    try {
      final response = await _makeRequest('POST', '/directory/rooms/initialize');
      if (response.statusCode == 200) {
        _roomDirectoryEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixFederationIntegration] Room directory initialization failed: $e');
      }
    }
  }

  /// Initialize User Directory
  Future<void> _initializeUserDirectory() async {
    try {
      final response = await _makeRequest('POST', '/directory/users/initialize');
      if (response.statusCode == 200) {
        _userDirectoryEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixFederationIntegration] User directory initialization failed: $e');
      }
    }
  }

  /// Initialize Media Proxy
  Future<void> _initializeMediaProxy() async {
    try {
      final response = await _makeRequest('POST', '/media/initialize');
      if (response.statusCode == 200) {
        _mediaProxyEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixFederationIntegration] Media proxy initialization failed: $e');
      }
    }
  }

  /// Initialize Federation Metrics
  Future<void> _initializeFederationMetrics() async {
    try {
      final response = await _makeRequest('POST', '/metrics/initialize');
      if (response.statusCode == 200) {
        _federationMetricsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixFederationIntegration] Federation metrics initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'federation': _federationEnabled,
    'server_discovery': _serverDiscoveryEnabled,
    'key_verification': _keyVerificationEnabled,
    'event_exchange': _eventExchangeEnabled,
    'room_directory': _roomDirectoryEnabled,
    'user_directory': _userDirectoryEnabled,
    'media_proxy': _mediaProxyEnabled,
    'federation_metrics': _federationMetricsEnabled,
  };

  /// Federation - Configure Federation
  Future<Map<String, dynamic>> configureFederation({
    required String domain,
    required Map<String, dynamic> config,
    List<String>? allowedDomains,
    List<String>? blockedDomains,
    Map<String, dynamic>? rateLimits,
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
          if (rateLimits != null) 'rate_limits': rateLimits,
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

  /// Server Discovery - Discover Servers
  Future<List<Map<String, dynamic>>> discoverServers({
    String? domain,
    Map<String, dynamic>? filters,
    int? limit,
  }) async {
    if (!_serverDiscoveryEnabled) {
      throw Exception('Server discovery is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/discovery/servers',
        queryParams: {
          if (domain != null) 'domain': domain,
          if (filters != null) 'filters': jsonEncode(filters),
          if (limit != null) 'limit': limit.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['servers'] ?? []);
      } else {
        throw Exception('Failed to discover servers: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Key Verification - Verify Server Keys
  Future<Map<String, dynamic>> verifyServerKeys({
    required String domain,
    required List<String> keyIds,
  }) async {
    if (!_keyVerificationEnabled) {
      throw Exception('Key verification is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/keys/verify',
        body: {
          'domain': domain,
          'key_ids': keyIds,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to verify server keys: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Event Exchange - Send Federation Event
  Future<Map<String, dynamic>> sendFederationEvent({
    required String targetDomain,
    required String roomId,
    required String eventType,
    required Map<String, dynamic> content,
    String? eventId,
  }) async {
    if (!_eventExchangeEnabled) {
      throw Exception('Event exchange is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/events/send',
        body: {
          'target_domain': targetDomain,
          'room_id': roomId,
          'event_type': eventType,
          'content': content,
          if (eventId != null) 'event_id': eventId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send federation event: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Room Directory - Publish Room
  Future<Map<String, dynamic>> publishRoom({
    required String roomId,
    required String alias,
    Map<String, dynamic>? metadata,
    List<String>? tags,
  }) async {
    if (!_roomDirectoryEnabled) {
      throw Exception('Room directory is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/directory/rooms/publish',
        body: {
          'room_id': roomId,
          'alias': alias,
          if (metadata != null) 'metadata': metadata,
          if (tags != null) 'tags': tags,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to publish room: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Room Directory - Search Rooms
  Future<List<Map<String, dynamic>>> searchRooms({
    String? query,
    List<String>? tags,
    String? language,
    int? limit,
    int? offset,
  }) async {
    if (!_roomDirectoryEnabled) {
      throw Exception('Room directory is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/directory/rooms/search',
        queryParams: {
          if (query != null) 'query': query,
          if (tags != null) 'tags': tags.join(','),
          if (language != null) 'language': language,
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['rooms'] ?? []);
      } else {
        throw Exception('Failed to search rooms: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// User Directory - Search Users
  Future<List<Map<String, dynamic>>> searchUsers({
    required String query,
    int? limit,
    int? offset,
  }) async {
    if (!_userDirectoryEnabled) {
      throw Exception('User directory is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/directory/users/search',
        queryParams: {
          'query': query,
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['users'] ?? []);
      } else {
        throw Exception('Failed to search users: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Media Proxy - Proxy Media
  Future<Map<String, dynamic>> proxyMedia({
    required String mediaId,
    required String serverName,
    Map<String, dynamic>? options,
  }) async {
    if (!_mediaProxyEnabled) {
      throw Exception('Media proxy is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/media/proxy',
        body: {
          'media_id': mediaId,
          'server_name': serverName,
          if (options != null) 'options': options,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to proxy media: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Federation Metrics - Get Metrics
  Future<Map<String, dynamic>> getFederationMetrics({
    String? domain,
    String? metricType,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    if (!_federationMetricsEnabled) {
      throw Exception('Federation metrics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/metrics/federation',
        queryParams: {
          if (domain != null) 'domain': domain,
          if (metricType != null) 'metric_type': metricType,
          if (startTime != null) 'start_time': startTime.toIso8601String(),
          if (endTime != null) 'end_time': endTime.toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get federation metrics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get federation status
  Future<Map<String, dynamic>> getFederationStatus() async {
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

  /// Get connected servers
  Future<List<Map<String, dynamic>>> getConnectedServers() async {
    try {
      final response = await _makeRequest('GET', '/federation/servers');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['servers'] ?? []);
      } else {
        throw Exception('Failed to get connected servers: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixFederation/1.0',
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