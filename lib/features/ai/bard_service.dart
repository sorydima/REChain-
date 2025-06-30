import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Google Bard Service Implementation
class BardService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://generativelanguage.googleapis.com/v1beta';

  BardService(this._config);

  /// Test connection to Bard API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models?key=$_apiKey'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Bard] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate text using Bard
  Future<AIResponse?> generateText(
    String prompt, 
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'gemini-pro';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/models/$model:generateContent?key=$_apiKey'),
        headers: _getHeaders(),
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt}
              ]
            }
          ],
          'generationConfig': {
            'maxOutputTokens': maxTokens,
            'temperature': temperature,
          },
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['candidates'][0]['content']['parts'][0]['text'];
        final usage = data['usageMetadata'] ?? {};
        
        return AIResponse(
          id: data['candidates'][0]['index'].toString(),
          content: content,
          type: AIResponseType.text,
          timestamp: DateTime.now(),
          cost: _calculateCost(usage, model),
          tokens: usage['totalTokenCount'],
          metadata: {
            'model': model,
            'promptTokenCount': usage['promptTokenCount'],
            'candidatesTokenCount': usage['candidatesTokenCount'],
          },
        );
      } else {
        throw Exception('Bard API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Bard] Text generation failed: $e');
      }
      return null;
    }
  }

  /// Chat with Bard
  Future<AIResponse?> chat(
    String message,
    String? conversationId,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'gemini-pro';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      final messages = [
        {
          'parts': [
            {'text': message}
          ]
        }
      ];
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/models/$model:generateContent?key=$_apiKey'),
        headers: _getHeaders(),
        body: jsonEncode({
          'contents': messages,
          'generationConfig': {
            'maxOutputTokens': maxTokens,
            'temperature': temperature,
          },
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['candidates'][0]['content']['parts'][0]['text'];
        final usage = data['usageMetadata'] ?? {};
        
        return AIResponse(
          id: data['candidates'][0]['index'].toString(),
          content: content,
          type: AIResponseType.chat,
          timestamp: DateTime.now(),
          conversationId: conversationId,
          cost: _calculateCost(usage, model),
          tokens: usage['totalTokenCount'],
          metadata: {
            'model': model,
            'promptTokenCount': usage['promptTokenCount'],
            'candidatesTokenCount': usage['candidatesTokenCount'],
          },
        );
      } else {
        throw Exception('Bard API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Bard] Chat failed: $e');
      }
      return null;
    }
  }

  /// Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    try {
      return {
        'note': 'Usage statistics not available via API',
        'tracking': 'Manual tracking required',
      };
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  /// Calculate cost based on usage
  double _calculateCost(Map<String, dynamic> usage, String model) {
    final totalTokens = usage['totalTokenCount'] ?? 0;
    
    // Simplified cost calculation
    switch (model) {
      case 'gemini-pro':
        return totalTokens * 0.0000005; // $0.0005 per 1K tokens
      default:
        return totalTokens * 0.0000005;
    }
  }

  /// Get headers for API requests
  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  /// Dispose resources
  void dispose() {
    _client.close();
  }
} 