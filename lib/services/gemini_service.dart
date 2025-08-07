import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GeminiService {
  static final String? _apiKey = dotenv.env['GEMINI_API_KEY'];

  static Future<String> getOutfitRecommendation(String prompt) async {
    const endpoint =
        'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent';

    final response = await http.post(
      Uri.parse('$endpoint?key=$_apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final content = json['candidates'][0]['content']['parts'][0]['text'];
      return content;
    } else {
      throw Exception('Error API Gemini: ${response.body}');
      
    }
  }
}