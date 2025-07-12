import 'dart:convert';
import 'package:http/http.dart' as http;

import 'translation_service.dart';

enum TranslationProvider {
  google,
  deepl,
  libre,
  microsoft,
}

abstract class TranslationClient {
  Future<TranslationResult> translate({
    required String text,
    required String targetLanguage,
    String? sourceLanguage,
  });
  
  Future<List<String>> detectLanguage(String text);
  Future<List<Language>> getSupportedLanguages();
}

class GoogleTranslationClient implements TranslationClient {
  static const String _baseUrl = 'https://translation.googleapis.com/language/translate/v2';
  final String? _apiKey;
  
  GoogleTranslationClient([this._apiKey]);
  
  @override
  Future<TranslationResult> translate({
    required String text,
    required String targetLanguage,
    String? sourceLanguage,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        body: {
          'q': text,
          'target': targetLanguage,
          if (sourceLanguage != null) 'source': sourceLanguage,
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final translation = data['data']['translations'][0];
        
        return TranslationResult(
          originalText: text,
          translatedText: translation['translatedText'],
          sourceLanguage: translation['detectedSourceLanguage'] ?? sourceLanguage ?? 'unknown',
          targetLanguage: targetLanguage,
          provider: TranslationProvider.google,
          confidence: translation['confidence'] ?? 1.0,
          timestamp: DateTime.now(),
        );
      } else {
        throw Exception('Translation failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Google translation error: $e');
    }
  }
  
  @override
  Future<List<String>> detectLanguage(String text) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/detect?key=$_apiKey'),
        body: {'q': text},
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['data']['detections'] as List)
            .map((d) => d[0]['language'] as String)
            .toList();
      } else {
        throw Exception('Language detection failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Google language detection error: $e');
    }
  }
  
  @override
  Future<List<Language>> getSupportedLanguages() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/languages?key=$_apiKey&target=en'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['data']['languages'] as List)
            .map((l) => Language(
                  code: l['language'],
                  name: l['name'],
                  nativeName: l['name'],
                ))
            .toList();
      } else {
        throw Exception('Failed to get languages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Google languages error: $e');
    }
  }
}

class DeepLTranslationClient implements TranslationClient {
  static const String _baseUrl = 'https://api-free.deepl.com/v2';
  final String? _apiKey;
  
  DeepLTranslationClient([this._apiKey]);
  
  @override
  Future<TranslationResult> translate({
    required String text,
    required String targetLanguage,
    String? sourceLanguage,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/translate'),
        headers: {'Authorization': 'DeepL-Auth-Key $_apiKey'},
        body: {
          'text': text,
          'target_lang': targetLanguage.toUpperCase(),
          if (sourceLanguage != null) 'source_lang': sourceLanguage.toUpperCase(),
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final translation = data['translations'][0];
        
        return TranslationResult(
          originalText: text,
          translatedText: translation['text'],
          sourceLanguage: translation['detected_source_language'].toLowerCase(),
          targetLanguage: targetLanguage,
          provider: TranslationProvider.deepl,
          confidence: 1.0,
          timestamp: DateTime.now(),
        );
      } else {
        throw Exception('Translation failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('DeepL translation error: $e');
    }
  }
  
  @override
  Future<List<String>> detectLanguage(String text) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/translate'),
        headers: {'Authorization': 'DeepL-Auth-Key $_apiKey'},
        body: {
          'text': text,
          'target_lang': 'EN',
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return [data['translations'][0]['detected_source_language'].toLowerCase()];
      } else {
        throw Exception('Language detection failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('DeepL language detection error: $e');
    }
  }
  
  @override
  Future<List<Language>> getSupportedLanguages() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/languages'),
        headers: {'Authorization': 'DeepL-Auth-Key $_apiKey'},
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((l) => Language(
          code: l['language'].toLowerCase(),
          name: l['name'],
          nativeName: l['name'],
        )).toList();
      } else {
        throw Exception('Failed to get languages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('DeepL languages error: $e');
    }
  }
}

class LibreTranslationClient implements TranslationClient {
  static const String _baseUrl = 'https://libretranslate.com/api';
  final String? _apiKey;
  
  LibreTranslationClient([this._apiKey]);
  
  @override
  Future<TranslationResult> translate({
    required String text,
    required String targetLanguage,
    String? sourceLanguage,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/translate'),
        headers: {
          'Content-Type': 'application/json',
          if (_apiKey != null) 'Authorization': 'Bearer $_apiKey',
        },
        body: json.encode({
          'q': text,
          'source': sourceLanguage ?? 'auto',
          'target': targetLanguage,
        }),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        return TranslationResult(
          originalText: text,
          translatedText: data['translatedText'],
          sourceLanguage: sourceLanguage ?? 'auto',
          targetLanguage: targetLanguage,
          provider: TranslationProvider.libre,
          confidence: 1.0,
          timestamp: DateTime.now(),
        );
      } else {
        throw Exception('Translation failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('LibreTranslate error: $e');
    }
  }
  
  @override
  Future<List<String>> detectLanguage(String text) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/detect'),
        headers: {
          'Content-Type': 'application/json',
          if (_apiKey != null) 'Authorization': 'Bearer $_apiKey',
        },
        body: json.encode({'q': text}),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data
            .map((d) => d['language'] as String)
            .toList();
      } else {
        throw Exception('Language detection failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('LibreTranslate detection error: $e');
    }
  }
  
  @override
  Future<List<Language>> getSupportedLanguages() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/languages'),
        headers: {
          if (_apiKey != null) 'Authorization': 'Bearer $_apiKey',
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((l) => Language(
          code: l['code'],
          name: l['name'],
          nativeName: l['name'],
        )).toList();
      } else {
        throw Exception('Failed to get languages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('LibreTranslate languages error: $e');
    }
  }
}

class MicrosoftTranslationClient implements TranslationClient {
  static const String _baseUrl = 'https://api.cognitive.microsofttranslator.com';
  final String? _apiKey;
  final String? _region;
  
  MicrosoftTranslationClient([this._apiKey, this._region]);
  
  @override
  Future<TranslationResult> translate({
    required String text,
    required String targetLanguage,
    String? sourceLanguage,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/translate?api-version=3.0&to=$targetLanguage'),
        headers: {
          'Ocp-Apim-Subscription-Key': _apiKey ?? '',
          'Ocp-Apim-Subscription-Region': _region ?? '',
          'Content-Type': 'application/json',
        },
        body: json.encode([{'text': text}]),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body)[0];
        final translation = data['translations'][0];
        
        return TranslationResult(
          originalText: text,
          translatedText: translation['text'],
          sourceLanguage: data['detectedLanguage']['language'],
          targetLanguage: targetLanguage,
          provider: TranslationProvider.microsoft,
          confidence: data['detectedLanguage']['score'],
          timestamp: DateTime.now(),
        );
      } else {
        throw Exception('Translation failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Microsoft translation error: $e');
    }
  }
  
  @override
  Future<List<String>> detectLanguage(String text) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/detect?api-version=3.0'),
        headers: {
          'Ocp-Apim-Subscription-Key': _apiKey ?? '',
          'Ocp-Apim-Subscription-Region': _region ?? '',
          'Content-Type': 'application/json',
        },
        body: json.encode([{'text': text}]),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((d) => d['language'] as String).toList();
      } else {
        throw Exception('Language detection failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Microsoft detection error: $e');
    }
  }
  
  @override
  Future<List<Language>> getSupportedLanguages() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/languages?api-version=3.0&scope=translation'),
        headers: {
          'Accept-Language': 'en',
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['translation'] as Map<String, dynamic>;
        return data.entries.map((e) => Language(
          code: e.key,
          name: e.value['name'],
          nativeName: e.value['nativeName'],
        )).toList();
      } else {
        throw Exception('Failed to get languages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Microsoft languages error: $e');
    }
  }
}
