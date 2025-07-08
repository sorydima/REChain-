import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Gigachat Service for AI chat integration
class GigachatService {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;

  GigachatService({
    required String baseUrl,
    required String apiKey,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _client = client ?? http.Client();

  /// Send message to Gigachat
  Future<GigachatResponse> sendMessage({
    required String message,
    required String sessionId,
    List<GigachatMessage>? history,
    Map<String, dynamic>? options,
  }) async {
    try {
      final requestBody = {
        'messages': [
          ...(history ?? []).map((msg) => msg.toJson()),
          {
            'role': 'user',
            'content': message,
          },
        ],
        'session_id': sessionId,
        'options': options ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/chat/completions');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(requestBody),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GigachatResponse.fromJson(data);
      } else {
        throw Exception('Failed to send message: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error sending message to Gigachat: $e');
    }
  }

  /// Stream message to Gigachat
  Stream<GigachatStreamResponse> streamMessage({
    required String message,
    required String sessionId,
    List<GigachatMessage>? history,
    Map<String, dynamic>? options,
  }) async* {
    try {
      final requestBody = {
        'messages': [
          ...(history ?? []).map((msg) => msg.toJson()),
          {
            'role': 'user',
            'content': message,
          },
        ],
        'session_id': sessionId,
        'stream': true,
        'options': options ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/chat/completions');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final request = http.Request('POST', uri);
      request.headers.addAll(headers);
      request.body = json.encode(requestBody);

      final streamedResponse = await _client.send(request);
      
      if (streamedResponse.statusCode == 200) {
        await for (final chunk in streamedResponse.stream.transform(utf8.decoder)) {
          final lines = chunk.split('\n');
          for (final line in lines) {
            if (line.startsWith('data: ')) {
              final data = line.substring(6);
              if (data == '[DONE]') {
                yield GigachatStreamResponse.done();
                break;
              }
              try {
                final jsonData = json.decode(data);
                yield GigachatStreamResponse.fromJson(jsonData);
              } catch (e) {
                if (kDebugMode) {
                  print('Error parsing stream data: $e');
                }
              }
            }
          }
        }
      } else {
        throw Exception('Failed to stream message: ${streamedResponse.statusCode}');
      }
    } catch (e) {
      throw Exception('Error streaming message to Gigachat: $e');
    }
  }

  /// Get available models
  Future<List<GigachatModel>> getModels() async {
    try {
      final uri = Uri.parse('$_baseUrl/v1/models');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> models = data['data'] ?? [];
        return models.map((model) => GigachatModel.fromJson(model)).toList();
      } else {
        throw Exception('Failed to get models: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching models: $e');
    }
  }

  /// Create chat session
  Future<GigachatSession> createSession({
    required String name,
    String? description,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final session = {
        'name': name,
        'description': description ?? '',
        'metadata': metadata ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/sessions');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(session),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GigachatSession.fromJson(data);
      } else {
        throw Exception('Failed to create session: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating session: $e');
    }
  }

  /// Get chat sessions
  Future<List<GigachatSession>> getSessions() async {
    try {
      final uri = Uri.parse('$_baseUrl/v1/sessions');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((session) => GigachatSession.fromJson(session)).toList();
      } else {
        throw Exception('Failed to get sessions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching sessions: $e');
    }
  }

  /// Delete chat session
  Future<void> deleteSession(String sessionId) async {
    try {
      final uri = Uri.parse('$_baseUrl/v1/sessions/$sessionId');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.delete(uri, headers: headers);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to delete session: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting session: $e');
    }
  }

  /// Get session history
  Future<List<GigachatMessage>> getSessionHistory(String sessionId) async {
    try {
      final uri = Uri.parse('$_baseUrl/v1/sessions/$sessionId/messages');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((message) => GigachatMessage.fromJson(message)).toList();
      } else {
        throw Exception('Failed to get session history: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching session history: $e');
    }
  }

  /// Analyze blockchain data with AI
  Future<BlockchainAnalysis> analyzeBlockchainData({
    required String data,
    required String analysisType,
    Map<String, dynamic>? context,
  }) async {
    try {
      final prompt = _buildAnalysisPrompt(data, analysisType, context);
      
      final response = await sendMessage(
        message: prompt,
        sessionId: 'blockchain-analysis',
        options: {
          'temperature': 0.3,
          'max_tokens': 2000,
        },
      );

      return BlockchainAnalysis(
        type: analysisType,
        data: data,
        analysis: response.choices.first.message.content,
        confidence: response.choices.first.finishReason == 'stop' ? 0.9 : 0.7,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Error analyzing blockchain data: $e');
    }
  }

  /// Get trading insights
  Future<TradingInsight> getTradingInsight({
    required Map<String, dynamic> marketData,
    required String asset,
    required String timeframe,
  }) async {
    try {
      final prompt = _buildTradingPrompt(marketData, asset, timeframe);
      
      final response = await sendMessage(
        message: prompt,
        sessionId: 'trading-insights',
        options: {
          'temperature': 0.2,
          'max_tokens': 1500,
        },
      );

      return TradingInsight(
        asset: asset,
        timeframe: timeframe,
        insight: response.choices.first.message.content,
        confidence: response.choices.first.finishReason == 'stop' ? 0.85 : 0.6,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Error getting trading insight: $e');
    }
  }

  String _buildAnalysisPrompt(String data, String analysisType, Map<String, dynamic>? context) {
    final contextStr = context != null ? '\nContext: ${json.encode(context)}' : '';
    return '''
Analyze the following blockchain data for $analysisType:

Data: $data$contextStr

Please provide a detailed analysis including:
1. Key patterns and trends
2. Potential risks or opportunities
3. Recommendations for action
4. Confidence level in the analysis

Focus on actionable insights that would be valuable for a blockchain application user.
''';
  }

  String _buildTradingPrompt(Map<String, dynamic> marketData, String asset, String timeframe) {
    return '''
Analyze the following market data for $asset over $timeframe:

Market Data: ${json.encode(marketData)}

Please provide trading insights including:
1. Current market sentiment
2. Key support and resistance levels
3. Potential entry/exit points
4. Risk assessment
5. Recommended position sizing

Focus on practical trading advice for a cryptocurrency trader.
''';
  }

  void dispose() {
    _client.close();
  }
}

/// Gigachat Response
class GigachatResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<GigachatChoice> choices;
  final GigachatUsage usage;

  GigachatResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory GigachatResponse.fromJson(Map<String, dynamic> json) {
    return GigachatResponse(
      id: json['id']?.toString() ?? '',
      object: json['object']?.toString() ?? '',
      created: json['created'] ?? 0,
      model: json['model']?.toString() ?? '',
      choices: (json['choices'] as List<dynamic>? ?? [])
          .map((choice) => GigachatChoice.fromJson(choice))
          .toList(),
      usage: GigachatUsage.fromJson(json['usage'] ?? {}),
    );
  }
}

/// Gigachat Choice
class GigachatChoice {
  final int index;
  final GigachatMessage message;
  final String finishReason;

  GigachatChoice({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  factory GigachatChoice.fromJson(Map<String, dynamic> json) {
    return GigachatChoice(
      index: json['index'] ?? 0,
      message: GigachatMessage.fromJson(json['message'] ?? {}),
      finishReason: json['finish_reason']?.toString() ?? '',
    );
  }
}

/// Gigachat Message
class GigachatMessage {
  final String role;
  final String content;

  GigachatMessage({
    required this.role,
    required this.content,
  });

  factory GigachatMessage.fromJson(Map<String, dynamic> json) {
    return GigachatMessage(
      role: json['role']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }
}

/// Gigachat Usage
class GigachatUsage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  GigachatUsage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory GigachatUsage.fromJson(Map<String, dynamic> json) {
    return GigachatUsage(
      promptTokens: json['prompt_tokens'] ?? 0,
      completionTokens: json['completion_tokens'] ?? 0,
      totalTokens: json['total_tokens'] ?? 0,
    );
  }
}

/// Gigachat Stream Response
class GigachatStreamResponse {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final List<GigachatStreamChoice>? choices;
  final bool isDone;

  GigachatStreamResponse({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.isDone = false,
  });

  factory GigachatStreamResponse.fromJson(Map<String, dynamic> json) {
    return GigachatStreamResponse(
      id: json['id']?.toString(),
      object: json['object']?.toString(),
      created: json['created'],
      model: json['model']?.toString(),
      choices: (json['choices'] as List<dynamic>? ?? [])
          .map((choice) => GigachatStreamChoice.fromJson(choice))
          .toList(),
    );
  }

  factory GigachatStreamResponse.done() {
    return GigachatStreamResponse(isDone: true);
  }
}

/// Gigachat Stream Choice
class GigachatStreamChoice {
  final int index;
  final GigachatStreamDelta delta;
  final String? finishReason;

  GigachatStreamChoice({
    required this.index,
    required this.delta,
    this.finishReason,
  });

  factory GigachatStreamChoice.fromJson(Map<String, dynamic> json) {
    return GigachatStreamChoice(
      index: json['index'] ?? 0,
      delta: GigachatStreamDelta.fromJson(json['delta'] ?? {}),
      finishReason: json['finish_reason']?.toString(),
    );
  }
}

/// Gigachat Stream Delta
class GigachatStreamDelta {
  final String? role;
  final String? content;

  GigachatStreamDelta({
    this.role,
    this.content,
  });

  factory GigachatStreamDelta.fromJson(Map<String, dynamic> json) {
    return GigachatStreamDelta(
      role: json['role']?.toString(),
      content: json['content']?.toString(),
    );
  }
}

/// Gigachat Model
class GigachatModel {
  final String id;
  final String object;
  final int created;
  final String ownedBy;

  GigachatModel({
    required this.id,
    required this.object,
    required this.created,
    required this.ownedBy,
  });

  factory GigachatModel.fromJson(Map<String, dynamic> json) {
    return GigachatModel(
      id: json['id']?.toString() ?? '',
      object: json['object']?.toString() ?? '',
      created: json['created'] ?? 0,
      ownedBy: json['owned_by']?.toString() ?? '',
    );
  }
}

/// Gigachat Session
class GigachatSession {
  final String id;
  final String name;
  final String description;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  GigachatSession({
    required this.id,
    required this.name,
    required this.description,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GigachatSession.fromJson(Map<String, dynamic> json) {
    return GigachatSession(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      metadata: json['metadata'] ?? {},
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }
}

/// Blockchain Analysis
class BlockchainAnalysis {
  final String type;
  final String data;
  final String analysis;
  final double confidence;
  final DateTime timestamp;

  BlockchainAnalysis({
    required this.type,
    required this.data,
    required this.analysis,
    required this.confidence,
    required this.timestamp,
  });
}

/// Trading Insight
class TradingInsight {
  final String asset;
  final String timeframe;
  final String insight;
  final double confidence;
  final DateTime timestamp;

  TradingInsight({
    required this.asset,
    required this.timeframe,
    required this.insight,
    required this.confidence,
    required this.timestamp,
  });
} 