import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ai_service_manager.dart';

/// Character.AI Service Implementation
class CharacterAIService {
  final Map<String, dynamic> _config;
  final http.Client _client = http.Client();
  
  String get _apiKey => _config['api_key'] ?? '';
  String get _baseUrl => _config['base_url'] ?? 'https://beta.character.ai/api';

  CharacterAIService(this._config);

  /// Test connection to Character.AI API
  Future<bool> testConnection() async {
    try {
      final response = await _client.get(
        Uri.parse('$_baseUrl/characters'),
        headers: _getHeaders(),
      ).timeout(const Duration(seconds: 10));
      return response.statusCode == 200;
    } catch (e) {
      if (kDebugMode) {
        print('[Character.AI] Connection test failed: $e');
      }
      return false;
    }
  }

  /// Chat with Character.AI
  Future<AIResponse?> chat(
    String message,
    String? conversationId,
    Map<String, dynamic>? parameters,
  ) async {
    try {
      final characterId = parameters?['character_id'] ?? '';
      final response = await _client.post(
        Uri.parse('$_baseUrl/chat'),
        headers: _getHeaders(),
        body: jsonEncode({
          'character_id': characterId,
          'text': message,
          'history_external_id': conversationId,
        }),
      ).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['replies'][0]['text'];
        return AIResponse(
          id: data['external_id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
          content: content,
          type: AIResponseType.chat,
          timestamp: DateTime.now(),
          conversationId: conversationId,
          metadata: {
            'character_id': characterId,
          },
        );
      } else {
        throw Exception('Character.AI API error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Character.AI] Chat failed: $e');
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