import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopSuggestionsView extends StatelessWidget {
  const ShopSuggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Color fondo = const Color.fromARGB(255, 253, 252, 246);
    final Color colorPrincipal = const Color.fromARGB(100, 158, 143, 47);

    final tiendasMock = [
      {
        'nombre': 'Camisa blanca elegante',
        'tienda': 'Zara',
        'url': 'https://www.zara.com/',
      },
      {
        'nombre': 'Pantalón beige casual',
        'tienda': 'Shein',
        'url': 'https://www.shein.com/',
      },
      {
        'nombre': 'Zapatos formales negros',
        'tienda': 'H&M',
        'url': 'https://www2.hm.com/',
      },
    ];

    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: const Text("Sugerencias de Tiendas"),
        backgroundColor: colorPrincipal,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: tiendasMock.length,
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) {
          final t = tiendasMock[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(t['nombre']!),
              subtitle: Text("Tienda: ${t['tienda']}"),
              trailing: const Icon(Icons.open_in_new),
              onTap: () async {
                final url = Uri.parse(t['url']!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("No se pudo abrir el enlace")));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
