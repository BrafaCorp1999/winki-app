import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/category_tab_view_model.dart';
import 'package:wink/core/common/view_models/grid_layout_view_model.dart';
import 'package:wink/core/common/view_models/section_heading_view_model.dart';
import 'package:wink/core/common/widgets/brand_showcase.dart';
import 'package:wink/core/common/widgets/section_heading.dart';
import 'package:wink/core/common/widgets/vertical_product_card.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/features/auth/presentation/widgets/grid_layout.dart';
import 'package:wink/features/shop/domain/entities/product_entity.dart';

class CategoryTab3 extends StatelessWidget {
  const CategoryTab3({
    super.key,
    required this.categoryTabModel,
  });

  final CategoryTabModel categoryTabModel;

  @override
  Widget build(BuildContext context) {

    const List<String> brandIcons = TImages.brandIcons;
    const List<String> topProducts = TImages.topProducts;
    const List<String> productsImages2 = TImages.productsImages2;
    const List<String> vestidoTitles = TTexts.vestidoTitles;
    const List<String> categories = TTexts.categories;
    
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Check if brandShowcaseModel exists before using it
            // BrandShowcase(
            //   categoryTabModel.brandShowcaseModel,
            // ),
            // const SizedBox(
            //   height: TSizes.spaceBtwItems,
            // ),
            SectionHeading(
              sectionHeadingModel: SectionHeadingModel(
                title: "Productos",
                showActionButton: true,
                actionButtonOnPressed: () {},
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            GridLayout(
              gridLayoutModel: GridLayoutModel(
                // Ensure products list is not null and handle bounds
                itemCount: (categoryTabModel.products.length) > 50
                    ? categoryTabModel.products.length - 50
                    : categoryTabModel.products.length,
                itemBuilder: (context, index) {
                  // Ensure index is within bounds
                  if (index >= 0 && index < categoryTabModel.products.length) {
                    return VerticalProductCard(
                      product: ProductEntity(
                        id: index,
                        title: vestidoTitles[index],
                        price: 100,
                        images: productsImages2,
                        category: "Category $index",
                        description: "Description $index",
                        rating: 4.5,
                        availabilityStatus: "",
                        brand: 
                        index%2==0
                        ?"Brownie"
                        :"The-Are",
                        createdAt: DateTime.now(),
                        discountPercentage: 0,
                        returnPolicy: "Return Policy $index",
                        reviews: const [],
                        shippingInformation: "",
                        stock: 5,
                        tags: const [],
                        thumbnail: "",
                        warrantyInformation: "",
                      ),
                      index: index,
                    );
                  }
                  // Return an empty container if index is out of bounds
                  return Container();
                },
                mainAxisExtent: 280,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ),
    );
  }
}
