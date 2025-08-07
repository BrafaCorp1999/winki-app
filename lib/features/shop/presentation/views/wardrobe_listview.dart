
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/features/shop/presentation/views/outfit_result_view.dart';

class WardrobeListView extends StatelessWidget {
  const WardrobeListView({super.key});

  @override
  Widget build(BuildContext context) {
    final fondo = const Color.fromARGB(255, 253, 252, 246);
    final colorPrincipal = const Color.fromARGB(100, 158, 143, 47);

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text("Mis Prendas"),
        backgroundColor: colorPrincipal,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('wardrobe')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No hay prendas guardadas aún."));
          }

          final prendas = snapshot.data!.docs;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: prendas.length,
                  itemBuilder: (context, index) {
                    final p = prendas[index].data() as Map<String, dynamic>;
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text("${p['type']} - ${p['color']}"),
                        subtitle: Text("${p['type']} combinada con ${p['color']}"),
                        onTap: () {
                          // Elegimos imágenes desde assets en lugar de rutas locales
                          final List<String> defaultImagePaths = [
                            TImages.productImage1,
                            TImages.productImage2,
                            TImages.productImage3
                          ];

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OutfitResultView(
                                recommendation: "Un outfit ideal para salir con estilo.",
                                imagePaths: defaultImagePaths,
                                keywords: [p['type'] ?? '', p['color'] ?? ''],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}