import 'package:wink/services/replicate_service.dart';
import 'package:wink/services/deepai_service.dart';
import 'package:wink/services/huggingface_service.dart';
import 'package:wink/services/openrouter_image_service.dart';

class ImageGeneratorService {
  static Future<String?> generateImage(String prompt) async {
    String? imageUrl;

    // 1. Replicate
    try {
      print("[🎨] Intentando generar imagen con Replicate...");
      imageUrl = await ReplicateService.generateImageFromPrompt(prompt);
      if (imageUrl != null) {
        print("[✅] Imagen generada por Replicate: $imageUrl");
        return imageUrl;
      }
    } catch (e) {
      print("[⚠️] Replicate falló: $e");
    }

    // 2. DeepAI
    try {
      print("[🛟] Intentando con DeepAI...");
      imageUrl = await DeepAIService.generateImageFromPrompt(prompt);
      if (imageUrl != null) {
        print("[✅] Imagen generada por DeepAI: $imageUrl");
        return imageUrl;
      }
    } catch (e) {
      print("[❌] DeepAI falló: $e");
    }

    // 3. HuggingFace
    try {
      print("[🧪] Intentando con HuggingFace...");
      imageUrl = await HuggingFaceService.generateImageFromPrompt(prompt);
      if (imageUrl != null) {
        print("[✅] Imagen generada por HuggingFace: $imageUrl");
        return imageUrl;
      }
    } catch (e) {
      print("[❌] HuggingFace falló: $e");
    }

    // 4. OpenRouter
    try {
      print("[🚀] Intentando con OpenRouter...");
      imageUrl = await OpenRouterImageService.generateImage(prompt);
      if (imageUrl != null) {
        print("[✅] Imagen generada por OpenRouter: $imageUrl");
        return imageUrl;
      }
    } catch (e) {
      print("[❌] OpenRouter falló: $e");
    }

    print("[❌] No se pudo generar ninguna imagen con IA.");
    return null;
  }
}
