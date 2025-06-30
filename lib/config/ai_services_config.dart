import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// AI Services Configuration Manager
class AIServicesConfig {
  static AIServicesConfig? _instance;
  static AIServicesConfig get instance => _instance ??= AIServicesConfig._();

  AIServicesConfig._();

  // Configuration storage
  late SharedPreferences _prefs;
  Map<String, Map<String, dynamic>> _configurations = {};

  /// Initialize configuration
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadConfigurations();
  }

  /// Get all service configurations
  Map<String, Map<String, dynamic>> get configurations => Map.unmodifiable(_configurations);

  /// Get configuration for a specific service
  Map<String, dynamic>? getServiceConfig(String serviceName) {
    final key = serviceName.toLowerCase().replaceAll(' ', '_');
    return _configurations[key];
  }

  /// Update service configuration
  Future<void> updateServiceConfig(String serviceName, Map<String, dynamic> config) async {
    final key = serviceName.toLowerCase().replaceAll(' ', '_');
    _configurations[key] = config;
    await _saveConfigurations();
  }

  /// Get default configurations for all services
  Map<String, Map<String, dynamic>> getDefaultConfigurations() {
    return {
      // Core AI Services
      'openai': {
        'api_key': '',
        'base_url': 'https://api.openai.com/v1',
        'organization': '',
        'enabled': false,
        'models': {
          'text': ['gpt-4', 'gpt-3.5-turbo', 'gpt-4-turbo'],
          'image': ['dall-e-3', 'dall-e-2'],
          'audio': ['whisper-1'],
        },
        'default_model': 'gpt-4',
        'max_tokens': 1000,
        'temperature': 0.7,
        'cost_per_1k_tokens': {
          'gpt-4': {'input': 0.03, 'output': 0.06},
          'gpt-3.5-turbo': {'input': 0.0015, 'output': 0.002},
        },
      },
      'anthropic': {
        'api_key': '',
        'base_url': 'https://api.anthropic.com/v1',
        'enabled': false,
        'models': {
          'text': ['claude-3-opus-20240229', 'claude-3-sonnet-20240229', 'claude-3-haiku-20240307'],
        },
        'default_model': 'claude-3-sonnet-20240229',
        'max_tokens': 1000,
        'temperature': 0.7,
        'cost_per_1k_tokens': {
          'claude-3-opus-20240229': {'input': 0.015, 'output': 0.075},
          'claude-3-sonnet-20240229': {'input': 0.003, 'output': 0.015},
          'claude-3-haiku-20240307': {'input': 0.00025, 'output': 0.00125},
        },
      },
      'google_ai': {
        'api_key': '',
        'base_url': 'https://generativelanguage.googleapis.com/v1beta',
        'enabled': false,
        'models': {
          'text': ['gemini-pro', 'gemini-pro-vision'],
        },
        'default_model': 'gemini-pro',
        'max_tokens': 1000,
        'temperature': 0.7,
        'cost_per_1k_tokens': {
          'gemini-pro': {'input': 0.0005, 'output': 0.0005},
        },
      },
      'azure_openai': {
        'api_key': '',
        'endpoint': '',
        'deployment_name': 'gpt-4',
        'api_version': '2024-02-15-preview',
        'enabled': false,
        'models': {
          'text': ['gpt-4', 'gpt-3.5-turbo'],
          'image': ['dall-e-3'],
        },
        'default_model': 'gpt-4',
        'max_tokens': 1000,
        'temperature': 0.7,
      },
      'cohere': {
        'api_key': '',
        'base_url': 'https://api.cohere.ai/v1',
        'enabled': false,
        'models': {
          'text': ['command', 'command-light'],
          'embedding': ['embed-english-v3.0'],
        },
        'default_model': 'command',
        'max_tokens': 1000,
        'temperature': 0.7,
        'cost_per_1k_tokens': {
          'command': {'input': 0.0015, 'output': 0.002},
          'command-light': {'input': 0.0005, 'output': 0.0005},
        },
      },
      'huggingface': {
        'api_key': '',
        'base_url': 'https://api-inference.huggingface.co/models',
        'enabled': false,
        'models': {
          'text': ['gpt2', 'distilgpt2'],
          'image': ['runwayml/stable-diffusion-v1-5'],
          'embedding': ['sentence-transformers/all-MiniLM-L6-v2'],
        },
        'default_model': 'gpt2',
        'max_tokens': 100,
        'temperature': 0.7,
        'cost_per_1k_tokens': {
          'free': {'input': 0.0, 'output': 0.0},
        },
      },
      'replicate': {
        'api_key': '',
        'base_url': 'https://api.replicate.com/v1',
        'enabled': false,
        'models': {
          'text': ['meta/llama-2-70b-chat:02e509c789964a7ea8736978a43525956ef40397be9033abf9fd2badfe68c813'],
          'image': ['stability-ai/stable-diffusion:db21e45d3f7023abc2a46ee38a23973f6dce16bb082a930b0c49861f96d1e5bf'],
        },
        'default_model': 'meta/llama-2-70b-chat:02e509c789964a7ea8736978a43525956ef40397be9033abf9fd2badfe68c813',
        'max_tokens': 1000,
        'temperature': 0.7,
        'cost_per_image': 0.02,
      },
      'stability_ai': {
        'api_key': '',
        'base_url': 'https://api.stability.ai/v1',
        'enabled': false,
        'models': {
          'image': ['stable-diffusion-xl-1024-v1-0', 'stable-diffusion-v1-6'],
          'upscale': ['esrgan-v1-x2plus'],
        },
        'default_model': 'stable-diffusion-xl-1024-v1-0',
        'steps': 30,
        'cfg_scale': 7.0,
        'cost_per_image': 0.02,
      },
      'midjourney': {
        'api_key': '',
        'base_url': 'https://api.midjourney.com/v1',
        'enabled': false,
        'models': {
          'image': ['v6'],
        },
        'default_model': 'v6',
        'aspect_ratio': '1:1',
        'quality': 'standard',
        'cost_per_image': 0.10,
      },
      'dalle': {
        'api_key': '',
        'base_url': 'https://api.openai.com/v1',
        'enabled': false,
        'models': {
          'image': ['dall-e-3', 'dall-e-2'],
        },
        'default_model': 'dall-e-3',
        'size': '1024x1024',
        'quality': 'standard',
        'cost_per_image': 0.04,
      },
      'claude': {
        'api_key': '',
        'base_url': 'https://api.anthropic.com/v1',
        'enabled': false,
        'models': {
          'text': ['claude-3-opus-20240229', 'claude-3-sonnet-20240229'],
        },
        'default_model': 'claude-3-sonnet-20240229',
        'max_tokens': 1000,
        'temperature': 0.7,
      },
      'bard': {
        'api_key': '',
        'base_url': 'https://generativelanguage.googleapis.com/v1beta',
        'enabled': false,
        'models': {
          'text': ['gemini-pro'],
        },
        'default_model': 'gemini-pro',
        'max_tokens': 1000,
        'temperature': 0.7,
      },
      'perplexity': {
        'api_key': '',
        'base_url': 'https://api.perplexity.ai/v1',
        'enabled': false,
        'models': {
          'text': ['pplx-70b-online', 'pplx-7b-online'],
        },
        'default_model': 'pplx-70b-online',
        'max_tokens': 1000,
        'temperature': 0.7,
      },
      'you': {
        'api_key': '',
        'base_url': 'https://api.you.com/v1',
        'enabled': false,
        'models': {
          'text': ['you-model'],
        },
        'default_model': 'you-model',
        'max_tokens': 1000,
        'temperature': 0.7,
      },
      'phind': {
        'api_key': '',
        'base_url': 'https://api.phind.com/v1',
        'enabled': false,
        'models': {
          'text': ['phind-model'],
        },
        'default_model': 'phind-model',
        'max_tokens': 1000,
        'temperature': 0.7,
      },
      'poe': {
        'api_key': '',
        'base_url': 'https://api.poe.com/v1',
        'enabled': false,
        'models': {
          'text': ['poe-model'],
        },
        'default_model': 'poe-model',
        'max_tokens': 1000,
        'temperature': 0.7,
      },
      'character_ai': {
        'api_key': '',
        'base_url': 'https://beta.character.ai/api',
        'enabled': false,
        'models': {
          'chat': ['character-model'],
        },
        'default_model': 'character-model',
        'character_id': '',
      },
      'jasper': {
        'api_key': '',
        'base_url': 'https://api.jasper.ai/v1',
        'enabled': false,
        'models': {
          'content': ['jasper-template'],
        },
        'default_model': 'jasper-template',
        'template_id': '',
      },
      'copy_ai': {
        'api_key': '',
        'base_url': 'https://api.copy.ai/v1',
        'enabled': false,
        'models': {
          'content': ['copy-template'],
        },
        'default_model': 'copy-template',
        'template_id': '',
      },
      'writesonic': {
        'api_key': '',
        'base_url': 'https://api.writesonic.com/v2/business/content',
        'enabled': false,
        'models': {
          'content': ['writesonic-template'],
        },
        'default_model': 'writesonic-template',
        'template_id': '',
      },
      'etke': {
        'api_key': '',
        'base_url': 'https://api.etke.cc/v1',
        'enabled': false,
        'models': {
          'text': ['etke-gpt-4', 'etke-gpt-3.5', 'etke-claude'],
          'code': ['etke-coder', 'etke-debugger', 'etke-optimizer'],
          'image': ['etke-dalle', 'etke-stable-diffusion'],
          'analysis': ['etke-analyzer', 'etke-insights'],
        },
        'default_model': 'etke-gpt-4',
        'max_tokens': 2000,
        'temperature': 0.7,
        'cost_per_1k_tokens': {
          'etke-gpt-4': {'input': 0.002, 'output': 0.004},
          'etke-gpt-3.5': {'input': 0.001, 'output': 0.002},
          'etke-claude': {'input': 0.003, 'output': 0.015},
        },
        'cost_per_image': {
          'etke-dalle': 0.04,
          'etke-stable-diffusion': 0.02,
        },
      },
    };
  }

  /// Load configurations from storage
  Future<void> _loadConfigurations() async {
    try {
      final configJson = _prefs.getString('ai_services_config');
      if (configJson != null) {
        final config = jsonDecode(configJson) as Map<String, dynamic>;
        _configurations = Map<String, Map<String, dynamic>>.from(config);
      } else {
        // Load default configurations
        _configurations = getDefaultConfigurations();
        await _saveConfigurations();
      }
    } catch (e) {
      if (kDebugMode) {
        print('[AIServicesConfig] Failed to load configurations: $e');
      }
      _configurations = getDefaultConfigurations();
    }
  }

  /// Save configurations to storage
  Future<void> _saveConfigurations() async {
    try {
      final configJson = jsonEncode(_configurations);
      await _prefs.setString('ai_services_config', configJson);
    } catch (e) {
      if (kDebugMode) {
        print('[AIServicesConfig] Failed to save configurations: $e');
      }
    }
  }

  /// Reset configurations to defaults
  Future<void> resetToDefaults() async {
    _configurations = getDefaultConfigurations();
    await _saveConfigurations();
  }

  /// Export configurations
  Future<String> exportConfigurations() async {
    return jsonEncode(_configurations);
  }

  /// Import configurations
  Future<void> importConfigurations(String configJson) async {
    try {
      final config = jsonDecode(configJson) as Map<String, dynamic>;
      _configurations = Map<String, Map<String, dynamic>>.from(config);
      await _saveConfigurations();
    } catch (e) {
      if (kDebugMode) {
        print('[AIServicesConfig] Failed to import configurations: $e');
      }
      rethrow;
    }
  }

  /// Get enabled services
  List<String> get enabledServices {
    return _configurations.entries
        .where((entry) => entry.value['enabled'] == true)
        .map((entry) => entry.key)
        .toList();
  }

  /// Get service status
  Map<String, bool> get serviceStatus {
    return Map.fromEntries(
      _configurations.entries.map(
        (entry) => MapEntry(entry.key, entry.value['enabled'] == true),
      ),
    );
  }

  /// Validate API key format
  bool validateApiKey(String serviceName, String apiKey) {
    if (apiKey.isEmpty) return false;
    
    switch (serviceName.toLowerCase()) {
      case 'openai':
      case 'azure_openai':
      case 'dalle':
        return apiKey.startsWith('sk-') && apiKey.length > 20;
      case 'anthropic':
      case 'claude':
        return apiKey.startsWith('sk-ant-') && apiKey.length > 20;
      case 'google_ai':
      case 'bard':
        return apiKey.length > 20;
      case 'cohere':
        return apiKey.length > 20;
      case 'huggingface':
        return apiKey.startsWith('hf_') && apiKey.length > 20;
      case 'replicate':
        return apiKey.startsWith('r8_') && apiKey.length > 20;
      case 'stability_ai':
        return apiKey.length > 20;
      case 'midjourney':
        return apiKey.length > 20;
      default:
        return apiKey.length > 10;
    }
  }

  /// Get service documentation URL
  String getServiceDocsUrl(String serviceName) {
    switch (serviceName.toLowerCase()) {
      case 'openai':
        return 'https://platform.openai.com/docs/api-reference';
      case 'anthropic':
        return 'https://docs.anthropic.com/claude/reference';
      case 'google_ai':
        return 'https://ai.google.dev/docs';
      case 'azure_openai':
        return 'https://learn.microsoft.com/en-us/azure/ai-services/openai/reference';
      case 'cohere':
        return 'https://docs.cohere.com/reference';
      case 'huggingface':
        return 'https://huggingface.co/docs/api-inference';
      case 'replicate':
        return 'https://replicate.com/docs/reference/http';
      case 'stability_ai':
        return 'https://platform.stability.ai/docs/api-reference';
      case 'midjourney':
        return 'https://docs.midjourney.com/';
      case 'perplexity':
        return 'https://docs.perplexity.ai/';
      case 'you':
        return 'https://docs.you.com/';
      case 'phind':
        return 'https://docs.phind.com/';
      case 'poe':
        return 'https://docs.poe.com/';
      case 'character_ai':
        return 'https://docs.character.ai/';
      case 'jasper':
        return 'https://docs.jasper.ai/';
      case 'copy_ai':
        return 'https://docs.copy.ai/';
      case 'writesonic':
        return 'https://docs.writesonic.com/';
      default:
        return 'https://example.com/docs';
    }
  }

  /// Get service pricing URL
  String getServicePricingUrl(String serviceName) {
    switch (serviceName.toLowerCase()) {
      case 'openai':
        return 'https://openai.com/pricing';
      case 'anthropic':
        return 'https://www.anthropic.com/pricing';
      case 'google_ai':
        return 'https://ai.google.dev/pricing';
      case 'azure_openai':
        return 'https://azure.microsoft.com/en-us/pricing/details/cognitive-services/openai-service/';
      case 'cohere':
        return 'https://cohere.com/pricing';
      case 'huggingface':
        return 'https://huggingface.co/pricing';
      case 'replicate':
        return 'https://replicate.com/pricing';
      case 'stability_ai':
        return 'https://platform.stability.ai/pricing';
      case 'midjourney':
        return 'https://www.midjourney.com/pricing/';
      case 'perplexity':
        return 'https://www.perplexity.ai/pricing';
      case 'you':
        return 'https://you.com/pricing';
      case 'phind':
        return 'https://www.phind.com/pricing';
      case 'poe':
        return 'https://poe.com/pricing';
      case 'character_ai':
        return 'https://character.ai/pricing';
      case 'jasper':
        return 'https://www.jasper.ai/pricing';
      case 'copy_ai':
        return 'https://www.copy.ai/pricing';
      case 'writesonic':
        return 'https://writesonic.com/pricing';
      default:
        return 'https://example.com/pricing';
    }
  }
} 