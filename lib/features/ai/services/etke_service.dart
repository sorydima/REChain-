import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../models/ai_response.dart';
import '../interfaces/ai_service.dart';

/// Etke.cc Service - Integration with etke.cc AI and development platform.
///
/// Provides text, code, image, and analysis generation using Etke.cc models.
///
/// Example usage:
/// ```dart
/// final etke = EtkeService({'api_key': 'YOUR_KEY'});
/// await etke.initialize();
/// final response = await etke.generateText(prompt: 'Hello!');
/// print(response.content);
/// ```
class EtkeService implements AIService {
  final String _apiKey;
  final String _baseUrl;
  final http.Client _client;
  
  // Service configuration
  final Map<String, dynamic> _config;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Rate limiting
  final Map<String, DateTime> _lastRequestTime = {};
  final Map<String, int> _requestCount = {};
  
  // Default configuration
  static const Map<String, dynamic> _defaultConfig = {
    'base_url': 'https://api.etke.cc/v1',
    'timeout': 30,
    'max_retries': 3,
    'rate_limit': {
      'requests_per_minute': 60,
      'requests_per_hour': 1000,
    },
    'models': {
      'text': ['etke-gpt-4', 'etke-gpt-3.5', 'etke-claude'],
      'code': ['etke-coder', 'etke-debugger', 'etke-optimizer'],
      'image': ['etke-dalle', 'etke-stable-diffusion'],
      'analysis': ['etke-analyzer', 'etke-insights'],
    },
    'default_model': 'etke-gpt-4',
    'max_tokens': 2000,
    'temperature': 0.7,
  };

  EtkeService(Map<String, dynamic> config)
      : _config = Map.from(_defaultConfig)..addAll(config),
        _apiKey = config['api_key'] ?? '',
        _baseUrl = config['base_url'] ?? _defaultConfig['base_url'],
        _client = http.Client();

  /// The name of the AI service.
  @override
  String get serviceName => 'Etke.cc';

  /// Whether the service is initialized and ready.
  @override
  bool get isInitialized => _isInitialized;

  /// The last error message, if any.
  @override
  String? get lastError => _lastError;

  /// Initialize the Etke.cc service and test connection.
  @override
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[EtkeService] Initializing...');
      }

      // Validate API key
      if (_apiKey.isEmpty) {
        throw Exception('API key is required for Etke.cc service');
      }

      // Test connection
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Etke.cc service is not available');
      }

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[EtkeService] Initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[EtkeService] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Dispose of resources and close HTTP client.
  @override
  Future<void> dispose() async {
    _client.close();
    _isInitialized = false;
  }

  /// Test connection to Etke.cc API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest(
        'GET',
        '/health',
        timeout: Duration(seconds: 10),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Generate text using Etke.cc models.
  @override
  Future<AIResponse> generateText({
    required String prompt,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final modelName = model ?? _config['default_model'];
      final params = Map<String, dynamic>.from(_config)
        ..addAll(parameters ?? {});

      final response = await _makeRequest(
        'POST',
        '/generate/text',
        body: {
          'prompt': prompt,
          'model': modelName,
          'max_tokens': params['max_tokens'],
          'temperature': params['temperature'],
          'stream': false,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AIResponse(
          content: data['choices'][0]['text'] ?? '',
          serviceName: serviceName,
          model: modelName,
          type: AIResponseType.text,
          tokens: data['usage']?['total_tokens'],
          cost: _calculateCost(data['usage']),
          metadata: {
            'request_id': data['id'],
            'finish_reason': data['choices'][0]['finish_reason'],
          },
        );
      } else {
        throw Exception('Failed to generate text: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Generate code using Etke.cc code models.
  @override
  Future<AIResponse> generateCode({
    required String prompt,
    String? language,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final modelName = model ?? 'etke-coder';
      final lang = language ?? 'dart';

      final response = await _makeRequest(
        'POST',
        '/generate/code',
        body: {
          'prompt': prompt,
          'language': lang,
          'model': modelName,
          'max_tokens': _config['max_tokens'],
          'temperature': _config['temperature'],
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AIResponse(
          content: data['code'] ?? '',
          serviceName: serviceName,
          model: modelName,
          type: AIResponseType.code,
          tokens: data['usage']?['total_tokens'],
          cost: _calculateCost(data['usage']),
          metadata: {
            'language': lang,
            'request_id': data['id'],
            'complexity': data['complexity'],
            'suggestions': data['suggestions'],
          },
        );
      } else {
        throw Exception('Failed to generate code: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Generate images using Etke.cc image models
  @override
  Future<AIResponse> generateImage({
    required String prompt,
    String? model,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final modelName = model ?? 'etke-dalle';
      final params = Map<String, dynamic>.from(parameters ?? {});

      final response = await _makeRequest(
        'POST',
        '/generate/image',
        body: {
          'prompt': prompt,
          'model': modelName,
          'size': params['size'] ?? '1024x1024',
          'quality': params['quality'] ?? 'standard',
          'style': params['style'],
          'n': params['n'] ?? 1,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AIResponse(
          content: data['data'][0]['url'] ?? '',
          serviceName: serviceName,
          model: modelName,
          type: AIResponseType.image,
          cost: _calculateImageCost(modelName),
          metadata: {
            'request_id': data['id'],
            'size': params['size'] ?? '1024x1024',
            'quality': params['quality'] ?? 'standard',
            'revised_prompt': data['data'][0]['revised_prompt'],
          },
        );
      } else {
        throw Exception('Failed to generate image: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Analyze code using Etke.cc analysis models
  Future<AIResponse> analyzeCode({
    required String code,
    String? language,
    String? analysisType,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final modelName = 'etke-analyzer';
      final lang = language ?? 'dart';
      final type = analysisType ?? 'comprehensive';

      final response = await _makeRequest(
        'POST',
        '/analyze/code',
        body: {
          'code': code,
          'language': lang,
          'analysis_type': type,
          'model': modelName,
          'include_suggestions': true,
          'include_security': true,
          'include_performance': true,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AIResponse(
          content: data['analysis'] ?? '',
          serviceName: serviceName,
          model: modelName,
          type: AIResponseType.content,
          tokens: data['usage']?['total_tokens'],
          cost: _calculateCost(data['usage']),
          metadata: {
            'language': lang,
            'analysis_type': type,
            'issues_found': data['issues_count'],
            'security_score': data['security_score'],
            'performance_score': data['performance_score'],
            'suggestions': data['suggestions'],
          },
        );
      } else {
        throw Exception('Failed to analyze code: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Debug code using Etke.cc debugger
  Future<AIResponse> debugCode({
    required String code,
    String? language,
    String? errorMessage,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final modelName = 'etke-debugger';
      final lang = language ?? 'dart';

      final response = await _makeRequest(
        'POST',
        '/debug/code',
        body: {
          'code': code,
          'language': lang,
          'error_message': errorMessage,
          'model': modelName,
          'include_fix': true,
          'include_explanation': true,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AIResponse(
          content: data['debug_analysis'] ?? '',
          serviceName: serviceName,
          model: modelName,
          type: AIResponseType.code,
          tokens: data['usage']?['total_tokens'],
          cost: _calculateCost(data['usage']),
          metadata: {
            'language': lang,
            'issues_found': data['issues_count'],
            'fixes_provided': data['fixes_count'],
            'confidence_score': data['confidence_score'],
            'fixed_code': data['fixed_code'],
            'explanations': data['explanations'],
          },
        );
      } else {
        throw Exception('Failed to debug code: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Optimize code using Etke.cc optimizer
  Future<AIResponse> optimizeCode({
    required String code,
    String? language,
    String? optimizationType,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final modelName = 'etke-optimizer';
      final lang = language ?? 'dart';
      final type = optimizationType ?? 'performance';

      final response = await _makeRequest(
        'POST',
        '/optimize/code',
        body: {
          'code': code,
          'language': lang,
          'optimization_type': type,
          'model': modelName,
          'include_metrics': true,
          'include_explanation': true,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AIResponse(
          content: data['optimized_code'] ?? '',
          serviceName: serviceName,
          model: modelName,
          type: AIResponseType.code,
          tokens: data['usage']?['total_tokens'],
          cost: _calculateCost(data['usage']),
          metadata: {
            'language': lang,
            'optimization_type': type,
            'original_metrics': data['original_metrics'],
            'optimized_metrics': data['optimized_metrics'],
            'improvement_percentage': data['improvement_percentage'],
            'explanations': data['explanations'],
          },
        );
      } else {
        throw Exception('Failed to optimize code: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get insights and recommendations
  Future<AIResponse> getInsights({
    required String content,
    String? insightType,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final modelName = 'etke-insights';
      final type = insightType ?? 'general';

      final response = await _makeRequest(
        'POST',
        '/insights/generate',
        body: {
          'content': content,
          'insight_type': type,
          'model': modelName,
          'include_recommendations': true,
          'include_metrics': true,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AIResponse(
          content: data['insights'] ?? '',
          serviceName: serviceName,
          model: modelName,
          type: AIResponseType.content,
          tokens: data['usage']?['total_tokens'],
          cost: _calculateCost(data['usage']),
          metadata: {
            'insight_type': type,
            'recommendations': data['recommendations'],
            'metrics': data['metrics'],
            'confidence_score': data['confidence_score'],
          },
        );
      } else {
        throw Exception('Failed to generate insights: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get available models
  @override
  Future<List<String>> getAvailableModels({String? type}) async {
    try {
      final models = _config['models'] as Map<String, dynamic>;
      
      if (type != null) {
        return List<String>.from(models[type] ?? []);
      }
      
      final allModels = <String>[];
      models.values.forEach((modelList) {
        if (modelList is List) {
          allModels.addAll(modelList.cast<String>());
        }
      });
      
      return allModels;
    } catch (e) {
      return [];
    }
  }

  /// Get usage statistics
  @override
  Future<Map<String, dynamic>> getUsageStats() async {
    try {
      final response = await _makeRequest('GET', '/usage/stats');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'total_requests': data['total_requests'],
          'total_tokens': data['total_tokens'],
          'total_cost': data['total_cost'],
          'requests_today': data['requests_today'],
          'tokens_today': data['tokens_today'],
          'cost_today': data['cost_today'],
          'rate_limit_remaining': data['rate_limit_remaining'],
        };
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }

  /// Make HTTP request with rate limiting and error handling
  Future<http.Response> _makeRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
    Duration? timeout,
  }) async {
    // Check rate limiting
    await _checkRateLimit(endpoint);

    final uri = Uri.parse('$_baseUrl$endpoint');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
      'User-Agent': 'REChain-EtkeService/1.0',
    };

    final requestTimeout = timeout ?? Duration(seconds: _config['timeout'] ?? 30);

    try {
      http.Response response;
      
      switch (method.toUpperCase()) {
        case 'GET':
          response = await _client.get(uri, headers: headers).timeout(requestTimeout);
          break;
        case 'POST':
          response = await _client.post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          ).timeout(requestTimeout);
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      // Update rate limiting
      _updateRateLimit(endpoint);

      return response;
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Check rate limiting
  Future<void> _checkRateLimit(String endpoint) async {
    final now = DateTime.now();
    final lastRequest = _lastRequestTime[endpoint];
    
    if (lastRequest != null) {
      final timeDiff = now.difference(lastRequest);
      final requestsPerMinute = _config['rate_limit']['requests_per_minute'] ?? 60;
      
      if (timeDiff.inSeconds < 60 && _requestCount[endpoint] ?? 0 >= requestsPerMinute) {
        final waitTime = 60 - timeDiff.inSeconds;
        throw Exception('Rate limit exceeded. Please wait $waitTime seconds.');
      }
    }
  }

  /// Update rate limiting counters
  void _updateRateLimit(String endpoint) {
    final now = DateTime.now();
    final lastRequest = _lastRequestTime[endpoint];
    
    if (lastRequest != null && now.difference(lastRequest).inMinutes >= 1) {
      _requestCount[endpoint] = 1;
    } else {
      _requestCount[endpoint] = (_requestCount[endpoint] ?? 0) + 1;
    }
    
    _lastRequestTime[endpoint] = now;
  }

  /// Calculate cost based on usage
  double _calculateCost(Map<String, dynamic>? usage) {
    if (usage == null) return 0.0;
    
    final inputTokens = usage['prompt_tokens'] ?? 0;
    final outputTokens = usage['completion_tokens'] ?? 0;
    
    // Etke.cc pricing (example rates)
    const inputCostPer1k = 0.002;
    const outputCostPer1k = 0.004;
    
    return (inputTokens * inputCostPer1k / 1000) + (outputTokens * outputCostPer1k / 1000);
  }

  /// Calculate image generation cost
  double _calculateImageCost(String model) {
    // Etke.cc image pricing
    const costs = {
      'etke-dalle': 0.04,
      'etke-stable-diffusion': 0.02,
    };
    
    return costs[model] ?? 0.03;
  }

  /// Get service health status
  @override
  Future<Map<String, dynamic>> getHealthStatus() async {
    try {
      final isAvailable = await _testConnection();
      final usage = await getUsageStats();
      
      return {
        'service': serviceName,
        'status': isAvailable ? 'healthy' : 'unhealthy',
        'last_error': _lastError,
        'usage': usage,
        'rate_limit_remaining': usage['rate_limit_remaining'] ?? 0,
      };
    } catch (e) {
      return {
        'service': serviceName,
        'status': 'error',
        'last_error': e.toString(),
      };
    }
  }
} 