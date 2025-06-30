import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Replicate Service Implementation
class ReplicateService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.replicate.com/v1';

  ReplicateService(this._config);

  /// Test connection to Replicate API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Replicate] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate image using Replicate
  Future<AIResponse?> generateImage(
    String prompt,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'stability-ai/stable-diffusion:db21e45d3f7023abc2a46ee38a23973f6dce16bb082a930b0c49861f96d1e5bf';
      final width = parameters?['width'] ?? 1024;
      final height = parameters?['height'] ?? 1024;
      final steps = parameters?['steps'] ?? 20;
      final guidanceScale = parameters?['guidance_scale'] ?? 7.5;
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/predictions'),
        headers: _getHeaders(),
        body: jsonEncode({
          'version': model.split(':').last,
          'input': {
            'prompt': prompt,
            'width': width,
            'height': height,
            'num_inference_steps': steps,
            'guidance_scale': guidanceScale,
          },
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final predictionId = data['id'];
        
        // Poll for completion
        final result = await _pollForCompletion(predictionId);
        
        if (result != null && result['output'] != null) {
          final imageUrl = result['output'] is List ? result['output'][0] : result['output'];
          
          return AIResponse(
            id: predictionId,
            content: imageUrl,
            type: AIResponseType.image,
            timestamp: DateTime.now(),
            cost: _calculateCost(model),
            metadata: {
              'model': model,
              'width': width,
              'height': height,
              'steps': steps,
              'guidance_scale': guidanceScale,
            },
          );
        }
      } else {
        throw Exception('Replicate API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Replicate] Image generation failed: $e');
      }
    }
    return null;
  }

  /// Generate text using Replicate
  Future<AIResponse?> generateText(
    String prompt,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'meta/llama-2-70b-chat:02e509c789964a7ea8736978a43525956ef40397be9033abf9fd2badfe68c813';
      final maxTokens = parameters?['max_tokens'] ?? 1000;
      final temperature = parameters?['temperature'] ?? 0.7;
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/predictions'),
        headers: _getHeaders(),
        body: jsonEncode({
          'version': model.split(':').last,
          'input': {
            'prompt': prompt,
            'max_tokens': maxTokens,
            'temperature': temperature,
          },
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final predictionId = data['id'];
        
        // Poll for completion
        final result = await _pollForCompletion(predictionId);
        
        if (result != null && result['output'] != null) {
          final content = result['output'] is List ? result['output'].join('') : result['output'];
          
          return AIResponse(
            id: predictionId,
            content: content,
            type: AIResponseType.text,
            timestamp: DateTime.now(),
            cost: _calculateCost(model),
            metadata: {
              'model': model,
              'max_tokens': maxTokens,
              'temperature': temperature,
            },
          );
        }
      } else {
        throw Exception('Replicate API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Replicate] Text generation failed: $e');
      }
    }
    return null;
  }

  /// Poll for prediction completion
  Future<Map<String, dynamic>?> _pollForCompletion(String predictionId) async {
    const maxAttempts = 60; // 5 minutes with 5-second intervals
    int attempts = 0;
    
    while (attempts < maxAttempts) {
      try {
        final response = await _client.get(
          Uri.parse('$_baseUrl/predictions/$predictionId'),
          headers: _getHeaders(),
        ).timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final status = data['status'];
          
          if (status == 'succeeded') {
            return data;
          } else if (status == 'failed') {
            throw Exception('Prediction failed: ${data['error']}');
          }
          // Continue polling if still processing
        }
        
        await Future.delayed(const Duration(seconds: 5));
        attempts++;
      } catch (e) {
        if (kDebugMode) {
          print('[Replicate] Polling failed: $e');
        }
        attempts++;
      }
    }
    
    throw Exception('Prediction timeout');
  }

  /// Get user information
  Future<Map<String, dynamic>> getUserInfo() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/user'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'error': 'Failed to get user info'};
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
        return List<Map<String, dynamic>>.from(data['results']);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  /// Calculate cost based on model
  double _calculateCost(String model) {
    // Simplified cost calculation
    // In reality, you'd use actual Replicate pricing
    if (model.contains('stable-diffusion')) {
      return 0.02; // $0.02 per image
    } else if (model.contains('llama')) {
      return 0.01; // $0.01 per text generation
    } else {
      return 0.015; // Default cost
    }
  }

  /// Get headers for API requests
  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Token $_apiKey',
      'Content-Type': 'application/json',
    };
  }

  /// Dispose resources
  void dispose() {
    _client.close();
  }
} 