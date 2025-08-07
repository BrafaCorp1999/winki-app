import 'package:flutter/material.dart';
import 'package:wink/features/shop/presentation/views/ai_stylist_view.dart';
import 'package:wink/features/shop/presentation/views/all_brands_view.dart';
import 'package:wink/features/shop/presentation/views/ai_stylist_view.dart';
import 'package:wink/features/shop/presentation/views/my_ward_dropview.dart';
import 'package:wink/features/shop/presentation/widgets/quick_access_icon_button.dart';

class NewHomeView extends StatelessWidget {
  const NewHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header con saludo y avatar
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("assets/images/reviews/review_profile_image_2.jpeg"),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome back,", style: TextStyle(fontSize: 14, color: Colors.black54)),
                        Text("Bryan!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Buscador
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search...",
                      icon: Icon(Icons.search, color: Colors.black26),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Banners
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildBanner('assets/images/banners/banner1.png', "Sneakers\nof the week"),
                    const SizedBox(width: 12),
                    _buildBanner('assets/images/banners/banner2.png', "Dress\nof the week"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Accesos Rápidos
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Accesos rápidos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 155,
                
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    QuickAccessIconButton(
                      iconPath: "assets/icons/quick_access/star.png",
                      label: "Wink (IA)",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const AIStylistView()));
                      },
                    ),
                    QuickAccessIconButton(
                      iconPath: "assets/icons/quick_access/heart.png",
                      label: "Favoritos",
                      onPressed: () {},
                    ),
                    QuickAccessIconButton(
                      iconPath: "assets/icons/quick_access/shop.png",
                      label: "Tiendas",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const AllBrandsView()));
                      },
                    ),
                    QuickAccessIconButton(
                      iconPath: "assets/icons/quick_access/search.png",
                      label: "Buscar",
                      onPressed: () {},
                    ),
                    QuickAccessIconButton(
                      iconPath: "assets/icons/quick_access/wardrobe.png",
                      label: "Mi Armario",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>  MyClosetView()));
                      },
                    ),
                    QuickAccessIconButton(
                      iconPath: "assets/icons/quick_access/upload.png",
                      label: "Publicar",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Categorías
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Categorías",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildCategoryCard('assets/images/categories/cat1.png', "ACCESORIES"),
                    const SizedBox(height: 16),
                    _buildCategoryCard('assets/images/categories/cat2.png', "PANTS"),
                    const SizedBox(height: 16),
                    _buildCategoryCard('assets/images/categories/cat3.png', "SHOES"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner(String imagePath, String text) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            imagePath,
            width: 300,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String imagePath, String title) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 100,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.black.withOpacity(0.3),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
