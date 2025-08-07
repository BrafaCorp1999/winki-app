import 'dart:convert';
import 'package:http/http.dart' as http;

class HuggingFaceService {
  static const String _endpoint = 'https://stabilityai-stable-diffusion.hf.space/run/predict';

  static Future<String?> generateImageFromPrompt(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "data": [prompt]
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final imageUrl = data["data"]?[0]; // URL a imagen
        return imageUrl;
      } else {
        print("[❌] HuggingFace error: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("[❌] HuggingFace Exception: $e");
      return null;
    }
  }
}
