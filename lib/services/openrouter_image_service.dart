import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenRouterImageService {
  static const String _apiKey = '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'; // Reemplaza con tu token real
  static const String _endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  static Future<String?> generateImage(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json',
          'HTTP-Referer': 'https://tudominio.com', // Cambia si subes tu app
          'X-Title': 'WinkApp'
        },
        body: jsonEncode({
          "model": "google/gemini-pro-vision", // También puedes probar: "playground-v2"
          "messages": [
            {
              "role": "user",
              "content":
                  "Generate a realistic fashion outfit image based on the following description: $prompt. Return only the image URL."
            }
          ],
          "temperature": 0.7,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];

        // Extraer URL si viene dentro de texto
        final urlRegex = RegExp(r'(https?:\/\/.*\.(?:png|jpg|jpeg|webp))');
        final match = urlRegex.firstMatch(content);
        final imageUrl = match?.group(0);

        return imageUrl;
      } else {
        print("[❌] OpenRouter error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("[❌] OpenRouter Exception: $e");
      return null;
    }
  }
}
