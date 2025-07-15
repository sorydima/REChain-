import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Azure OpenAI Service Implementation
class AzureOpenAIService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _endpoint => _config['endpoint'] ?? '';
  String get _deploymentName => _config['deployment_name'] ?? 'gpt-4';
  String get _apiVersion => _config['api_version'] ?? '2024-02-15-preview';

  AzureOpenAIService(this._config);

  /// Test connection to Azure OpenAI API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_endpoint/openai/deployments?api-version=$_apiVersion'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Azure OpenAI] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate text using Azure OpenAI
  Future<AIResponse?> generateText(
    String prompt, 
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final deployment = parameters?['deployment'] ?? _deploymentName;
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      final response = await _client.post(
        Uri.parse('$_endpoint/openai/deployments/$deployment/chat/completions?api-version=$_apiVersion'),
        headers: _getHeaders(),
        body: jsonEncode({
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
          cost: _calculateCost(usage, deployment),
          tokens: usage['total_tokens'],
          metadata: {
            'deployment': deployment,
            'prompt_tokens': usage['prompt_tokens'],
            'completion_tokens': usage['completion_tokens'],
          },
        );
      } else {
        throw Exception('Azure OpenAI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Azure OpenAI] Text generation failed: $e');
      }
      return null;
    }
  }

  /// Generate image using Azure OpenAI DALL-E
  Future<AIResponse?> generateImage(
    String prompt,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final deployment = parameters?['deployment'] ?? 'dall-e-3';
      final size = parameters?['size'] ?? '1024x1024';
      final quality = parameters?['quality'] ?? 'standard';
      
      final response = await _client.post(
        Uri.parse('$_endpoint/openai/deployments/$deployment/images/generations?api-version=$_apiVersion'),
        headers: _getHeaders(),
        body: jsonEncode({
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
            'deployment': deployment,
            'size': size,
            'quality': quality,
          },
        );
      } else {
        throw Exception('Azure OpenAI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Azure OpenAI] Image generation failed: $e');
      }
      return null;
    }
  }

  /// Chat with Azure OpenAI
  Future<AIResponse?> chat(
    String message,
    String? conversationId,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final deployment = parameters?['deployment'] ?? _deploymentName;
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      // In a real implementation, you would maintain conversation history
      final messages = [
        {'role': 'user', 'content': message}
      ];
      
      final response = await _client.post(
        Uri.parse('$_endpoint/openai/deployments/$deployment/chat/completions?api-version=$_apiVersion'),
        headers: _getHeaders(),
        body: jsonEncode({
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
          cost: _calculateCost(usage, deployment),
          tokens: usage['total_tokens'],
          metadata: {
            'deployment': deployment,
            'prompt_tokens': usage['prompt_tokens'],
            'completion_tokens': usage['completion_tokens'],
          },
        );
      } else {
        throw Exception('Azure OpenAI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Azure OpenAI] Chat failed: $e');
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
        Uri.parse('$_endpoint/openai/usage?api-version=$_apiVersion&start_date=${startDate.toIso8601String().split('T')[0]}'),
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

  /// Get available deployments
  Future<List<Map<String, dynamic>>> getDeployments() async {
    try {
      final response = await _client.get(
        Uri.parse('$_endpoint/openai/deployments?api-version=$_apiVersion'),
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
  double _calculateCost(Map<String, dynamic> usage, String deployment) {
    // Simplified cost calculation
    // In reality, you'd use actual Azure pricing
    final inputTokens = usage['prompt_tokens'] ?? 0;
    final outputTokens = usage['completion_tokens'] ?? 0;
    
    double inputCost = 0;
    double outputCost = 0;
    
    if (deployment.contains('gpt-4')) {
      inputCost = inputTokens * 0.00003;
      outputCost = outputTokens * 0.00006;
    } else if (deployment.contains('gpt-35')) {
      inputCost = inputTokens * 0.0000015;
      outputCost = outputTokens * 0.000002;
    } else if (deployment.contains('dall-e')) {
      return 0.04; // $0.04 per image
    } else {
      inputCost = inputTokens * 0.000002;
      outputCost = outputTokens * 0.000002;
    }
    
    return inputCost + outputCost;
  }

  /// Get headers for API requests
  Map<String, String> _getHeaders() {
    return {
      'api-key': _apiKey,
      'Content-Type': 'application/json',
    };
  }

  /// Dispose resources
  void dispose() {
    _client.close();
  }
} 