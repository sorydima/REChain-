import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'translation_cache.dart';
import 'translation_provider.dart';

class TranslationService {
  static const String _preferredLanguageKey = 'preferred_language';
  static const String _autoTranslateKey = 'auto_translate_enabled';
  static const String _translationProviderKey = 'translation_provider';
  
  final SharedPreferences _prefs;
  final TranslationCache _cache;
  final Map<TranslationProvider, TranslationClient> _clients = {};
  
  String _preferredLanguage = 'en';
  bool _autoTranslateEnabled = false;
  TranslationProvider _currentProvider = TranslationProvider.google;
  
  final StreamController<TranslationResult> _translationController = 
      StreamController<TranslationResult>.broadcast();
  
  Stream<TranslationResult> get translationStream => _translationController.stream;
  
  TranslationService(this._prefs) : _cache = TranslationCache() {
    _loadSettings();
    _initializeClients();
  }
  
  void _loadSettings() {
    _preferredLanguage = _prefs.getString(_preferredLanguageKey) ?? 'en';
    _autoTranslateEnabled = _prefs.getBool(_autoTranslateKey) ?? false;
    _currentProvider = TranslationProvider.values.firstWhere(
      (p) => p.name == _prefs.getString(_translationProviderKey),
      orElse: () => TranslationProvider.google,
    );
  }
  
  Future<void> _saveSettings() async {
    await _prefs.setString(_preferredLanguageKey, _preferredLanguage);
    await _prefs.setBool(_autoTranslateKey, _autoTranslateEnabled);
    await _prefs.setString(_translationProviderKey, _currentProvider.name);
  }
  
  void _initializeClients() {
    _clients[TranslationProvider.google] = GoogleTranslationClient();
    _clients[TranslationProvider.deepl] = DeepLTranslationClient();
    _clients[TranslationProvider.libre] = LibreTranslationClient();
    _clients[TranslationProvider.microsoft] = MicrosoftTranslationClient();
  }
  
  Future<TranslationResult> translateText(
    String text, {
    String? targetLanguage,
    String? sourceLanguage,
    TranslationProvider? provider,
  }) async {
    final target = targetLanguage ?? _preferredLanguage;
    final translationProvider = provider ?? _currentProvider;
    
    // Check cache first
    final cacheKey = _cache.generateCacheKey(text, target, sourceLanguage);
    final cachedResult = await _cache.getCachedTranslation(cacheKey);
    if (cachedResult != null) {
      _translationController.add(cachedResult);
      return cachedResult;
    }
    
    try {
      final client = _clients[translationProvider];
      if (client == null) {
        throw Exception('Translation provider not available: $translationProvider');
      }
      
      final result = await client.translate(
        text: text,
        targetLanguage: target,
        sourceLanguage: sourceLanguage,
      );
      
      // Cache the result
      await _cache.cacheTranslation(cacheKey, result);
      
      _translationController.add(result);
      return result;
    } catch (e) {
      final errorResult = TranslationResult(
        originalText: text,
        translatedText: text,
        sourceLanguage: sourceLanguage ?? 'unknown',
        targetLanguage: target,
        provider: translationProvider,
        confidence: 0.0,
        error: e.toString(),
        timestamp: DateTime.now(),
      );
      
      _translationController.add(errorResult);
      return errorResult;
    }
  }
  
  Future<List<String>> detectLanguage(String text) async {
    try {
      final client = _clients[_currentProvider];
      if (client == null) return ['unknown'];
      
      return await client.detectLanguage(text);
    } catch (e) {
      Logs().e('Language detection failed: $e');
      return ['unknown'];
    }
  }
  
  Future<List<Language>> getSupportedLanguages({
    TranslationProvider? provider,
  }) async {
    final translationProvider = provider ?? _currentProvider;
    final client = _clients[translationProvider];
    if (client == null) return [];
    
    return await client.getSupportedLanguages();
  }
  
  // Settings
  String get preferredLanguage => _preferredLanguage;
  
  Future<void> setPreferredLanguage(String languageCode) async {
    _preferredLanguage = languageCode;
    await _saveSettings();
  }
  
  bool get autoTranslateEnabled => _autoTranslateEnabled;
  
  Future<void> setAutoTranslateEnabled(bool enabled) async {
    _autoTranslateEnabled = enabled;
    await _saveSettings();
  }
  
  TranslationProvider get currentProvider => _currentProvider;
  
  Future<void> setTranslationProvider(TranslationProvider provider) async {
    _currentProvider = provider;
    await _saveSettings();
  }
  
  // Batch translation for multiple messages
  Future<List<TranslationResult>> translateBatch(
    List<String> texts, {
    String? targetLanguage,
    String? sourceLanguage,
    TranslationProvider? provider,
  }) async {
    final results = <TranslationResult>[];
    
    // Process in chunks to avoid rate limiting
    const chunkSize = 10;
    for (int i = 0; i < texts.length; i += chunkSize) {
      final chunk = texts.skip(i).take(chunkSize).toList();
      final chunkResults = await Future.wait(
        chunk.map((text) => translateText(
          text,
          targetLanguage: targetLanguage,
          sourceLanguage: sourceLanguage,
          provider: provider,
        )),
      );
      results.addAll(chunkResults);
      
      // Small delay to be respectful to APIs
      if (i + chunkSize < texts.length) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
    }
    
    return results;
  }
  
  Future<void> clearExpiredCache() async {
    await _cache.clearExpiredCache();
  }
  
  void dispose() {
    _translationController.close();
    _cache.dispose();
  }
}

class TranslationResult {
  final String originalText;
  final String translatedText;
  final String sourceLanguage;
  final String targetLanguage;
  final TranslationProvider provider;
  final double confidence;
  final String? error;
  final DateTime timestamp;
  final Map<String, dynamic>? metadata;

  const TranslationResult({
    required this.originalText,
    required this.translatedText,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.provider,
    required this.confidence,
    this.error,
    required this.timestamp,
    this.metadata,
  });

  bool get hasError => error != null;
  bool get isHighConfidence => confidence > 0.8;

  Map<String, dynamic> toJson() {
    return {
      'originalText': originalText,
      'translatedText': translatedText,
      'sourceLanguage': sourceLanguage,
      'targetLanguage': targetLanguage,
      'provider': provider.name,
      'confidence': confidence,
      'error': error,
      'timestamp': timestamp.toIso8601String(),
      'metadata': metadata,
    };
  }

  factory TranslationResult.fromJson(Map<String, dynamic> json) {
    return TranslationResult(
      originalText: json['originalText'] as String,
      translatedText: json['translatedText'] as String,
      sourceLanguage: json['sourceLanguage'] as String,
      targetLanguage: json['targetLanguage'] as String,
      provider: TranslationProvider.values.firstWhere(
        (p) => p.name == json['provider'],
        orElse: () => TranslationProvider.google,
      ),
      confidence: json['confidence'] as double,
      error: json['error'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }
}

class Language {
  final String code;
  final String name;
  final String nativeName;
  final bool isSupported;

  const Language({
    required this.code,
    required this.name,
    required this.nativeName,
    this.isSupported = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'nativeName': nativeName,
      'isSupported': isSupported,
    };
  }

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      code: json['code'] as String,
      name: json['name'] as String,
      nativeName: json['nativeName'] as String,
      isSupported: json['isSupported'] as bool? ?? true,
    );
  }

  @override
  String toString() => '$name ($code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Language && other.code == code;
  }

  @override
  int get hashCode => code.hashCode;
}

// Common languages for quick access
class CommonLanguages {
  static const List<Language> popular = [
    Language(code: 'en', name: 'English', nativeName: 'English'),
    Language(code: 'es', name: 'Spanish', nativeName: 'Español'),
    Language(code: 'fr', name: 'French', nativeName: 'Français'),
    Language(code: 'de', name: 'German', nativeName: 'Deutsch'),
    Language(code: 'it', name: 'Italian', nativeName: 'Italiano'),
    Language(code: 'pt', name: 'Portuguese', nativeName: 'Português'),
    Language(code: 'ru', name: 'Russian', nativeName: 'Русский'),
    Language(code: 'ja', name: 'Japanese', nativeName: '日本語'),
    Language(code: 'ko', name: 'Korean', nativeName: '한국어'),
    Language(code: 'zh', name: 'Chinese', nativeName: '中文'),
    Language(code: 'ar', name: 'Arabic', nativeName: 'العربية'),
    Language(code: 'hi', name: 'Hindi', nativeName: 'हिन्दी'),
  ];
}
