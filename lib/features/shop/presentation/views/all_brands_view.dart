import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/app_bar_view_model.dart';
import 'package:wink/core/common/view_models/brand_card_view_model.dart';
import 'package:wink/core/common/view_models/grid_layout_view_model.dart';
import 'package:wink/core/common/view_models/section_heading_view_model.dart';
import 'package:wink/core/common/widgets/app_bar.dart';
import 'package:wink/core/common/widgets/brand_card.dart';
import 'package:wink/core/common/widgets/section_heading.dart';
import 'package:wink/core/enums/status.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/auth/presentation/widgets/grid_layout.dart';
import 'package:wink/features/shop/presentation/views/brand_products_view.dart';
import 'package:wink/features/shop/presentation/views/products_gallery_view.dart';
import 'package:wink/features/shop/presentation/widgets/custom_pill_appbar.dart';

class AllBrandsView extends StatelessWidget {
  const AllBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("TTexts.brandTitles.length: "+TTexts.brandTitles.length.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const CustomPillAppBar(title: "Tiendas"),
              SizedBox(
                height: 140,
                width: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  children: [
                    _buildBanner('assets/images/banners/banner_shop.png', "Famous Brand"),
                   
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GridLayout(
                  gridLayoutModel: GridLayoutModel(
                itemCount: 8,
                mainAxisExtent: 80,
                itemBuilder: (context, index) {
                  return BrandCard(
                    brandCardModel: BrandCardModel(
                      onTap: () {
                      THelperFunctions.navigateToScreen(
                          context,
                          ProductGalleryView(
      brandLogoAsset: "assets/icons/brands/brownie_logo.png",
      productImages: [
        "assets/images/products/product1.png",
        "assets/images/products/product2.png",
        "assets/images/products/product3.png",
        "assets/images/products/product4.png",
        "assets/images/products/product5.png",
        "assets/images/products/product6.png",

        
              //const SortableProducts(),
              ],)
                          //const BrandProductsView(),
                        );
                      

                      },
                      showBorder: true,
                      productCount: TTexts.brandTitles.length,
                      brandName: TTexts.brandTitles[index],
                      image: TImages.brandIcons[index],
                      //image: 'assets/icons/brands/armani.png'
                    ),
                  );
                },
              )),
            ],
          ),
        )),
      ),
    );
  }



   Widget _buildBanner(String imagePath, String text) {
  return Container(
    width: 400,
    height: 150,
    margin: const EdgeInsets.only(right: 5),
    decoration: BoxDecoration(
      color: const Color(0xFF7F7D88), // Fondo gris púrpura
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Stack(
      children: [
        // Modelo (PNG transparente)
        Positioned(
          left: 8,
          bottom: 0,
          top: 0,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: 200,
            height: 170,
          ),
        ),

        // Texto alineado a la derecha
        Positioned(
          left:50,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


}
