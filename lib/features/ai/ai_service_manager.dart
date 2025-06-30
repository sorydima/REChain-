import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'openai_service.dart';
import 'anthropic_service.dart';
import 'google_ai_service.dart';
import 'azure_openai_service.dart';
import 'cohere_service.dart';
import 'huggingface_service.dart';
import 'replicate_service.dart';
import 'stability_ai_service.dart';
import 'midjourney_service.dart';
import 'dalle_service.dart';
import 'claude_service.dart';
import 'bard_service.dart';
import 'perplexity_service.dart';
import 'you_service.dart';
import 'phind_service.dart';
import 'poe_service.dart';
import 'character_ai_service.dart';
import 'jasper_service.dart';
import 'copy_ai_service.dart';
import 'writesonic_service.dart';
import 'services/etke_service.dart';

/// AI Service Manager for coordinating multiple AI services
class AIServiceManager {
  static AIServiceManager? _instance;
  static AIServiceManager get instance => _instance ??= AIServiceManager._();

  AIServiceManager._();

  // Core AI Services
  late final OpenAIService _openAI;
  late final AnthropicService _anthropic;
  late final GoogleAIService _googleAI;
  late final AzureOpenAIService _azureOpenAI;
  late final CohereService _cohere;
  late final HuggingFaceService _huggingFace;
  late final ReplicateService _replicate;
  late final StabilityAIService _stabilityAI;
  late final MidjourneyService _midjourney;
  late final DALLEService _dalle;
  late final ClaudeService _claude;
  late final BardService _bard;
  late final PerplexityService _perplexity;
  late final YouService _you;
  late final PhindService _phind;
  late final PoeService _poe;
  late final CharacterAIService _characterAI;
  late final JasperService _jasper;
  late final CopyAIService _copyAI;
  late final WritesonicService _writesonic;
  late final EtkeService _etke;

  // Service status tracking
  final Map<String, bool> _serviceStatus = {};
  final Map<String, String> _serviceErrors = {};
  
  // Configuration
  final Map<String, Map<String, dynamic>> _configurations = {};
  
  // Event streams
  final StreamController<Map<String, bool>> _statusController = 
      StreamController<Map<String, bool>>.broadcast();
  final StreamController<AIResponse> _responseController = 
      StreamController<AIResponse>.broadcast();

  Stream<Map<String, bool>> get statusStream => _statusController.stream;
  Stream<AIResponse> get responseStream => _responseController.stream;

  /// Initialize all AI services
  Future<void> initialize(Map<String, Map<String, dynamic>> configurations) async {
    try {
      _configurations.addAll(configurations);
      
      // Initialize core services
      _openAI = OpenAIService(configurations['openai'] ?? {});
      _anthropic = AnthropicService(configurations['anthropic'] ?? {});
      _googleAI = GoogleAIService(configurations['google_ai'] ?? {});
      _azureOpenAI = AzureOpenAIService(configurations['azure_openai'] ?? {});
      _cohere = CohereService(configurations['cohere'] ?? {});
      _huggingFace = HuggingFaceService(configurations['huggingface'] ?? {});
      _replicate = ReplicateService(configurations['replicate'] ?? {});
      _stabilityAI = StabilityAIService(configurations['stability_ai'] ?? {});
      _midjourney = MidjourneyService(configurations['midjourney'] ?? {});
      _dalle = DALLEService(configurations['dalle'] ?? {});
      _claude = ClaudeService(configurations['claude'] ?? {});
      _bard = BardService(configurations['bard'] ?? {});
      _perplexity = PerplexityService(configurations['perplexity'] ?? {});
      _you = YouService(configurations['you'] ?? {});
      _phind = PhindService(configurations['phind'] ?? {});
      _poe = PoeService(configurations['poe'] ?? {});
      _characterAI = CharacterAIService(configurations['character_ai'] ?? {});
      _jasper = JasperService(configurations['jasper'] ?? {});
      _copyAI = CopyAIService(configurations['copy_ai'] ?? {});
      _writesonic = WritesonicService(configurations['writesonic'] ?? {});
      _etke = EtkeService(configurations['etke'] ?? {});

      // Test all services
      await _testAllServices();
      
      if (kDebugMode) {
        print('[AIServiceManager] Initialized ${_serviceStatus.length} AI services');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[AIServiceManager] Failed to initialize: $e');
      }
      rethrow;
    }
  }

  /// Test all AI services and update status
  Future<void> _testAllServices() async {
    final services = {
      'OpenAI': () => _openAI.testConnection(),
      'Anthropic': () => _anthropic.testConnection(),
      'Google AI': () => _googleAI.testConnection(),
      'Azure OpenAI': () => _azureOpenAI.testConnection(),
      'Cohere': () => _cohere.testConnection(),
      'Hugging Face': () => _huggingFace.testConnection(),
      'Replicate': () => _replicate.testConnection(),
      'Stability AI': () => _stabilityAI.testConnection(),
      'Midjourney': () => _midjourney.testConnection(),
      'DALL-E': () => _dalle.testConnection(),
      'Claude': () => _claude.testConnection(),
      'Bard': () => _bard.testConnection(),
      'Perplexity': () => _perplexity.testConnection(),
      'You': () => _you.testConnection(),
      'Phind': () => _phind.testConnection(),
      'Poe': () => _poe.testConnection(),
      'Character AI': () => _characterAI.testConnection(),
      'Jasper': () => _jasper.testConnection(),
      'Copy AI': () => _copyAI.testConnection(),
      'Writesonic': () => _writesonic.testConnection(),
      'Etke': () => _etke.testConnection(),
    };

    for (final entry in services.entries) {
      try {
        final isAvailable = await entry.value();
        _serviceStatus[entry.key] = isAvailable;
        if (!isAvailable) {
          _serviceErrors[entry.key] = 'Service unavailable';
        }
      } catch (e) {
        _serviceStatus[entry.key] = false;
        _serviceErrors[entry.key] = e.toString();
      }
    }

    _statusController.add(Map.from(_serviceStatus));
  }

  /// Get unified text generation from multiple services
  Future<List<AIResponse>> generateTextMultiService({
    required String prompt,
    List<String> services = const ['OpenAI', 'Claude', 'Google AI'],
    Map<String, dynamic>? parameters,
  }) async {
    final responses = <AIResponse>[];
    
    for (final serviceName in services) {
      if (_serviceStatus[serviceName] == true) {
        try {
          AIResponse? response;
          
          switch (serviceName) {
            case 'OpenAI':
              response = await _openAI.generateText(prompt, parameters);
              break;
            case 'Anthropic':
              response = await _anthropic.generateText(prompt, parameters);
              break;
            case 'Google AI':
              response = await _googleAI.generateText(prompt, parameters);
              break;
            case 'Azure OpenAI':
              response = await _azureOpenAI.generateText(prompt, parameters);
              break;
            case 'Cohere':
              response = await _cohere.generateText(prompt, parameters);
              break;
            case 'Claude':
              response = await _claude.generateText(prompt, parameters);
              break;
            case 'Bard':
              response = await _bard.generateText(prompt, parameters);
              break;
            case 'Perplexity':
              response = await _perplexity.generateText(prompt, parameters);
              break;
            case 'You':
              response = await _you.generateText(prompt, parameters);
              break;
            case 'Phind':
              response = await _phind.generateText(prompt, parameters);
              break;
            case 'Poe':
              response = await _poe.generateText(prompt, parameters);
              break;
            case 'Jasper':
              response = await _jasper.generateText(prompt, parameters);
              break;
            case 'Copy AI':
              response = await _copyAI.generateText(prompt, parameters);
              break;
            case 'Writesonic':
              response = await _writesonic.generateText(prompt, parameters);
              break;
            case 'Etke':
              response = await _etke.generateText(prompt, parameters);
              break;
          }
          
          if (response != null) {
            response.serviceName = serviceName;
            responses.add(response);
            _responseController.add(response);
          }
        } catch (e) {
          if (kDebugMode) {
            print('[AIServiceManager] Error with $serviceName: $e');
          }
        }
      }
    }
    
    return responses;
  }

  /// Get unified image generation from multiple services
  Future<List<AIResponse>> generateImageMultiService({
    required String prompt,
    List<String> services = const ['DALL-E', 'Midjourney', 'Stability AI'],
    Map<String, dynamic>? parameters,
  }) async {
    final responses = <AIResponse>[];
    
    for (final serviceName in services) {
      if (_serviceStatus[serviceName] == true) {
        try {
          AIResponse? response;
          
          switch (serviceName) {
            case 'DALL-E':
              response = await _dalle.generateImage(prompt, parameters);
              break;
            case 'Midjourney':
              response = await _midjourney.generateImage(prompt, parameters);
              break;
            case 'Stability AI':
              response = await _stabilityAI.generateImage(prompt, parameters);
              break;
            case 'Replicate':
              response = await _replicate.generateImage(prompt, parameters);
              break;
            case 'Etke':
              response = await _etke.generateImage(prompt, parameters);
              break;
          }
          
          if (response != null) {
            response.serviceName = serviceName;
            responses.add(response);
            _responseController.add(response);
          }
        } catch (e) {
          if (kDebugMode) {
            print('[AIServiceManager] Error with $serviceName: $e');
          }
        }
      }
    }
    
    return responses;
  }

  /// Get code generation from specialized services
  Future<List<AIResponse>> generateCodeMultiService({
    required String prompt,
    String language = 'dart',
    List<String> services = const ['OpenAI', 'Claude', 'Phind'],
    Map<String, dynamic>? parameters,
  }) async {
    final responses = <AIResponse>[];
    
    for (final serviceName in services) {
      if (_serviceStatus[serviceName] == true) {
        try {
          AIResponse? response;
          final codePrompt = 'Generate $language code for: $prompt';
          
          switch (serviceName) {
            case 'OpenAI':
              response = await _openAI.generateText(codePrompt, parameters);
              break;
            case 'Claude':
              response = await _claude.generateText(codePrompt, parameters);
              break;
            case 'Phind':
              response = await _phind.generateText(codePrompt, parameters);
              break;
            case 'Cohere':
              response = await _cohere.generateText(codePrompt, parameters);
              break;
            case 'Etke':
              response = await _etke.generateCode(
                prompt: prompt,
                language: language,
                parameters: parameters,
              );
              break;
          }
          
          if (response != null) {
            response.serviceName = serviceName;
            response.type = AIResponseType.code;
            response.metadata = {'language': language};
            responses.add(response);
            _responseController.add(response);
          }
        } catch (e) {
          if (kDebugMode) {
            print('[AIServiceManager] Error with $serviceName: $e');
          }
        }
      }
    }
    
    return responses;
  }

  /// Get content writing from specialized services
  Future<List<AIResponse>> generateContentMultiService({
    required String prompt,
    String contentType = 'article',
    List<String> services = const ['Jasper', 'Copy AI', 'Writesonic'],
    Map<String, dynamic>? parameters,
  }) async {
    final responses = <AIResponse>[];
    
    for (final serviceName in services) {
      if (_serviceStatus[serviceName] == true) {
        try {
          AIResponse? response;
          
          switch (serviceName) {
            case 'Jasper':
              response = await _jasper.generateContent(prompt, contentType, parameters);
              break;
            case 'Copy AI':
              response = await _copyAI.generateContent(prompt, contentType, parameters);
              break;
            case 'Writesonic':
              response = await _writesonic.generateContent(prompt, contentType, parameters);
              break;
          }
          
          if (response != null) {
            response.serviceName = serviceName;
            response.type = AIResponseType.content;
            response.metadata = {'contentType': contentType};
            responses.add(response);
            _responseController.add(response);
          }
        } catch (e) {
          if (kDebugMode) {
            print('[AIServiceManager] Error with $serviceName: $e');
          }
        }
      }
    }
    
    return responses;
  }

  /// Get conversation from chat services
  Future<List<AIResponse>> chatMultiService({
    required String message,
    String? conversationId,
    List<String> services = const ['OpenAI', 'Claude', 'Bard'],
    Map<String, dynamic>? parameters,
  }) async {
    final responses = <AIResponse>[];
    
    for (final serviceName in services) {
      if (_serviceStatus[serviceName] == true) {
        try {
          AIResponse? response;
          
          switch (serviceName) {
            case 'OpenAI':
              response = await _openAI.chat(message, conversationId, parameters);
              break;
            case 'Claude':
              response = await _claude.chat(message, conversationId, parameters);
              break;
            case 'Bard':
              response = await _bard.chat(message, conversationId, parameters);
              break;
            case 'Poe':
              response = await _poe.chat(message, conversationId, parameters);
              break;
            case 'Character AI':
              response = await _characterAI.chat(message, conversationId, parameters);
              break;
          }
          
          if (response != null) {
            response.serviceName = serviceName;
            response.type = AIResponseType.chat;
            responses.add(response);
            _responseController.add(response);
          }
        } catch (e) {
          if (kDebugMode) {
            print('[AIServiceManager] Error with $serviceName: $e');
          }
        }
      }
    }
    
    return responses;
  }

  /// Get service status
  Map<String, bool> get serviceStatus => Map.unmodifiable(_serviceStatus);
  
  /// Get service errors
  Map<String, String> get serviceErrors => Map.unmodifiable(_serviceErrors);
  
  /// Get available services
  List<String> get availableServices => 
      _serviceStatus.entries.where((e) => e.value).map((e) => e.key).toList();
  
  /// Get service configuration
  Map<String, dynamic>? getServiceConfig(String serviceName) => 
      _configurations[serviceName.toLowerCase().replaceAll(' ', '_')];

  /// Update service configuration
  Future<void> updateServiceConfig(String serviceName, Map<String, dynamic> config) async {
    final key = serviceName.toLowerCase().replaceAll(' ', '_');
    _configurations[key] = config;
    
    // Reinitialize the specific service
    await _testAllServices();
  }

  /// Get usage statistics
  Future<Map<String, dynamic>> getUsageStats() async {
    final stats = <String, dynamic>{};
    
    for (final serviceName in _serviceStatus.keys) {
      if (_serviceStatus[serviceName] == true) {
        try {
          switch (serviceName) {
            case 'OpenAI':
              stats[serviceName] = await _openAI.getUsageStats();
              break;
            case 'Anthropic':
              stats[serviceName] = await _anthropic.getUsageStats();
              break;
            case 'Google AI':
              stats[serviceName] = await _googleAI.getUsageStats();
              break;
            // Add other services as needed
          }
        } catch (e) {
          stats[serviceName] = {'error': e.toString()};
        }
      }
    }
    
    return stats;
  }

  /// Dispose resources
  void dispose() {
    _statusController.close();
    _responseController.close();
  }

  /// Get service by name
  AIService? getService(String serviceName) {
    switch (serviceName.toLowerCase()) {
      case 'openai':
        return _openAI;
      case 'anthropic':
        return _anthropic;
      case 'google_ai':
        return _googleAI;
      case 'azure_openai':
        return _azureOpenAI;
      case 'cohere':
        return _cohere;
      case 'huggingface':
        return _huggingFace;
      case 'replicate':
        return _replicate;
      case 'stability_ai':
        return _stabilityAI;
      case 'midjourney':
        return _midjourney;
      case 'dalle':
        return _dalle;
      case 'claude':
        return _claude;
      case 'bard':
        return _bard;
      case 'perplexity':
        return _perplexity;
      case 'you':
        return _you;
      case 'phind':
        return _phind;
      case 'poe':
        return _poe;
      case 'character_ai':
        return _characterAI;
      case 'jasper':
        return _jasper;
      case 'copy_ai':
        return _copyAI;
      case 'writesonic':
        return _writesonic;
      case 'etke':
        return _etke;
      default:
        return null;
    }
  }
}

/// AI Response model
class AIResponse {
  final String id;
  final String content;
  final AIResponseType type;
  final DateTime timestamp;
  final Map<String, dynamic> metadata;
  final double? cost;
  final int? tokens;
  String? serviceName;
  String? conversationId;

  AIResponse({
    required this.id,
    required this.content,
    required this.type,
    required this.timestamp,
    this.metadata = const {},
    this.cost,
    this.tokens,
    this.serviceName,
    this.conversationId,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'type': type.toString(),
    'timestamp': timestamp.toIso8601String(),
    'metadata': metadata,
    'cost': cost,
    'tokens': tokens,
    'serviceName': serviceName,
    'conversationId': conversationId,
  };

  factory AIResponse.fromJson(Map<String, dynamic> json) => AIResponse(
    id: json['id'],
    content: json['content'],
    type: AIResponseType.values.firstWhere(
      (e) => e.toString() == json['type'],
    ),
    timestamp: DateTime.parse(json['timestamp']),
    metadata: Map<String, dynamic>.from(json['metadata'] ?? {}),
    cost: json['cost'],
    tokens: json['tokens'],
    serviceName: json['serviceName'],
    conversationId: json['conversationId'],
  );
}

/// AI Response types
enum AIResponseType {
  text,
  image,
  code,
  content,
  chat,
  audio,
  video,
} 