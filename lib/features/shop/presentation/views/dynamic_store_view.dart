import 'package:flutter/material.dart';
import 'package:wink/core/utils/constants/image_strings.dart';

class DynamicStoreView extends StatelessWidget {
  final List<String> keywords;

  const DynamicStoreView({super.key, required this.keywords});

  @override
  Widget build(BuildContext context) {
    final fondo = const Color.fromARGB(255, 253, 252, 246);
    final colorPrincipal = const Color.fromARGB(100, 158, 143, 47);

    // Simulación de productos sugeridos usando imágenes registradas en TImages
    final productos = [
      {
        'imagen': TImages.productImage1,
        'titulo': 'Vestido Floral',
        'precio': '59.99',
        'marca': 'Brownie',
      },
      {
        'imagen': TImages.productImage2,
        'titulo': 'Blusa Elegante',
        'precio': '39.99',
        'marca': 'Zara',
      },
      {
        'imagen': TImages.productImage3,
        'titulo': 'Falda Plisada',
        'precio': '44.99',
        'marca': 'The-Are',
      },
    ];

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text("Productos Sugeridos"),
        backgroundColor: colorPrincipal,
        foregroundColor: Colors.black,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final p = productos[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    p['imagen']!,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p['titulo']!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(p['marca']!, style: const TextStyle(fontSize: 12)),
                      const SizedBox(height: 4),
                      Text("Bs ${p['precio']}"),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}