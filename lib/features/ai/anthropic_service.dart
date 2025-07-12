import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Anthropic Claude Service Implementation
class AnthropicService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.anthropic.com/v1';

  AnthropicService(this._config);

  /// Test connection to Anthropic API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/messages'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200 || response.statusCode == 400; // 400 means auth works
    } catch (e) {
      if (kDebugMode) {
        print('[Anthropic] Connection test failed: $e');
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
        throw Exception('Anthropic API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Anthropic] Text generation failed: $e');
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
      
      // In a real implementation, you would maintain conversation history
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
        throw Exception('Anthropic API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Anthropic] Chat failed: $e');
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
      // Anthropic doesn't provide usage stats via API
      // This would need to be tracked manually
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
        inputCost = inputTokens * 0.000015; // $15 per 1M tokens
        outputCost = outputTokens * 0.000075; // $75 per 1M tokens
        break;
      case 'claude-3-sonnet-20240229':
        inputCost = inputTokens * 0.000003; // $3 per 1M tokens
        outputCost = outputTokens * 0.000015; // $15 per 1M tokens
        break;
      case 'claude-3-haiku-20240307':
        inputCost = inputTokens * 0.00000025; // $0.25 per 1M tokens
        outputCost = outputTokens * 0.00000125; // $1.25 per 1M tokens
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