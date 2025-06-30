import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// OpenAI Service Implementation
class OpenAIService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.openai.com/v1';
  String get _organization => _config['organization'] ?? '';

  OpenAIService(this._config);

  /// Test connection to OpenAI API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[OpenAI] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate text using OpenAI
  Future<AIResponse?> generateText(
    String prompt, 
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'gpt-4';
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
          'stream': false,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];
        final usage = data['usage'];
        
        return AIResponse(
          id: data['id'],
          content: content,
          type: AIResponseType.text,
          timestamp: DateTime.now(),
          cost: _calculateCost(usage, model),
          tokens: usage['total_tokens'],
          metadata: {
            'model': model,
            'prompt_tokens': usage['prompt_tokens'],
            'completion_tokens': usage['completion_tokens'],
          },
        );
      } else {
        throw Exception('OpenAI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[OpenAI] Text generation failed: $e');
      }
      return null;
    }
  }

  /// Generate image using DALL-E
  Future<AIResponse?> generateImage(
    String prompt,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'dall-e-3';
      final size = parameters?['size'] ?? '1024x1024';
      final quality = parameters?['quality'] ?? 'standard';
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/images/generations'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'prompt': prompt,
          'size': size,
          'quality': quality,
          'n': 1,
        }),
      ).timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final imageUrl = data['data'][0]['url'];
        
        return AIResponse(
          id: data['created'].toString(),
          content: imageUrl,
          type: AIResponseType.image,
          timestamp: DateTime.now(),
          metadata: {
            'model': model,
            'size': size,
            'quality': quality,
          },
        );
      } else {
        throw Exception('OpenAI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[OpenAI] Image generation failed: $e');
      }
      return null;
    }
  }

  /// Chat with OpenAI
  Future<AIResponse?> chat(
    String message,
    String? conversationId,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'gpt-4';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      // In a real implementation, you would maintain conversation history
      final messages = [
        {'role': 'user', 'content': message}
      ];
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/chat/completions'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'messages': messages,
          'max_tokens': maxTokens,
          'temperature': temperature,
          'stream': false,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];
        final usage = data['usage'];
        
        return AIResponse(
          id: data['id'],
          content: content,
          type: AIResponseType.chat,
          timestamp: DateTime.now(),
          conversationId: conversationId,
          cost: _calculateCost(usage, model),
          tokens: usage['total_tokens'],
          metadata: {
            'model': model,
            'prompt_tokens': usage['prompt_tokens'],
            'completion_tokens': usage['completion_tokens'],
          },
        );
      } else {
        throw Exception('OpenAI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[OpenAI] Chat failed: $e');
      }
      return null;
    }
  }

  /// Generate code with OpenAI
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

  /// Transcribe audio
  Future<AIResponse?> transcribeAudio(
    List<int> audioData,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'whisper-1';
      
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/audio/transcriptions'),
      );
      
      request.headers.addAll(_getHeaders());
      request.fields['model'] = model;
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          audioData,
          filename: 'audio.wav',
        ),
      );

      final response = await request.send().timeout(const Duration(seconds: 60));
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = jsonDecode(responseBody);
        
        return AIResponse(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          content: data['text'],
          type: AIResponseType.audio,
          timestamp: DateTime.now(),
          metadata: {
            'model': model,
            'language': data['language'],
          },
        );
      } else {
        throw Exception('OpenAI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[OpenAI] Audio transcription failed: $e');
      }
      return null;
    }
  }

  /// Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    try {
      final now = DateTime.now();
      final startDate = now.subtract(const Duration(days: 30));
      
      final response = await _client.get(
        Uri.parse('$_baseUrl/usage?date=${startDate.toIso8601String().split('T')[0]}'),
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
        return List<Map<String, dynamic>>.from(data['data']);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  /// Calculate cost based on usage
  double _calculateCost(Map<String, dynamic> usage, String model) {
    // Simplified cost calculation
    // In reality, you'd use actual pricing from OpenAI
    final inputTokens = usage['prompt_tokens'] ?? 0;
    final outputTokens = usage['completion_tokens'] ?? 0;
    
    double inputCost = 0;
    double outputCost = 0;
    
    switch (model) {
      case 'gpt-4':
        inputCost = inputTokens * 0.00003; // $0.03 per 1K tokens
        outputCost = outputTokens * 0.00006; // $0.06 per 1K tokens
        break;
      case 'gpt-3.5-turbo':
        inputCost = inputTokens * 0.0000015; // $0.0015 per 1K tokens
        outputCost = outputTokens * 0.000002; // $0.002 per 1K tokens
        break;
      case 'dall-e-3':
        return 0.04; // $0.04 per image
      default:
        inputCost = inputTokens * 0.000002;
        outputCost = outputTokens * 0.000002;
    }
    
    return inputCost + outputCost;
  }

  /// Get headers for API requests
  Map<String, String> _getHeaders() {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/json',
    };
    
    if (_organization.isNotEmpty) {
      headers['OpenAI-Organization'] = _organization;
    }
    
    return headers;
  }

  /// Dispose resources
  void dispose() {
    _client.close();
  }
} 