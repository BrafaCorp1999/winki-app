import 'package:flutter/material.dart';

class ProductGalleryView extends StatelessWidget {
  final String brandLogoAsset;
  final List<String> productImages;

  const ProductGalleryView({
    super.key,
    required this.brandLogoAsset,
    required this.productImages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar personalizado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Botón atrás
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),

                  // Logo centrado
                  Image.asset(
                    brandLogoAsset,
                    height: 30,
                  ),

                  const Spacer(),

                  // Espacio para balancear el botón atrás
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // Opciones: Sort, Filter, View
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _HeaderOption(icon: Icons.sort, label: "Sort"),
                  VerticalDivider(color: Color(0xFFF76C6E)),
                  _HeaderOption(icon: Icons.filter_list, label: "Filter"),
                  VerticalDivider(color: Color(0xFFF76C6E)),
                  _HeaderOption(icon: Icons.grid_view, label: "View"),
                ],
              ),
            ),
            const Divider(),

            // Contador de productos encontrados
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 12),
              child: Text(
                "124 items found",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),

            // Productos
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: productImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.64,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                ),
                itemBuilder: (context, index) {
                  return _ProductCard(imagePath: productImages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeaderOption({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFFF76C6E), size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFFF76C6E)),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String imagePath;

  const _ProductCard({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: 
            Container(
              height:60,
              child:Image.asset(height: 60,imagePath, fit: BoxFit.cover),
            ),
            
          ),
        ),
        const SizedBox(height: 4),
        const Text("Dust Jeans",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        //const Text("Zebra", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Row(
          children: const [
            Text(
              "\$396.00",
              style: TextStyle(
                  color: Color(0xFFF76C6E),
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            SizedBox(width: 8),
            Text(
              "\$498.00",
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Spacer(),
            Icon(Icons.favorite_border, size: 14),
          ],
        )
      ],
    );
  }
}
