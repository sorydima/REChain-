import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Midjourney Service Implementation
class MidjourneyService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.midjourney.com/v1';

  MidjourneyService(this._config);

  /// Test connection to Midjourney API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/account'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Midjourney] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate image using Midjourney
  Future<AIResponse?> generateImage(
    String prompt,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final aspectRatio = parameters?['aspect_ratio'] ?? '1:1';
      final style = parameters?['style'] ?? 'v6';
      final quality = parameters?['quality'] ?? 'standard';
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/imagine'),
        headers: _getHeaders(),
        body: jsonEncode({
          'prompt': prompt,
          'aspectRatio': aspectRatio,
          'style': style,
          'quality': quality,
        }),
      ).timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final taskId = data['taskId'];
        
        // Poll for completion
        final result = await _pollForCompletion(taskId);
        
        if (result != null) {
          return AIResponse(
            id: taskId,
            content: result['imageUrl'],
            type: AIResponseType.image,
            timestamp: DateTime.now(),
            cost: _calculateCost(style),
            metadata: {
              'style': style,
              'aspectRatio': aspectRatio,
              'quality': quality,
              'taskId': taskId,
            },
          );
        }
      } else {
        throw Exception('Midjourney API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Midjourney] Image generation failed: $e');
      }
    }
    return null;
  }

  /// Poll for task completion
  Future<Map<String, dynamic>?> _pollForCompletion(String taskId) async {
    const maxAttempts = 60; // 5 minutes with 5-second intervals
    int attempts = 0;
    
    while (attempts < maxAttempts) {
      try {
        final response = await _client.get(
          Uri.parse('$_baseUrl/task/$taskId'),
          headers: _getHeaders(),
        ).timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final status = data['status'];
          
          if (status == 'completed') {
            return data['result'];
          } else if (status == 'failed') {
            throw Exception('Task failed: ${data['error']}');
          }
          // Continue polling if still processing
        }
        
        await Future.delayed(const Duration(seconds: 5));
        attempts++;
      } catch (e) {
        if (kDebugMode) {
          print('[Midjourney] Polling failed: $e');
        }
        attempts++;
      }
    }
    
    throw Exception('Task timeout');
  }

  /// Upscale image
  Future<AIResponse?> upscaleImage(
    String taskId,
    int index,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final response = await _client.post(
        Uri.parse('$_baseUrl/upscale'),
        headers: _getHeaders(),
        body: jsonEncode({
          'taskId': taskId,
          'index': index,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final upscaleTaskId = data['taskId'];
        
        // Poll for completion
        final result = await _pollForCompletion(upscaleTaskId);
        
        if (result != null) {
          return AIResponse(
            id: upscaleTaskId,
            content: result['imageUrl'],
            type: AIResponseType.image,
            timestamp: DateTime.now(),
            cost: _calculateCost('upscale'),
            metadata: {
              'originalTaskId': taskId,
              'index': index,
              'type': 'upscale',
            },
          );
        }
      } else {
        throw Exception('Midjourney API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Midjourney] Upscale failed: $e');
      }
    }
    return null;
  }

  /// Generate variations
  Future<AIResponse?> generateVariations(
    String taskId,
    int index,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final response = await _client.post(
        Uri.parse('$_baseUrl/variation'),
        headers: _getHeaders(),
        body: jsonEncode({
          'taskId': taskId,
          'index': index,
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final variationTaskId = data['taskId'];
        
        // Poll for completion
        final result = await _pollForCompletion(variationTaskId);
        
        if (result != null) {
          return AIResponse(
            id: variationTaskId,
            content: result['imageUrl'],
            type: AIResponseType.image,
            timestamp: DateTime.now(),
            cost: _calculateCost('variation'),
            metadata: {
              'originalTaskId': taskId,
              'index': index,
              'type': 'variation',
            },
          );
        }
      } else {
        throw Exception('Midjourney API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Midjourney] Variation generation failed: $e');
      }
    }
    return null;
  }

  /// Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/account'),
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

  /// Calculate cost based on style
  double _calculateCost(String style) {
    switch (style) {
      case 'v6':
        return 0.10; // $0.10 per image
      case 'upscale':
        return 0.05; // $0.05 per upscale
      case 'variation':
        return 0.10; // $0.10 per variation
      default:
        return 0.10;
    }
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