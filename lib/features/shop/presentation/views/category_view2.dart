import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/app_bar_view_model.dart';
import 'package:wink/core/common/view_models/brand_card_view_model.dart';
import 'package:wink/core/common/widgets/app_bar.dart';
import 'package:wink/core/common/widgets/brand_card.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/features/shop/presentation/widgets/sortable_products.dart';
import 'package:wink/features/shop/presentation/widgets/sortable_products2.dart';

class CategoryView2 extends StatelessWidget {
  const CategoryView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vestidos"),
        backgroundColor: Color.fromARGB(100, 158, 143, 47),
       
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // BrandCard(
              //     brandCardModel: BrandCardModel(
              //         productCount: 4,
              //         showBorder: true,
              //         brandName: "Brownie",
              //         image: TImages.brownie)),
              // const SizedBox(
              //   height: 6,
              // ),
              const SortableProducts2(),
            ],
          ),
        )),
      ),
    );
  }
}
