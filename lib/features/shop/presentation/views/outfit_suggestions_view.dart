// ✅ OutfitSuggestionsView.dart (modificado para usar imágenes locales del usuario y generar outfit a partir de una selección específica)

import 'dart:io';
import 'package:flutter/material.dart';
import 'outfit_result_view.dart';

class OutfitSuggestionsView extends StatelessWidget {
  final List<File> selectedImages;
  final String recommendation;

  const OutfitSuggestionsView({
    super.key,
    required this.selectedImages,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    final fondo = const Color.fromARGB(255, 253, 252, 246);
    final colorPrincipal = const Color.fromARGB(100, 158, 143, 47);

    final keywords = ['elegante', 'urbano', 'casual']; // Puedes ajustar por IA real

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text("Sugerencia con IA"),
        backgroundColor: colorPrincipal,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("¿Deseas generar un outfit con IA?",
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => OutfitResultView(
                  //       recommendation: recommendation,
                  //       localImages: selectedImages,
                  //       keywords: keywords,
                  //     ),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorPrincipal,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Generar Outfit con IA",
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
