import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// AI Integration Example
///
/// Demonstrates integration with AI services for:
/// - Message moderation
/// - Translation
/// - Sentiment analysis
/// - Text generation
///
/// Usage:
/// ```dart
/// final ai = AiIntegrationExample(
///   openaiKey: 'YOUR_OPENAI_API_KEY',
/// );
/// final moderation = await ai.moderateMessage('Hello world');
/// ```
class AiIntegrationExample {
  final String? openaiKey;
  final String? anthropicKey;
  final String? deepLKey;
  final String? azureKey;
  final String? azureEndpoint;

  AiIntegrationExample({
    this.openaiKey,
    this.anthropicKey,
    this.deepLKey,
    this.azureKey,
    this.azureEndpoint,
  });

  // ===========================================================================
  // MESSAGE MODERATION
  // ===========================================================================

  /// Check if a message passes moderation using OpenAI
  Future<ModerationResult> moderateMessageOpenAI(String content) async {
    if (openaiKey == null) {
      throw Exception('OpenAI API key not configured');
    }

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/moderations'),
      headers: {
        'Authorization': 'Bearer $openaiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'input': content}),
    );

    if (response.statusCode != 200) {
      throw Exception('Moderation check failed: ${response.statusCode}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final results = data['results'] as List;

    if (results.isEmpty) {
      return ModerationResult(flagged: false, categories: {});
    }

    final result = results[0] as Map<String, dynamic>;
    final categories = result['categories'] as Map<String, dynamic>;

    return ModerationResult(
      flagged: result['flagged'] as bool,
      categories: categories.map(
        (k, v) => MapEntry(k, v as bool),
      ),
    );
  }

  /// Combined moderation check
  Future<ModerationResult> moderateMessage(String content) async {
    // Try OpenAI first, fall back to simple check
    try {
      return await moderateMessageOpenAI(content);
    } catch (e) {
      if (kDebugMode) {
        print('OpenAI moderation failed, using fallback: $e');
      }
      return _simpleModerationCheck(content);
    }
  }

  ModerationResult _simpleModerationCheck(String content) {
    // Simple keyword-based moderation as fallback
    final blocked = <String>[];
    final lowerContent = content.toLowerCase();

    // Add your blocked keywords here
    final blockedKeywords = ['spam', 'scam'];

    for (final keyword in blockedKeywords) {
      if (lowerContent.contains(keyword)) {
        blocked.add(keyword);
      }
    }

    return ModerationResult(
      flagged: blocked.isNotEmpty,
      categories: {'blocked_keywords': blocked.isNotEmpty},
    );
  }

  // ===========================================================================
  // TRANSLATION
  // ===========================================================================

  /// Translate text using DeepL
  Future<String> translateTextDeepL({
    required String text,
    required String targetLanguage,
    String sourceLanguage = 'auto',
  }) async {
    if (deepLKey == null) {
      throw Exception('DeepL API key not configured');
    }

    final response = await http.post(
      Uri.parse('https://api-free.deepl.com/v2/translate'),
      headers: {
        'Authorization': 'DeepL-Auth-Key $deepLKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'text': text,
        'source_lang': _mapLanguageCode(sourceLanguage, 'deepl'),
        'target_lang': _mapLanguageCode(targetLanguage, 'deepl'),
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Translation failed: ${response.body}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final translations = data['translations'] as List;
    return translations[0]['text'] as String;
  }

  /// Detect language of text
  Future<LanguageDetection> detectLanguage(String text) async {
    // Use a simple heuristic or API
    final response = await http.post(
      Uri.parse('https://api-free.deepl.com/v2/detect'),
      headers: {
        'Authorization': 'DeepL-Auth-Key $deepLKey ?? ""',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {'text': text},
    );

    if (response.statusCode != 200) {
      // Fallback to simple detection
      return _detectLanguageSimple(text);
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final languages = data['languages'] as List;
    final detected = languages[0] as Map<String, dynamic>;

    return LanguageDetection(
      language: detected['language'] as String,
      confidence: (detected['confidence'] as num).toDouble(),
    );
  }

  LanguageDetection _detectLanguageSimple(String text) {
    // Simple language detection based on character sets
    final hasCyrillic = RegExp(r'[а-яА-Я]').hasMatch(text);
    final hasChinese = RegExp(r'[\u4e00-\u9fff]').hasMatch(text);
    final hasArabic = RegExp(r'[أ-ي]').hasMatch(text);

    String detected;
    double confidence = 0.5;

    if (hasCyrillic) {
      detected = 'ru';
      confidence = 0.9;
    } else if (hasChinese) {
      detected = 'zh';
      confidence = 0.9;
    } else if (hasArabic) {
      detected = 'ar';
      confidence = 0.8;
    } else {
      detected = 'en';
      confidence = 0.7;
    }

    return LanguageDetection(language: detected, confidence: confidence);
  }

  // ===========================================================================
  // TEXT GENERATION (ChatGPT)
  // ===========================================================================

  /// Generate a response using OpenAI
  Future<String> generateResponse({
    required String prompt,
    String model = 'gpt-4',
    double temperature = 0.7,
    int maxTokens = 500,
  }) async {
    if (openaiKey == null) {
      throw Exception('OpenAI API key not configured');
    }

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $openaiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': model,
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant.'},
          {'role': 'user', 'content': prompt},
        ],
        'temperature': temperature,
        'max_tokens': maxTokens,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('AI generation failed: ${response.body}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final choices = data['choices'] as List;
    final message = choices[0]['message'] as Map<String, dynamic>;
    return message['content'] as String;
  }

  /// Summarize text using AI
  Future<String> summarizeText(String text,
      {int maxLength = 200}) async {
    final prompt = 'Please summarize the following text in $maxLength '
        'characters or less:\n\n$text';

    return generateResponse(
      prompt: prompt,
      maxTokens: maxLength,
      temperature: 0.3,
    );
  }

  /// Extract key points from text
  Future<List<String>> extractKeyPoints(String text,
      {int count = 5}) async {
    final prompt = 'Extract $count key points from the following text. '
        'Return only the points, one per line:\n\n$text';

    final response = await generateResponse(
      prompt: prompt,
      maxTokens: 300,
      temperature: 0.3,
    );

    return response
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .take(count)
        .toList();
  }

  // ===========================================================================
  // SENTIMENT ANALYSIS
  // ===========================================================================

  /// Analyze sentiment of text
  Future<SentimentResult> analyzeSentiment(String text) async {
    if (openaiKey == null) {
      return _simpleSentimentAnalysis(text);
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Authorization': 'Bearer $openaiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'gpt-4',
          'messages': [
            {
              'role': 'system',
              'content':
                  'Analyze the sentiment of the following text. '
                  'Respond with JSON: {"sentiment": "positive|negative|neutral", '
                  '"score": 0.0-1.0, "explanation": "brief reason"}'
            },
            {'role': 'user', 'content': text},
          ],
          'temperature': 0.3,
          'max_tokens': 100,
        }),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final choices = data['choices'] as List;
      final message = choices[0]['message'] as Map<String, dynamic>;
      final content = message['content'] as String;

      // Parse JSON from response
      final jsonMatch = RegExp(r'\{[^}]+\}').firstMatch(content);
      if (jsonMatch != null) {
        final jsonData = jsonDecode(jsonMatch.group(0)!) as Map<String, dynamic>;
        return SentimentResult(
          sentiment: jsonData['sentiment'] as String,
          score: (jsonData['score'] as num).toDouble(),
          explanation: jsonData['explanation'] as String? ?? '',
        );
      }

      return SentimentResult(
        sentiment: 'neutral',
        score: 0.5,
        explanation: 'Could not parse response',
      );
    } catch (e) {
      if (kDebugMode) {
        print('Sentiment analysis failed, using fallback: $e');
      }
      return _simpleSentimentAnalysis(text);
    }
  }

  SentimentResult _simpleSentimentAnalysis(String text) {
    // Simple sentiment analysis based on word lists
    final positiveWords = [
      'good', 'great', 'excellent', 'amazing', 'wonderful', 'fantastic',
      'happy', 'joy', 'love', 'like', 'best', 'awesome', 'beautiful'
    ];
    final negativeWords = [
      'bad', 'terrible', 'awful', 'horrible', 'worst', 'hate', 'sad',
      'angry', 'dislike', 'fail', 'wrong', 'ugly', 'terrible'
    ];

    final lowerText = text.toLowerCase();
    int positiveCount = 0;
    int negativeCount = 0;

    for (final word in positiveWords) {
      if (lowerText.contains(word)) positiveCount++;
    }

    for (final word in negativeWords) {
      if (lowerText.contains(word)) negativeCount++;
    }

    final total = positiveCount + negativeCount;
    if (total == 0) {
      return SentimentResult(
        sentiment: 'neutral',
        score: 0.5,
        explanation: 'No sentiment words detected',
      );
    }

    final positiveRatio = positiveCount / total;
    final score = 0.5 + (positiveRatio - 0.5) * (positiveCount + negativeCount) / 10;

    String sentiment;
    if (positiveRatio > 0.6) {
      sentiment = 'positive';
    } else if (positiveRatio < 0.4) {
      sentiment = 'negative';
    } else {
      sentiment = 'neutral';
    }

    return SentimentResult(
      sentiment: sentiment,
      score: score.clamp(0.0, 1.0),
      explanation: 'Positive: $positiveCount, Negative: $negativeCount',
    );
  }

  // ===========================================================================
  // HELPER METHODS
  // ===========================================================================

  String _mapLanguageCode(String code, String service) {
    final mappings = <String, Map<String, String>>{
      'deepl': {
        'en': 'EN',
        'zh': 'ZH',
        'ru': 'RU',
        'de': 'DE',
        'fr': 'FR',
        'es': 'ES',
        'pt': 'PT',
        'it': 'IT',
        'nl': 'NL',
        'pl': 'PL',
        'ja': 'JA',
        'ko': 'KO',
      },
    };

    final lowerCode = code.toLowerCase();
    return mappings[service]?[lowerCode] ?? code.toUpperCase();
  }
}

// ===========================================================================
// RESULT CLASSES
// ===========================================================================

class ModerationResult {
  final bool flagged;
  final Map<String, bool> categories;

  ModerationResult({required this.flagged, required this.categories});

  bool get isSafe => !flagged;

  bool hasCategory(String category) => categories[category] ?? false;
}

class LanguageDetection {
  final String language;
  final double confidence;

  LanguageDetection({required this.language, required this.confidence});

  String getDisplayName {
    final names = {
      'en': 'English',
      'zh': 'Chinese',
      'ru': 'Russian',
      'de': 'German',
      'fr': 'French',
      'es': 'Spanish',
      'ja': 'Japanese',
      'ko': 'Korean',
      'ar': 'Arabic',
      'pt': 'Portuguese',
      'it': 'Italian',
      'nl': 'Dutch',
      'pl': 'Polish',
    };
    return names[language] ?? language.toUpperCase();
  }
}

class SentimentResult {
  final String sentiment;
  final double score;
  final String explanation;

  SentimentResult({
    required this.sentiment,
    required this.score,
    required this.explanation,
  });

  bool get isPositive => sentiment == 'positive';
  bool get isNegative => sentiment == 'negative';
  bool get isNeutral => sentiment == 'neutral';
}

