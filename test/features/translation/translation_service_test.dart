import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:rechainonline/features/translation/translation_service.dart';
import 'package:rechainonline/features/translation/translation_provider.dart';
import 'package:rechainonline/features/translation/translation_cache.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockHttpClient extends Mock implements http.Client {}
class MockTranslationCache extends Mock implements TranslationCache {}

void main() {
  late TranslationService translationService;
  late MockSharedPreferences prefs;
  late MockTranslationCache cache;

  setUp(() {
    prefs = MockSharedPreferences();
    cache = MockTranslationCache();
    translationService = TranslationService(prefs);

    when(prefs.getString('preferred_language')).thenReturn('en');
    when(prefs.getBool('auto_translate_enabled')).thenReturn(false);
    when(prefs.getString('translation_provider')).thenReturn('google');
  });

  group('Translation Service Configuration', () {
    test('should initialize with default settings', () {
      expect(translationService.preferredLanguage, equals('en'));
      expect(translationService.autoTranslateEnabled, equals(false));
      expect(translationService.currentProvider, equals(TranslationProvider.google));
    });

    test('should update settings', () async {
      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      when(prefs.setBool(any, any)).thenAnswer((_) => Future.value(true));

      await translationService.setPreferredLanguage('es');
      await translationService.setAutoTranslateEnabled(true);
      await translationService.setTranslationProvider(TranslationProvider.deepl);

      expect(translationService.preferredLanguage, equals('es'));
      expect(translationService.autoTranslateEnabled, equals(true));
      expect(translationService.currentProvider, equals(TranslationProvider.deepl));
    });
  });

  group('Translation Operations', () {
    test('should translate text with caching', () async {
      const text = 'Hello world';
      const targetLang = 'es';

      final cachedResult = TranslationResult(
        originalText: text,
        translatedText: 'Hola mundo',
        sourceLanguage: 'en',
        targetLanguage: targetLang,
        provider: TranslationProvider.google,
        confidence: 1.0,
        timestamp: DateTime.now(),
      );

      when(cache.getCachedTranslation(any)).thenAnswer((_) => Future.value(cachedResult));

      final result = await translationService.translateText(
        text,
        targetLanguage: targetLang,
      );

      expect(result.translatedText, equals('Hola mundo'));
      expect(result.sourceLanguage, equals('en'));
      expect(result.hasError, equals(false));
    });

    test('should handle translation errors', () async {
      const text = 'Hello world';
      const targetLang = 'invalid_lang';

      final result = await translationService.translateText(
        text,
        targetLanguage: targetLang,
      );

      expect(result.hasError, equals(true));
      expect(result.error, isNotNull);
    });

    test('should detect language', () async {
      const text = 'Hello world';

      final detectedLanguages = await translationService.detectLanguage(text);

      expect(detectedLanguages, isNotEmpty);
      expect(detectedLanguages.first, equals('en'));
    });
  });

  group('Batch Translation', () {
    test('should translate multiple texts', () async {
      final texts = [
        'Hello',
        'World',
        'Test',
      ];

      final results = await translationService.translateBatch(
        texts,
        targetLanguage: 'es',
      );

      expect(results.length, equals(texts.length));
      expect(results.every((r) => !r.hasError), true);
    });

    test('should handle batch translation errors', () async {
      final texts = [
        'Hello',
        '', // Invalid empty text
        'Test',
      ];

      final results = await translationService.translateBatch(
        texts,
        targetLanguage: 'es',
      );

      expect(results.length, equals(texts.length));
      expect(results.where((r) => r.hasError).length, equals(1));
    });
  });

  group('Translation Cache', () {
    test('should use cached translations', () async {
      const text = 'Hello world';
      const targetLang = 'es';

      final cachedResult = TranslationResult(
        originalText: text,
        translatedText: 'Hola mundo',
        sourceLanguage: 'en',
        targetLanguage: targetLang,
        provider: TranslationProvider.google,
        confidence: 1.0,
        timestamp: DateTime.now(),
      );

      when(cache.getCachedTranslation(any)).thenAnswer((_) => Future.value(cachedResult));

      final result = await translationService.translateText(
        text,
        targetLanguage: targetLang,
      );

      expect(result.translatedText, equals(cachedResult.translatedText));
      expect(result.timestamp, equals(cachedResult.timestamp));
    });

    test('should cache new translations', () async {
      const text = 'Hello world';
      const targetLang = 'es';

      when(cache.getCachedTranslation(any)).thenAnswer((_) => Future.value(null));
      when(cache.cacheTranslation(any, any)).thenAnswer((_) => Future.value());

      final result = await translationService.translateText(
        text,
        targetLanguage: targetLang,
      );

      verify(cache.cacheTranslation(any, any)).called(1);
    });
  });

  group('Language Support', () {
    test('should get supported languages', () async {
      final languages = await translationService.getSupportedLanguages();

      expect(languages, isNotEmpty);
      expect(languages.first.code, isNotEmpty);
      expect(languages.first.name, isNotEmpty);
    });

    test('should validate language codes', () async {
      final result = await translationService.translateText(
        'Hello',
        targetLanguage: 'invalid_code',
      );

      expect(result.hasError, true);
      expect(result.error, contains('language code'));
    });
  });

  group('Provider Management', () {
    test('should switch providers', () async {
      const text = 'Hello world';

      // Test with Google
      await translationService.setTranslationProvider(TranslationProvider.google);
      var result = await translationService.translateText(text, targetLanguage: 'es');
      expect(result.provider, equals(TranslationProvider.google));

      // Test with DeepL
      await translationService.setTranslationProvider(TranslationProvider.deepl);
      result = await translationService.translateText(text, targetLanguage: 'es');
      expect(result.provider, equals(TranslationProvider.deepl));
    });

    test('should handle provider errors', () async {
      await translationService.setTranslationProvider(TranslationProvider.libre);
      
      final result = await translationService.translateText(
        'Hello',
        targetLanguage: 'es',
      );

      // LibreTranslate requires API key
      expect(result.hasError, true);
      expect(result.error, contains('API key'));
    });
  });

  group('Service Cleanup', () {
    test('should clear cache', () async {
      await translationService.clearCache();
      verify(cache.clearAllCache()).called(1);
    });

    test('should dispose resources', () async {
      await translationService.dispose();
      verify(cache.dispose()).called(1);
    });
  });
}
