import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Writesonic AI Service Implementation
class WritesonicService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.writesonic.com/v2/business/content';

  WritesonicService(this._config);

  /// Test connection to Writesonic API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/templates'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Writesonic] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate content using Writesonic
  Future<AIResponse?> generateContent(
    String prompt,
    String contentType,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final templateId = parameters?['template_id'] ?? '';
      final response = await _client.post(
        Uri.parse('$_baseUrl/$templateId'),
        headers: _getHeaders(),
        body: jsonEncode({
          'input_data': {
            'prompt': prompt,
            'content_type': contentType,
          },
        }),
      ).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['data']?[0]?['output'] ?? data['output'];
        return AIResponse(
          id: data['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
          content: content,
          type: AIResponseType.content,
          timestamp: DateTime.now(),
          metadata: {
            'template_id': templateId,
            'content_type': contentType,
          },
        );
      } else {
        throw Exception('Writesonic API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Writesonic] Content generation failed: $e');
      }
      return null;
    }
  }

  /// Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    return {'note': 'Usage statistics not available via API'};
  }

  /// Get headers for API requests
  Map<String, String> _getHeaders() {
    return {
      'X-API-KEY': _apiKey,
      'Content-Type': 'application/json',
    };
  }

  void dispose() {
    _client.close();
  }
} 