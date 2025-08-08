import 'dart:convert';
import 'package:http/http.dart' as http;

class ReplicateService {

  static const String _apiUrl = 'https://api.replicate.com/v1/predictions';
  static const String _modelVersion = 'db21e45d3f48db8231e4e41b6f12a8c1855b4a6e92bc37e5f86237f233d6060e';

  static Future<String?> generateImageFromPrompt(String prompt) async {
    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Authorization': 'Token:',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'version': _modelVersion,
        'input': {
          'prompt': prompt,
          'num_outputs': 1,
          'guidance_scale': 7.5,
          'width': 512,
          'height': 512,
        },
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final predictionId = data['id'];

      // Polling para esperar que se genere la imagen
      while (true) {
        final predictionRes = await http.get(
          Uri.parse('$_apiUrl/$predictionId'),
          headers: {
            'Authorization': 'Token:',
            'Content-Type': 'application/json',
          },
        );

        final predictionData = jsonDecode(predictionRes.body);
        final status = predictionData['status'];

        if (status == 'succeeded') {
          final imageUrl = predictionData['output']?[0];
          return imageUrl;
        } else if (status == 'failed') {
          throw Exception('La generación de imagen falló.');
        }

        await Future.delayed(const Duration(seconds: 2));
      }
    } else {
      throw Exception('Error al crear predicción: ${response.body}');
    }
  }
}
