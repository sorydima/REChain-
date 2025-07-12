import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Cohere AI Service Implementation
class CohereService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.cohere.ai/v1';

  CohereService(this._config);

  /// Test connection to Cohere API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Cohere] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate text using Cohere
  Future<AIResponse?> generateText(
    String prompt, 
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'command';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/generate'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'prompt': prompt,
          'max_tokens': maxTokens,
          'temperature': temperature,
          'k': 0,
          'stop_sequences': [],
          'return_likelihoods': 'NONE',
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['generations'][0]['text'];
        final usage = data['meta'] ?? {};
        
        return AIResponse(
          id: data['generations'][0]['id'],
          content: content,
          type: AIResponseType.text,
          timestamp: DateTime.now(),
          cost: _calculateCost(usage, model),
          tokens: usage['billed_units']?['input_tokens'] ?? 0,
          metadata: {
            'model': model,
            'billed_units': usage['billed_units'],
          },
        );
      } else {
        throw Exception('Cohere API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Cohere] Text generation failed: $e');
      }
      return null;
    }
  }

  /// Chat with Cohere
  Future<AIResponse?> chat(
    String message,
    String? conversationId,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'command';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      // In a real implementation, you would maintain conversation history
      final messages = [
        {'role': 'USER', 'message': message}
      ];
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/chat'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'message': message,
          'max_tokens': maxTokens,
          'temperature': temperature,
          'conversation_id': conversationId,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['text'];
        final usage = data['meta'] ?? {};
        
        return AIResponse(
          id: data['response_id'],
          content: content,
          type: AIResponseType.chat,
          timestamp: DateTime.now(),
          conversationId: data['conversation_id'],
          cost: _calculateCost(usage, model),
          tokens: usage['billed_units']?['input_tokens'] ?? 0,
          metadata: {
            'model': model,
            'billed_units': usage['billed_units'],
          },
        );
      } else {
        throw Exception('Cohere API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Cohere] Chat failed: $e');
      }
      return null;
    }
  }

  /// Generate embeddings
  Future<List<double>?> generateEmbeddings(
    String text,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'embed-english-v3.0';
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/embed'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'texts': [text],
          'input_type': 'search_document',
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<double>.from(data['embeddings'][0]);
      } else {
        throw Exception('Cohere API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Cohere] Embedding generation failed: $e');
      }
      return null;
    }
  }

  /// Summarize text
  Future<AIResponse?> summarizeText(
    String text,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'summarize-xlarge';
      final length = parameters?['length'] ?? 'medium';
      final format = parameters?['format'] ?? 'paragraph';
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/summarize'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'text': text,
          'length': length,
          'format': format,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['summary'];
        
        return AIResponse(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: content,
          type: AIResponseType.text,
          timestamp: DateTime.now(),
          metadata: {
            'model': model,
            'length': length,
            'format': format,
          },
        );
      } else {
        throw Exception('Cohere API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Cohere] Text summarization failed: $e');
      }
      return null;
    }
  }

  /// Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/usage'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'error': 'Failed to get usage stats'};
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  /// Get available models
  Future<List<Map<String, dynamic>>> getModels() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['models']);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  /// Calculate cost based on usage
  double _calculateCost(Map<String, dynamic> usage, String model) {
    final billedUnits = usage['billed_units'];
    if (billedUnits == null) return 0.0;
    
    final inputTokens = billedUnits['input_tokens'] ?? 0;
    final outputTokens = billedUnits['output_tokens'] ?? 0;
    
    // Simplified cost calculation
    // In reality, you'd use actual Cohere pricing
    double inputCost = 0;
    double outputCost = 0;
    
    switch (model) {
      case 'command':
        inputCost = inputTokens * 0.0000015; // $1.5 per 1M tokens
        outputCost = outputTokens * 0.000002; // $2 per 1M tokens
        break;
      case 'command-light':
        inputCost = inputTokens * 0.0000005; // $0.5 per 1M tokens
        outputCost = outputTokens * 0.0000005; // $0.5 per 1M tokens
        break;
      default:
        inputCost = inputTokens * 0.000001;
        outputCost = outputTokens * 0.000001;
    }
    
    return inputCost + outputCost;
  }

  /// Get headers for API requests
  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/json',
    };
  }

  /// Dispose resources
  void dispose() {
    _client.close();
  }
} 