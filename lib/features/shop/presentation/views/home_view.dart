import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wink/core/cubits/banner_carousel_slider_cubit_cubit/banner_carousel_slider_cubit.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/shop/presentation/views/ai_stylist_view.dart';
import 'package:wink/features/shop/presentation/views/all_brands_view.dart';
import 'package:wink/features/shop/presentation/views/all_products_view.dart';
import 'package:wink/features/shop/presentation/views/my_ward_dropview.dart';
import 'package:wink/features/shop/presentation/views/quick_access_button.dart';
import 'package:wink/features/shop/presentation/widgets/home_header_section.dart';
import 'package:wink/features/shop/presentation/widgets/promo_banner_carousel_slider.dart';

const Color winkPink = Color(0xFFF5DDD8); // fondo general
const Color winkGold = Color(0xFFD4B170); // botones o detalles
const Color winkBlack = Color(0xFF1E1E1E); // texto, íconos
final Color lightFrenchBeige = const Color(0xFFD0A583); // Fondo principal
final Color bittersweetShimmer = const Color(0xFFBA4353); // Encabezados y elementos destacados
final Color oliveDrabCamouflage = const Color(0xFF54E34); // Botones principales (marrón)
final Color citron = const Color(0xFFAD9F22); // Color secundario/acentos
final _auth = FirebaseAuth.instance;

class HomeViewShimmer extends StatelessWidget {
  const HomeViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Column(
        children: [
          // Header Section Shimmer
          Container(
            height: 60,
            padding: const EdgeInsets.all(TSizes.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Banner Carousel Shimmer
          Container(
            height: 180,
            margin: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Section Heading Shimmer
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  height: 20,
                  color: Colors.white,
                ),
                Container(
                  width: 80,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Accesos rápidos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),

          // Grid Layout Shimmer
          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisSpacing: TSizes.gridViewSpacing,
          //     crossAxisSpacing: TSizes.gridViewSpacing,
          //     mainAxisExtent: 288,
          //   ),
          //   itemCount: 4,
          //   itemBuilder: (_, __) => Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          //     ),
          //     child: Column(
          //       children: [
          //         // Product Image Shimmer
          //         Expanded(
          //           flex: 6,
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius:
          //                   BorderRadius.circular(TSizes.productImageRadius),
          //             ),
          //           ),
          //         ),
          //         // Product Details Shimmer
          //         Expanded(
          //           flex: 4,
          //           child: Padding(
          //             padding: const EdgeInsets.all(TSizes.sm),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   width: double.infinity,
          //                   height: 20,
          //                   color: Colors.white,
          //                 ),
          //                 const SizedBox(height: TSizes.spaceBtwItems / 2),
          //                 Container(
          //                   width: 100,
          //                   height: 16,
          //                   color: Colors.white,
          //                 ),
          //                 const Spacer(),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Container(
          //                       width: 60,
          //                       height: 20,
          //                       color: Colors.white,
          //                     ),
          //                     Container(
          //                       width: 40,
          //                       height: 40,
          //                       decoration: const BoxDecoration(
          //                         color: Colors.white,
          //                         shape: BoxShape.circle,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ottomNavigationBar: NavigationMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeaderSection(),
              const SizedBox(height: TSizes.spaceBtwSections),
              BlocProvider(
                create: (context) => BannerCarouselSliderCubit(),
                child: const PromoBannerCarouselSlider(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Accesos rápidos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Grid con accesos rápidos (sin scroll interno para evitar overflow)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    
                    QuickAccessButton(
                      icon: Icons.auto_awesome,
                      label: "¿Qué me pongo?(IA)",
                      onPressed: (){
                        Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AIStylistView()),
    );
                      },
                    ),
                     QuickAccessButton(
                      icon: Icons.favorite_border,
                      label: "Favoritos",
                      onPressed: (){nextPage();},
                      
                    ),
                     QuickAccessButton(
                      icon: Icons.store,
                      label: "Tiendas",
                      onPressed: (){
                        Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AllBrandsView()),
    );
                      },

                    ),
                     QuickAccessButton(
                      icon: Icons.search,
                      label: "Buscar prenda",
                      onPressed: (){nextPage();},

                    ),
                     QuickAccessButton(
  icon: Icons.checkroom,
  label: "Mi Armario",
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) =>  MyClosetView()),
    );
  },
),
                    QuickAccessButton(
                      icon: Icons.add_photo_alternate,
                      label: "Publicar outfit",
                      onPressed: (){nextPage();},

                    ),
                  ],
                ),
              ),
             
          
            ],
          ),
        ),
      ),
    );
  }
  void nextPage(){

  }
  // Cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
