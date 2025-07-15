import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// DALL-E Service Implementation
class DALLEService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.openai.com/v1';

  DALLEService(this._config);

  /// Test connection to DALL-E API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/models'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[DALL-E] Connection test failed: $e');
      }
      return false;
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
      final style = parameters?['style'] ?? 'vivid';
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/images/generations'),
        headers: _getHeaders(),
        body: jsonEncode({
          'model': model,
          'prompt': prompt,
          'size': size,
          'quality': quality,
          'style': style,
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
          cost: _calculateCost(model, size, quality),
          metadata: {
            'model': model,
            'size': size,
            'quality': quality,
            'style': style,
          },
        );
      } else {
        throw Exception('DALL-E API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[DALL-E] Image generation failed: $e');
      }
      return null;
    }
  }

  /// Edit image using DALL-E
  Future<AIResponse?> editImage(
    List<int> imageData,
    String prompt,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final size = parameters?['size'] ?? '1024x1024';
      
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/images/edits'),
      );
      
      request.headers.addAll(_getHeaders());
      request.fields['prompt'] = prompt;
      request.fields['size'] = size;
      request.fields['n'] = '1';
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          imageData,
          filename: 'image.png',
        ),
      );

      final response = await request.send().timeout(const Duration(seconds: 60));
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = jsonDecode(responseBody);
        final imageUrl = data['data'][0]['url'];
        
        return AIResponse(
          id: data['created'].toString(),
          content: imageUrl,
          type: AIResponseType.image,
          timestamp: DateTime.now(),
          cost: _calculateCost('dall-e-2', size, 'standard'),
          metadata: {
            'model': 'dall-e-2',
            'size': size,
            'type': 'edit',
          },
        );
      } else {
        throw Exception('DALL-E API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[DALL-E] Image editing failed: $e');
      }
      return null;
    }
  }

  /// Create image variations
  Future<AIResponse?> createVariations(
    List<int> imageData,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final size = parameters?['size'] ?? '1024x1024';
      final n = parameters?['n'] ?? 1;
      
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/images/variations'),
      );
      
      request.headers.addAll(_getHeaders());
      request.fields['size'] = size;
      request.fields['n'] = n.toString();
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          imageData,
          filename: 'image.png',
        ),
      );

      final response = await request.send().timeout(const Duration(seconds: 60));
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = jsonDecode(responseBody);
        final imageUrls = data['data'].map((item) => item['url']).toList();
        
        return AIResponse(
          id: data['created'].toString(),
          content: imageUrls.join(','),
          type: AIResponseType.image,
          timestamp: DateTime.now(),
          cost: _calculateCost('dall-e-2', size, 'standard') * n,
          metadata: {
            'model': 'dall-e-2',
            'size': size,
            'count': n,
            'type': 'variation',
          },
        );
      } else {
        throw Exception('DALL-E API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[DALL-E] Image variation failed: $e');
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

  /// Calculate cost based on model and parameters
  double _calculateCost(String model, String size, String quality) {
    switch (model) {
      case 'dall-e-3':
        if (quality == 'hd') {
          return size == '1024x1024' ? 0.08 : 0.12; // $0.08 or $0.12 for HD
        } else {
          return size == '1024x1024' ? 0.04 : 0.08; // $0.04 or $0.08 for standard
        }
      case 'dall-e-2':
        return 0.02; // $0.02 per image
      default:
        return 0.04;
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