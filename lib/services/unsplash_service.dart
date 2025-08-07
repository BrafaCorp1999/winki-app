import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UnsplashService {
  static final String? _apiKey = dotenv.env['UNSPLASH_API_KEY'];

  static const Map<String, String> _colorTranslations = {
    'blanco': 'white',
    'negro': 'black',
    'rojo': 'red',
    'azul': 'blue',
    'verde': 'green',
    'amarillo': 'yellow',
    'beige': 'beige',
    'gris': 'gray',
    'rosado': 'pink',
    'marrón': 'brown',
  };

  static String _translateColor(String color) {
    return _colorTranslations[color.trim().toLowerCase()] ?? color;
  }

  static Future<List<String>> searchImages({
    required String style,
    required String occasion,
    required String climate,
    String? colorPreference,
  }) async {
    final translatedColors = colorPreference
        ?.split(',')
        .map(_translateColor)
        .join(' ') ?? '';

    final query = "$style outfit $occasion $climate $translatedColors";

    final response = await http.get(
      Uri.parse(
        'https://api.unsplash.com/search/photos?query=$query&per_page=2',
      ),
      headers: {'Authorization': 'Client-ID $_apiKey'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List;
      return results
          .map((img) => img['urls']['regular'] as String)
          .take(2)
          .toList();
    } else {
      throw Exception('Error al buscar imágenes: ${response.body}');
    }
  }
}