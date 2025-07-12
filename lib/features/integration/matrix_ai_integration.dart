import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix AI Integration Service
/// Provides AI-powered features for Matrix communication
class MatrixAIIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // AI services
  bool _messageAnalysisEnabled = false;
  bool _contentModerationEnabled = false;
  bool _translationEnabled = false;
  bool _sentimentAnalysisEnabled = false;
  bool _autoResponseEnabled = false;
  bool _spamDetectionEnabled = false;
  bool _intentRecognitionEnabled = false;
  bool _summarizationEnabled = false;

  MatrixAIIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-ai.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix AI services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Initializing Matrix AI services...');
      }

      // Test connection to Matrix AI API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix AI API is not available');
      }

      // Initialize individual services
      await _initializeMessageAnalysis();
      await _initializeContentModeration();
      await _initializeTranslation();
      await _initializeSentimentAnalysis();
      await _initializeAutoResponse();
      await _initializeSpamDetection();
      await _initializeIntentRecognition();
      await _initializeSummarization();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixAIIntegration] Matrix AI services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixAIIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix AI API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Message Analysis
  Future<void> _initializeMessageAnalysis() async {
    try {
      final response = await _makeRequest('POST', '/ai/message-analysis/initialize');
      if (response.statusCode == 200) {
        _messageAnalysisEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Message analysis initialization failed: $e');
      }
    }
  }

  /// Initialize Content Moderation
  Future<void> _initializeContentModeration() async {
    try {
      final response = await _makeRequest('POST', '/ai/content-moderation/initialize');
      if (response.statusCode == 200) {
        _contentModerationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Content moderation initialization failed: $e');
      }
    }
  }

  /// Initialize Translation
  Future<void> _initializeTranslation() async {
    try {
      final response = await _makeRequest('POST', '/ai/translation/initialize');
      if (response.statusCode == 200) {
        _translationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Translation initialization failed: $e');
      }
    }
  }

  /// Initialize Sentiment Analysis
  Future<void> _initializeSentimentAnalysis() async {
    try {
      final response = await _makeRequest('POST', '/ai/sentiment/initialize');
      if (response.statusCode == 200) {
        _sentimentAnalysisEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Sentiment analysis initialization failed: $e');
      }
    }
  }

  /// Initialize Auto Response
  Future<void> _initializeAutoResponse() async {
    try {
      final response = await _makeRequest('POST', '/ai/auto-response/initialize');
      if (response.statusCode == 200) {
        _autoResponseEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Auto response initialization failed: $e');
      }
    }
  }

  /// Initialize Spam Detection
  Future<void> _initializeSpamDetection() async {
    try {
      final response = await _makeRequest('POST', '/ai/spam-detection/initialize');
      if (response.statusCode == 200) {
        _spamDetectionEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Spam detection initialization failed: $e');
      }
    }
  }

  /// Initialize Intent Recognition
  Future<void> _initializeIntentRecognition() async {
    try {
      final response = await _makeRequest('POST', '/ai/intent-recognition/initialize');
      if (response.statusCode == 200) {
        _intentRecognitionEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Intent recognition initialization failed: $e');
      }
    }
  }

  /// Initialize Summarization
  Future<void> _initializeSummarization() async {
    try {
      final response = await _makeRequest('POST', '/ai/summarization/initialize');
      if (response.statusCode == 200) {
        _summarizationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAIIntegration] Summarization initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'message_analysis': _messageAnalysisEnabled,
    'content_moderation': _contentModerationEnabled,
    'translation': _translationEnabled,
    'sentiment_analysis': _sentimentAnalysisEnabled,
    'auto_response': _autoResponseEnabled,
    'spam_detection': _spamDetectionEnabled,
    'intent_recognition': _intentRecognitionEnabled,
    'summarization': _summarizationEnabled,
  };

  /// Message Analysis - Analyze message content
  Future<Map<String, dynamic>> analyzeMessage({
    required String message,
    required String roomId,
    String? userId,
    Map<String, dynamic>? context,
  }) async {
    if (!_messageAnalysisEnabled) {
      throw Exception('Message analysis is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ai/message-analysis/analyze',
        body: {
          'message': message,
          'room_id': roomId,
          if (userId != null) 'user_id': userId,
          if (context != null) 'context': context,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to analyze message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Content Moderation - Moderate message content
  Future<Map<String, dynamic>> moderateContent({
    required String message,
    required String roomId,
    String? userId,
    Map<String, dynamic>? rules,
  }) async {
    if (!_contentModerationEnabled) {
      throw Exception('Content moderation is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ai/content-moderation/moderate',
        body: {
          'message': message,
          'room_id': roomId,
          if (userId != null) 'user_id': userId,
          'rules': rules ?? {
            'profanity': true,
            'hate_speech': true,
            'spam': true,
            'inappropriate': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to moderate content: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Translation - Translate message
  Future<Map<String, dynamic>> translateMessage({
    required String message,
    required String targetLanguage,
    String? sourceLanguage,
    Map<String, dynamic>? options,
  }) async {
    if (!_translationEnabled) {
      throw Exception('Translation is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ai/translation/translate',
        body: {
          'message': message,
          'target_language': targetLanguage,
          if (sourceLanguage != null) 'source_language': sourceLanguage,
          'options': options ?? {
            'preserve_formatting': true,
            'detect_language': true,
            'quality': 'high',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to translate message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Sentiment Analysis - Analyze message sentiment
  Future<Map<String, dynamic>> analyzeSentiment({
    required String message,
    String? userId,
    Map<String, dynamic>? context,
  }) async {
    if (!_sentimentAnalysisEnabled) {
      throw Exception('Sentiment analysis is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ai/sentiment/analyze',
        body: {
          'message': message,
          if (userId != null) 'user_id': userId,
          if (context != null) 'context': context,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to analyze sentiment: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Auto Response - Generate automatic response
  Future<Map<String, dynamic>> generateAutoResponse({
    required String message,
    required String roomId,
    String? userId,
    Map<String, dynamic>? context,
    Map<String, dynamic>? personality,
  }) async {
    if (!_autoResponseEnabled) {
      throw Exception('Auto response is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ai/auto-response/generate',
        body: {
          'message': message,
          'room_id': roomId,
          if (userId != null) 'user_id': userId,
          if (context != null) 'context': context,
          'personality': personality ?? {
            'tone': 'friendly',
            'formality': 'casual',
            'response_length': 'medium',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to generate auto response: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Spam Detection - Detect spam messages
  Future<Map<String, dynamic>> detectSpam({
    required String message,
    required String roomId,
    String? userId,
    Map<String, dynamic>? userHistory,
  }) async {
    if (!_spamDetectionEnabled) {
      throw Exception('Spam detection is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ai/spam-detection/detect',
        body: {
          'message': message,
          'room_id': roomId,
          if (userId != null) 'user_id': userId,
          if (userHistory != null) 'user_history': userHistory,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to detect spam: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Intent Recognition - Recognize user intent
  Future<Map<String, dynamic>> recognizeIntent({
    required String message,
    String? userId,
    Map<String, dynamic>? context,
    List<String>? availableIntents,
  }) async {
    if (!_intentRecognitionEnabled) {
      throw Exception('Intent recognition is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ai/intent-recognition/recognize',
        body: {
          'message': message,
          if (userId != null) 'user_id': userId,
          if (context != null) 'context': context,
          if (availableIntents != null) 'available_intents': availableIntents,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to recognize intent: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Summarization - Summarize conversation
  Future<Map<String, dynamic>> summarizeConversation({
    required List<Map<String, dynamic>> messages,
    required String roomId,
    Map<String, dynamic>? options,
  }) async {
    if (!_summarizationEnabled) {
      throw Exception('Summarization is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ai/summarization/summarize',
        body: {
          'messages': messages,
          'room_id': roomId,
          'options': options ?? {
            'max_length': 200,
            'include_key_points': true,
            'include_actions': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to summarize conversation: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Batch Processing - Process multiple messages
  Future<List<Map<String, dynamic>>> batchProcessMessages({
    required List<Map<String, dynamic>> messages,
    required List<String> operations,
    Map<String, dynamic>? options,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/ai/batch/process',
        body: {
          'messages': messages,
          'operations': operations,
          if (options != null) 'options': options,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['results'] ?? []);
      } else {
        throw Exception('Failed to batch process messages: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get AI models
  Future<List<Map<String, dynamic>>> getAvailableModels() async {
    try {
      final response = await _makeRequest('GET', '/ai/models');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['models'] ?? []);
      } else {
        throw Exception('Failed to get available models: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Configure AI service
  Future<Map<String, dynamic>> configureAIService({
    required String serviceType,
    required Map<String, dynamic> config,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/ai/configure',
        body: {
          'service_type': serviceType,
          'config': config,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure AI service: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixAI/1.0',
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