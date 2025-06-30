import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Stability AI Service Implementation
class StabilityAIService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.stability.ai/v1';

  StabilityAIService(this._config);

  /// Test connection to Stability AI API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/user/balance'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Stability AI] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate image using Stability AI
  Future<AIResponse?> generateImage(
    String prompt,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'stable-diffusion-xl-1024-v1-0';
      final steps = parameters?['steps'] ?? 30;
      final cfgScale = parameters?['cfg_scale'] ?? 7.0;
      final samples = parameters?['samples'] ?? 1;
      final aspectRatio = parameters?['aspect_ratio'] ?? '1:1';
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/generation/$model/text-to-image'),
        headers: _getHeaders(),
        body: jsonEncode({
          'text_prompts': [
            {
              'text': prompt,
              'weight': 1.0,
            }
          ],
          'cfg_scale': cfgScale,
          'steps': steps,
          'samples': samples,
          'aspect_ratio': aspectRatio,
        }),
      ).timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final artifacts = data['artifacts'];
        
        if (artifacts.isNotEmpty) {
          final imageData = artifacts[0]['base64'];
          
          return AIResponse(
            id: artifacts[0]['id'],
            content: 'data:image/png;base64,$imageData',
            type: AIResponseType.image,
            timestamp: DateTime.now(),
            cost: _calculateCost(model, steps, samples),
            metadata: {
              'model': model,
              'steps': steps,
              'cfg_scale': cfgScale,
              'samples': samples,
              'aspect_ratio': aspectRatio,
            },
          );
        }
      } else {
        throw Exception('Stability AI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Stability AI] Image generation failed: $e');
      }
      return null;
    }
  }

  /// Upscale image using Stability AI
  Future<AIResponse?> upscaleImage(
    List<int> imageData,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'esrgan-v1-x2plus';
      
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/generation/$model/image-to-image/upscale'),
      );
      
      request.headers.addAll(_getHeaders());
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
        final artifacts = data['artifacts'];
        
        if (artifacts.isNotEmpty) {
          final upscaledImageData = artifacts[0]['base64'];
          
          return AIResponse(
            id: artifacts[0]['id'],
            content: 'data:image/png;base64,$upscaledImageData',
            type: AIResponseType.image,
            timestamp: DateTime.now(),
            cost: _calculateCost(model, 0, 1),
            metadata: {
              'model': model,
              'type': 'upscale',
            },
          );
        }
      } else {
        throw Exception('Stability AI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Stability AI] Image upscaling failed: $e');
      }
      return null;
    }
  }

  /// Generate image variations
  Future<AIResponse?> generateVariations(
    List<int> imageData,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final model = parameters?['model'] ?? 'stable-diffusion-xl-1024-v1-0';
      final steps = parameters?['steps'] ?? 30;
      final cfgScale = parameters?['cfg_scale'] ?? 7.0;
      final samples = parameters?['samples'] ?? 1;
      
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/generation/$model/image-to-image'),
      );
      
      request.headers.addAll(_getHeaders());
      request.fields['cfg_scale'] = cfgScale.toString();
      request.fields['steps'] = steps.toString();
      request.fields['samples'] = samples.toString();
      request.files.add(
        http.MultipartFile.fromBytes(
          'init_image',
          imageData,
          filename: 'image.png',
        ),
      );

      final response = await request.send().timeout(const Duration(seconds: 60));
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = jsonDecode(responseBody);
        final artifacts = data['artifacts'];
        
        if (artifacts.isNotEmpty) {
          final imageData = artifacts[0]['base64'];
          
          return AIResponse(
            id: artifacts[0]['id'],
            content: 'data:image/png;base64,$imageData',
            type: AIResponseType.image,
            timestamp: DateTime.now(),
            cost: _calculateCost(model, steps, samples),
            metadata: {
              'model': model,
              'steps': steps,
              'cfg_scale': cfgScale,
              'samples': samples,
              'type': 'variation',
            },
          );
        }
      } else {
        throw Exception('Stability AI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Stability AI] Image variation failed: $e');
      }
      return null;
    }
  }

  /// Get user balance
  Future<Map<String, dynamic>> getUserBalance() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/user/balance'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'error': 'Failed to get balance'};
      }
    } catch (e) {
      return {'error': e.toString()};
    }
  }

  /// Get available models
  Future<List<Map<String, dynamic>>> getModels() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/engines/list'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['engines']);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  /// Calculate cost based on model and parameters
  double _calculateCost(String model, int steps, int samples) {
    // Simplified cost calculation
    // In reality, you'd use actual Stability AI pricing
    double baseCost = 0.0;
    
    switch (model) {
      case 'stable-diffusion-xl-1024-v1-0':
        baseCost = 0.02; // $0.02 per image
        break;
      case 'stable-diffusion-v1-6':
        baseCost = 0.01; // $0.01 per image
        break;
      case 'esrgan-v1-x2plus':
        baseCost = 0.005; // $0.005 per upscale
        break;
      default:
        baseCost = 0.015;
    }
    
    return baseCost * samples;
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