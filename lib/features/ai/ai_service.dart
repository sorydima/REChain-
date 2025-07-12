abstract class AIService {
  Future<dynamic> generateText(String prompt, Map<String, dynamic> parameters);
  Future<dynamic> generateCode(String prompt, Map<String, dynamic> parameters);
  Future<dynamic> generateImage(String prompt, Map<String, dynamic> parameters);
  Future<dynamic> analyzeCode(String prompt, Map<String, dynamic> parameters);
  Future<dynamic> debugCode(String prompt, Map<String, dynamic> parameters);
  Future<dynamic> optimizeCode(String prompt, Map<String, dynamic> parameters);
  Future<dynamic> getInsights(String prompt, Map<String, dynamic> parameters);
}

class AIResponse {
  AIResponseType type;
  Map<String, dynamic>? metadata;
  dynamic content;

  AIResponse({
    required this.type,
    this.metadata,
    this.content,
  });
}

enum AIResponseType {
  text,
  code,
  image,
  content,
  chat,
}
