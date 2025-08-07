import 'dart:convert';
import 'package:http/http.dart' as http;

class DeepAIService {
  static const String _apiKey = 'a2331955-0931-4cbc-bf95-75980d9f2a31'; // Reemplaza aquí

  static Future<String?> generateImageFromPrompt(String prompt) async {
    final response = await http.post(
      Uri.parse('https://api.deepai.org/api/text2img'),
      headers: {'Api-Key': _apiKey},
      body: {'text': prompt},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['output_url'];
    } else {
      print("[❌] DeepAI error: ${response.statusCode} - ${response.body}");
      return null;
    }
  }
}
