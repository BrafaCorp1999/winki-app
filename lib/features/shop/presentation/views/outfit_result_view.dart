
import 'package:flutter/material.dart';
import 'dynamic_store_view.dart';
import 'package:wink/core/utils/constants/image_strings.dart';

class OutfitResultView extends StatelessWidget {
  final String recommendation;
  final List<String> imagePaths; // puede ser de TImages ahora
  final List<String> keywords;

  const OutfitResultView({
    super.key,
    required this.recommendation,
    required this.imagePaths,
    required this.keywords,
  });

  @override
  Widget build(BuildContext context) {
    final fondo = const Color.fromARGB(255, 253, 252, 246);
    final colorPrincipal = const Color.fromARGB(100, 158, 143, 47);

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text("Tu Outfit Sugerido"),
        backgroundColor: colorPrincipal,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Tu combinación:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              recommendation,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text("Inspiración Visual:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(imagePaths[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DynamicStoreView(keywords: keywords),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorPrincipal,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text("Ver en Tiendas", style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}