import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Claude Service Implementation (Specialized)
class ClaudeService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.anthropic.com/v1';

  ClaudeService(this._config);

  /// Test connection to Claude API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/messages'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200 || response.statusCode == 400;
    } catch (e) {
      if (kDebugMode) {
        print('[Claude] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate text using Claude
  Future<AIResponse?> generateText(
    String prompt, 
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'claude-3-sonnet-20240229';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/messages'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'max_tokens': maxTokens,
          'temperature': temperature,
          'messages': [
            {'role': 'user', 'content': prompt}
          ],
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['content'][0]['text'];
        final usage = data['usage'];
        
        return AIResponse(
          id: data['id'],
          content: content,
          type: AIResponseType.text,
          timestamp: DateTime.now(),
          cost: _calculateCost(usage, model),
          tokens: usage['input_tokens'] + usage['output_tokens'],
          metadata: {
            'model': model,
            'input_tokens': usage['input_tokens'],
            'output_tokens': usage['output_tokens'],
          },
        );
      } else {
        throw Exception('Claude API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Claude] Text generation failed: $e');
      }
      return null;
    }
  }

  /// Chat with Claude
  Future<AIResponse?> chat(
    String message,
    String? conversationId,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'claude-3-sonnet-20240229';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      final messages = [
        {'role': 'user', 'content': message}
      ];
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/messages'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'max_tokens': maxTokens,
          'temperature': temperature,
          'messages': messages,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['content'][0]['text'];
        final usage = data['usage'];
        
        return AIResponse(
          id: data['id'],
          content: content,
          type: AIResponseType.chat,
          timestamp: DateTime.now(),
          conversationId: conversationId,
          cost: _calculateCost(usage, model),
          tokens: usage['input_tokens'] + usage['output_tokens'],
          metadata: {
            'model': model,
            'input_tokens': usage['input_tokens'],
            'output_tokens': usage['output_tokens'],
          },
        );
      } else {
        throw Exception('Claude API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Claude] Chat failed: $e');
      }
      return null;
    }
  }

  /// Generate code with Claude
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
    final inputTokens = usage['input_tokens'] ?? 0;
    final outputTokens = usage['output_tokens'] ?? 0;
    
    double inputCost = 0;
    double outputCost = 0;
    
    switch (model) {
      case 'claude-3-opus-20240229':
        inputCost = inputTokens * 0.000015;
        outputCost = outputTokens * 0.000075;
        break;
      case 'claude-3-sonnet-20240229':
        inputCost = inputTokens * 0.000003;
        outputCost = outputTokens * 0.000015;
        break;
      case 'claude-3-haiku-20240307':
        inputCost = inputTokens * 0.00000025;
        outputCost = outputTokens * 0.00000125;
        break;
      default:
        inputCost = inputTokens * 0.000003;
        outputCost = outputTokens * 0.000015;
    }
    
    return inputCost + outputCost;
  }

  /// Get headers for API requests
  Map<String, String> _getHeaders() {
    return {
      'x-api-key': _apiKey,
      'Content-Type': 'application/json',
      'anthropic-version': '2023-06-01',
    };
  }

  /// Dispose resources
  void dispose() {
    _client.close();
  }
} 