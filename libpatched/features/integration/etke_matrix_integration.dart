import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Etke.cc Matrix Integration Service
/// Integrates etke.cc's Matrix ecosystem tools into REChain
class EtkeMatrixIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Matrix services
  bool _baibotEnabled = false;
  bool _mrsEnabled = false;
  bool _postmoogleEnabled = false;
  bool _honoroitEnabled = false;
  bool _synapseAdminEnabled = false;

  EtkeMatrixIntegration({
    required String apiKey,
    required Client matrixClient,
    String baseUrl = 'https://api.etke.cc/matrix',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all etke.cc Matrix services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[EtkeMatrixIntegration] Initializing...');
      }

      // Test connection to etke.cc Matrix API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Etke.cc Matrix API is not available');
      }

      // Initialize individual services
      await _initializeBaiBot();
      await _initializeMRS();
      await _initializePostmoogle();
      await _initializeHonoroit();
      await _initializeSynapseAdmin();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[EtkeMatrixIntegration] Initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[EtkeMatrixIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to etke.cc Matrix API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize BaiBot (AI Matrix bot)
  Future<void> _initializeBaiBot() async {
    try {
      final response = await _makeRequest('GET', '/baibot/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _baibotEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeMatrixIntegration] BaiBot status: $_baibotEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeMatrixIntegration] BaiBot initialization failed: $e');
      }
    }
  }

  /// Initialize MRS (Matrix Rooms Search)
  Future<void> _initializeMRS() async {
    try {
      final response = await _makeRequest('GET', '/mrs/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _mrsEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeMatrixIntegration] MRS status: $_mrsEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeMatrixIntegration] MRS initialization failed: $e');
      }
    }
  }

  /// Initialize Postmoogle (Matrix ↔ Email bridge)
  Future<void> _initializePostmoogle() async {
    try {
      final response = await _makeRequest('GET', '/postmoogle/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _postmoogleEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeMatrixIntegration] Postmoogle status: $_postmoogleEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeMatrixIntegration] Postmoogle initialization failed: $e');
      }
    }
  }

  /// Initialize Honoroit (Helpdesk bot)
  Future<void> _initializeHonoroit() async {
    try {
      final response = await _makeRequest('GET', '/honoroit/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _honoroitEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeMatrixIntegration] Honoroit status: $_honoroitEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeMatrixIntegration] Honoroit initialization failed: $e');
      }
    }
  }

  /// Initialize Synapse Admin
  Future<void> _initializeSynapseAdmin() async {
    try {
      final response = await _makeRequest('GET', '/synapse-admin/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _synapseAdminEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeMatrixIntegration] Synapse Admin status: $_synapseAdminEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeMatrixIntegration] Synapse Admin initialization failed: $e');
      }
    }
  }

  /// BaiBot Integration - AI-powered Matrix bot
  Future<Map<String, dynamic>> sendBaiBotMessage({
    required String roomId,
    required String message,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_baibotEnabled) {
      throw Exception('BaiBot is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/baibot/message',
        body: {
          'room_id': roomId,
          'message': message,
          'model': model ?? 'gpt-4',
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send BaiBot message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// BaiBot Text-to-Speech
  Future<String> baiBotTextToSpeech({
    required String text,
    String? voice,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_baibotEnabled) {
      throw Exception('BaiBot is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/baibot/tts',
        body: {
          'text': text,
          'voice': voice ?? 'alloy',
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['audio_url'] ?? '';
      } else {
        throw Exception('Failed to generate speech: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// BaiBot Speech-to-Text
  Future<String> baiBotSpeechToText({
    required String audioUrl,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_baibotEnabled) {
      throw Exception('BaiBot is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/baibot/stt',
        body: {
          'audio_url': audioUrl,
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['text'] ?? '';
      } else {
        throw Exception('Failed to transcribe audio: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// BaiBot Image Generation
  Future<String> baiBotGenerateImage({
    required String prompt,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_baibotEnabled) {
      throw Exception('BaiBot is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/baibot/image',
        body: {
          'prompt': prompt,
          'model': model ?? 'dall-e-3',
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['image_url'] ?? '';
      } else {
        throw Exception('Failed to generate image: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// MRS (Matrix Rooms Search) Integration
  Future<List<Map<String, dynamic>>> searchMatrixRooms({
    required String query,
    Map<String, dynamic>? filters,
    int? limit,
    int? offset,
  }) async {
    if (!_mrsEnabled) {
      throw Exception('MRS is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/mrs/search',
        queryParams: {
          'q': query,
          if (filters != null) 'filters': jsonEncode(filters),
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

  /// MRS Directory Server
  Future<List<Map<String, dynamic>>> getMatrixDirectory({
    String? category,
    String? language,
    int? limit,
    int? offset,
  }) async {
    if (!_mrsEnabled) {
      throw Exception('MRS is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/mrs/directory',
        queryParams: {
          if (category != null) 'category': category,
          if (language != null) 'language': language,
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['rooms'] ?? []);
      } else {
        throw Exception('Failed to get directory: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Postmoogle (Matrix ↔ Email) Integration
  Future<Map<String, dynamic>> sendEmailViaMatrix({
    required String to,
    required String subject,
    required String body,
    List<String>? cc,
    List<String>? bcc,
    List<Map<String, dynamic>>? attachments,
  }) async {
    if (!_postmoogleEnabled) {
      throw Exception('Postmoogle is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/postmoogle/send',
        body: {
          'to': to,
          'subject': subject,
          'body': body,
          if (cc != null) 'cc': cc,
          if (bcc != null) 'bcc': bcc,
          if (attachments != null) 'attachments': attachments,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send email: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Postmoogle Email Configuration
  Future<Map<String, dynamic>> configurePostmoogle({
    required String smtpServer,
    required int smtpPort,
    required String username,
    required String password,
    bool useTLS = true,
    Map<String, dynamic>? additionalConfig,
  }) async {
    if (!_postmoogleEnabled) {
      throw Exception('Postmoogle is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/postmoogle/configure',
        body: {
          'smtp_server': smtpServer,
          'smtp_port': smtpPort,
          'username': username,
          'password': password,
          'use_tls': useTLS,
          if (additionalConfig != null) 'additional_config': additionalConfig,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure Postmoogle: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Honoroit (Helpdesk Bot) Integration
  Future<Map<String, dynamic>> createHelpdeskTicket({
    required String title,
    required String description,
    String? priority,
    String? category,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_honoroitEnabled) {
      throw Exception('Honoroit is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/honoroit/ticket',
        body: {
          'title': title,
          'description': description,
          'priority': priority ?? 'medium',
          'category': category ?? 'general',
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create ticket: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Honoroit Ticket Management
  Future<List<Map<String, dynamic>>> getHelpdeskTickets({
    String? status,
    String? priority,
    String? category,
    int? limit,
    int? offset,
  }) async {
    if (!_honoroitEnabled) {
      throw Exception('Honoroit is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/honoroit/tickets',
        queryParams: {
          if (status != null) 'status': status,
          if (priority != null) 'priority': priority,
          if (category != null) 'category': category,
          if (limit != null) 'limit': limit.toString(),
          if (offset != null) 'offset': offset.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['tickets'] ?? []);
      } else {
        throw Exception('Failed to get tickets: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Synapse Admin Integration
  Future<Map<String, dynamic>> getSynapseStats() async {
    if (!_synapseAdminEnabled) {
      throw Exception('Synapse Admin is not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/synapse-admin/stats');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get Synapse stats: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Synapse Admin User Management
  Future<Map<String, dynamic>> manageSynapseUser({
    required String userId,
    required String action,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_synapseAdminEnabled) {
      throw Exception('Synapse Admin is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/synapse-admin/user',
        body: {
          'user_id': userId,
          'action': action,
          if (parameters != null) 'parameters': parameters,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to manage user: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'baibot': _baibotEnabled,
    'mrs': _mrsEnabled,
    'postmoogle': _postmoogleEnabled,
    'honoroit': _honoroitEnabled,
    'synapse_admin': _synapseAdminEnabled,
  };

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
      'User-Agent': 'REChain-EtkeMatrix/1.0',
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