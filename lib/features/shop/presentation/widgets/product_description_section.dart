import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wink/core/common/view_models/section_heading_view_model.dart';
//import 'package:wink/core/common/widgets/read_more.dart';
import 'package:wink/core/common/widgets/section_heading.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/shop/presentation/views/product_reviews_view.dart';

class ProductDescriptionAndReviewsSection extends StatelessWidget {
  const ProductDescriptionAndReviewsSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
            sectionHeadingModel: SectionHeadingModel(
                title: "Descripción", showActionButton: false)),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        // const ReadMore(
        //   text:
        //       "Vestido midi con diseño floreado disponible en diferentes colores y tallas, con ",
        // ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        const Divider(),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionHeading(
                sectionHeadingModel: SectionHeadingModel(
              title: "Reseñas(1)",
              showActionButton: false,
            )),
            TextButton(
                onPressed: () {
                  THelperFunctions.navigateToScreen(
                      context, const ProductReviewsView());
                },
                child: const Icon(
                  Iconsax.arrow_right_3,
                  size: 18,
                ))
          ],
        ),
      ],
    );
  }
}
