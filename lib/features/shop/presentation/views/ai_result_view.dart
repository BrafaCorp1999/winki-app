import 'package:flutter/material.dart';
import 'package:wink/features/personalization/presentation/views/bag_view.dart';

class AIResultView extends StatelessWidget {
  final String recommendation;
  final List<dynamic> images;

  const AIResultView({
    super.key,
    required this.recommendation,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCF6),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // AppBar personalizada
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF4EDE4),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new, size: 20),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Recomendación Wink",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🌿 Outfit del closet del usuario
            _buildOutfitCard(
              title: "Outfit generado con prendas del closet",
              image: 'assets/images/products/first.png', // Aquí más adelante puede ir una imagen IA generada desde el armario
              description:
                  recommendation,
              borderColor: const Color(0xFFF8836F),
            ),
            const SizedBox(height: 30),

            // 🤖 Outfit generado con IA
            _buildOutfitCard(
              title: "Outfit generado con IA",
              image: images.isNotEmpty ? images[0] : 'assets/images/products/second.png',
              description: recommendation,
              borderColor: const Color(0xFFF8836F),
              isNetwork: images.isNotEmpty,
              extraContent: _buildProductCard(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutfitCard({
    required String title,
    required String image,
    required String description,
    required Color borderColor,
    bool isNetwork = false,
    Widget? extraContent,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        border: Border.all(color: borderColor, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: isNetwork
                ? Image.network(image, width: double.infinity, height: 230, fit: BoxFit.cover)
                : Image.asset(image, width: double.infinity, height: 230, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          if (extraContent != null) ...[
            const SizedBox(height: 20),
            extraContent,
          ]
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset('assets/images/products/product1.png', width: 70, height: 70, fit: BoxFit.cover),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Pull and Deer", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("\$24.90", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {},
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BagView()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF8836F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Añadir a bolsa", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
