import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {

  static const String _endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  static Future<String> getOutfitRecommendation(String prompt) async {
    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Authorization': 'Bearer:',
        'Content-Type': 'application/json',
        'HTTP-Referer': 'https://tudominio.com', // Cambia esto si lo subes a prod
        'X-Title': 'WinkApp'
      },
      body: jsonEncode({
        'model': 'openai/gpt-3.5-turbo',
        'messages': [
          {'role': 'user', 'content': prompt}
        ],
        'temperature': 0.7,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Error al generar texto: ${response.body}');
    }
  }
}
