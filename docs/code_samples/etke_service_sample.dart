import 'package:rechainonline/features/ai/services/etke_service.dart';

void main() async {
  final etke = EtkeService({'api_key': 'YOUR_ETKE_API_KEY'});
  await etke.initialize();

  final response = await etke.generateText(prompt: 'Hello, world!');
  print('AI response: ${response.content}');
} 