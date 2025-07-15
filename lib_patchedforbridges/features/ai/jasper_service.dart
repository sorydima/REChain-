import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Jasper AI Service Implementation
class JasperService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://api.jasper.ai/v1';

  JasperService(this._config);

  /// Test connection to Jasper API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/templates'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Jasper] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Generate content using Jasper
  Future<AIResponse?> generateContent(
    String prompt,
    String contentType,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final templateId = parameters?['template_id'] ?? '';
      final response = await _client.post(
        Uri.parse('$_baseUrl/templates/$templateId/execute'),
        headers: _getHeaders(),
        body: jsonEncode({
          'inputs': {
            'prompt': prompt,
            'content_type': contentType,
          },
        }),
      ).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['content'];
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
        throw Exception('Jasper API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Jasper] Content generation failed: $e');
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
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/json',
    };
  }

  void dispose() {
    _client.close();
  }
} 