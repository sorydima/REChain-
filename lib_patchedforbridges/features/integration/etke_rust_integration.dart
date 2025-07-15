import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Etke.cc Rust Integration Service
/// Integrates etke.cc's Rust libraries (anthropic-rs, async-openai) into REChain
class EtkeRustIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Rust services
  bool _anthropicEnabled = false;
  bool _openaiEnabled = false;
  bool _asyncEnabled = false;

  EtkeRustIntegration({
    required String apiKey,
    String baseUrl = 'https://api.etke.cc/rust',
    http.Client? client,
  })  : _apiKey = apiKey,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize Rust services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[EtkeRustIntegration] Initializing Rust services...');
      }

      // Test connection
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Etke.cc Rust API is not available');
      }

      // Initialize individual services
      await _initializeAnthropic();
      await _initializeOpenAI();
      await _initializeAsync();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[EtkeRustIntegration] Rust services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[EtkeRustIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Rust API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Anthropic Rust SDK
  Future<void> _initializeAnthropic() async {
    try {
      final response = await _makeRequest('GET', '/anthropic/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _anthropicEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeRustIntegration] Anthropic status: $_anthropicEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeRustIntegration] Anthropic initialization failed: $e');
      }
    }
  }

  /// Initialize OpenAI Rust SDK
  Future<void> _initializeOpenAI() async {
    try {
      final response = await _makeRequest('GET', '/openai/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _openaiEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeRustIntegration] OpenAI status: $_openaiEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeRustIntegration] OpenAI initialization failed: $e');
      }
    }
  }

  /// Initialize Async Rust services
  Future<void> _initializeAsync() async {
    try {
      final response = await _makeRequest('GET', '/async/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _asyncEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeRustIntegration] Async status: $_asyncEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeRustIntegration] Async initialization failed: $e');
      }
    }
  }

  /// Anthropic Rust SDK Integration
  Future<Map<String, dynamic>> anthropicChat({
    required String message,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_anthropicEnabled) {
      throw Exception('Anthropic Rust SDK is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/anthropic/chat',
        body: {
          'message': message,
          'model': model ?? 'claude-3-sonnet-20240229',
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send Anthropic message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Anthropic Text Generation
  Future<Map<String, dynamic>> anthropicGenerateText({
    required String prompt,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_anthropicEnabled) {
      throw Exception('Anthropic Rust SDK is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/anthropic/generate',
        body: {
          'prompt': prompt,
          'model': model ?? 'claude-3-sonnet-20240229',
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to generate text: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// OpenAI Rust SDK Integration
  Future<Map<String, dynamic>> openaiChat({
    required String message,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_openaiEnabled) {
      throw Exception('OpenAI Rust SDK is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/openai/chat',
        body: {
          'message': message,
          'model': model ?? 'gpt-4',
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send OpenAI message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// OpenAI Text Generation
  Future<Map<String, dynamic>> openaiGenerateText({
    required String prompt,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_openaiEnabled) {
      throw Exception('OpenAI Rust SDK is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/openai/generate',
        body: {
          'prompt': prompt,
          'model': model ?? 'gpt-4',
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to generate text: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// OpenAI Image Generation
  Future<String> openaiGenerateImage({
    required String prompt,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_openaiEnabled) {
      throw Exception('OpenAI Rust SDK is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/openai/image',
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

  /// Async Rust Services
  Future<Map<String, dynamic>> asyncBatchProcess({
    required List<Map<String, dynamic>> tasks,
    Map<String, dynamic>? options,
  }) async {
    if (!_asyncEnabled) {
      throw Exception('Async Rust services are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/async/batch',
        body: {
          'tasks': tasks,
          'options': options ?? {},
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to process batch: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Async Stream Processing
  Stream<Map<String, dynamic>> asyncStreamProcess({
    required String streamId,
    Map<String, dynamic>? parameters,
  }) async* {
    if (!_asyncEnabled) {
      throw Exception('Async Rust services are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/async/stream',
        body: {
          'stream_id': streamId,
          'parameters': parameters ?? {},
        },
      );

      if (response.statusCode == 200) {
        final lines = response.body.split('\n');
        for (final line in lines) {
          if (line.isNotEmpty) {
            try {
              final data = jsonDecode(line);
              yield data;
            } catch (e) {
              // Skip invalid JSON lines
            }
          }
        }
      } else {
        throw Exception('Failed to start stream: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'anthropic': _anthropicEnabled,
    'openai': _openaiEnabled,
    'async': _asyncEnabled,
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
      'User-Agent': 'REChain-EtkeRust/1.0',
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