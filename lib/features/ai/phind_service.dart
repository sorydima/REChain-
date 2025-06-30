import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Phind AI Service Implementation
class PhindService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.phind.com/v1';

  PhindService(this._config);

  /// Test connection to Phind API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Phind] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate text using Phind
  Future<AIResponse?> generateText(
    String prompt, 
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'phind-model';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      final response = await _client.post(
        Uri.parse('$_baseUrl/chat/completions'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'messages': [
            {'role': 'user', 'content': prompt}
          ],
          'max_tokens': maxTokens,
          'temperature': temperature,
        }),
      ).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];
        final usage = data['usage'] ?? {};
        return AIResponse(
          id: data['id'],
          content: content,
          type: AIResponseType.text,
          timestamp: DateTime.now(),
          tokens: usage['total_tokens'],
          metadata: {
            'model': model,
            'prompt_tokens': usage['prompt_tokens'],
            'completion_tokens': usage['completion_tokens'],
          },
        );
      } else {
        throw Exception('Phind API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Phind] Text generation failed: $e');
      }
      return null;
    }
  }

  /// Chat with Phind
  Future<AIResponse?> chat(
    String message,
    String? conversationId,
    Map<String, dynamic>? parameters,
  ) async {
    return generateText(message, parameters);
  }

  /// Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    return {'note': 'Usage statistics not available via API'};
  }

  /// Get headers for API requests
  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/json',
    };
  }

  void dispose() {
    _client.close();
  }
} 