import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Google AI (Gemini) Service Implementation
class GoogleAIService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://generativelanguage.googleapis.com/v1beta';

  GoogleAIService(this._config);

  /// Test connection to Google AI API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models?key=$_apiKey'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Google AI] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate text using Gemini
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
        throw Exception('Google AI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Google AI] Text generation failed: $e');
      }
      return null;
    }
  }

  /// Generate image using Gemini Vision
  Future<AIResponse?> generateImage(
    String prompt,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'gemini-pro-vision';
      final imageData = parameters?['image_data'];
      
      if (imageData == null) {
        throw Exception('Image data required for Gemini Vision');
      }
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/models/$model:generateContent?key=$_apiKey'),
        headers: _getHeaders(),
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {'text': prompt},
                {
                  'inlineData': {
                    'mimeType': 'image/jpeg',
                    'data': imageData,
                  }
                }
              ]
            }
          ],
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['candidates'][0]['content']['parts'][0]['text'];
        
        return AIResponse(
          id: data['candidates'][0]['index'].toString(),
          content: content,
          type: AIResponseType.image,
          timestamp: DateTime.now(),
          metadata: {
            'model': model,
            'analysis': 'Image analysis completed',
          },
        );
      } else {
        throw Exception('Google AI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Google AI] Image analysis failed: $e');
      }
      return null;
    }
  }

  /// Chat with Gemini
  Future<AIResponse?> chat(
    String message,
    String? conversationId,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'gemini-pro';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      // In a real implementation, you would maintain conversation history
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
        throw Exception('Google AI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Google AI] Chat failed: $e');
      }
      return null;
    }
  }

  /// Generate code with Gemini
  Future<AIResponse?> generateCode(
    String prompt,
    String language,
    Map<String, dynamic>? parameters,
  ) async {
    final codePrompt = '''
Generate $language code for the following request:

$prompt

Please provide:
1. Complete, working code
2. Brief explanation of the solution
3. Any important notes or considerations
''';

    return generateText(codePrompt, parameters);
  }

  /// Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    try {
      // Google AI doesn't provide usage stats via API
      return {
        'note': 'Usage statistics not available via API',
        'tracking': 'Manual tracking required',
      };
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  /// Get available models
  Future<List<Map<String, dynamic>>> getModels() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models?key=$_apiKey'),
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
    final totalTokens = usage['totalTokenCount'] ?? 0;
    
    // Simplified cost calculation
    // In reality, you'd use actual pricing from Google AI
    switch (model) {
      case 'gemini-pro':
        return totalTokens * 0.0000005; // $0.0005 per 1K tokens
      case 'gemini-pro-vision':
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