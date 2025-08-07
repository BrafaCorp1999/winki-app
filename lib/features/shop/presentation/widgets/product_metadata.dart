import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/brand_title_with_verification_view_model.dart';
import 'package:wink/core/common/view_models/product_price_text_view_model.dart';
import 'package:wink/core/common/view_models/product_title_text_view_model.dart';
import 'package:wink/core/common/view_models/rounded_image_view_model.dart';
import 'package:wink/core/common/widgets/brand_title_with_verification.dart';
import 'package:wink/core/common/widgets/product_price_text.dart';
import 'package:wink/core/common/widgets/product_title_text.dart';
import 'package:wink/core/common/widgets/rounded_image.dart';
import 'package:wink/core/common/widgets/sale_tag.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';

class ProductMetadata extends StatelessWidget {
  const ProductMetadata({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          const SaleTag(
            discountPercentage: 44,
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Text(
            " \$250",
            style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          ProductPriceText(
              productPriceTextModel: ProductPriceTextModel(
            price: "175",
            smallSize: false,
          ))
        ],
      ),
      const SizedBox(
        height: TSizes.spaceBtwItems / 1.5,
      ),
      ProductTitleText(
          productTitleTextModel: ProductTitleTextModel(
        title: "Vestido Midi",
      )),
      const SizedBox(
        height: TSizes.spaceBtwItems / 1.5,
      ),
      Row(
        children: [
          ProductTitleText(
              productTitleTextModel: ProductTitleTextModel(
            title: "Estado",
          )),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Text("Disponible", style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
      const SizedBox(
        height: TSizes.spaceBtwItems / 1.5,
      ),
      // Row(
      //   children: [
      //     RoundedImage(
      //       roundedImageModel: RoundedImageModel(
      //         image: TImages.brownie,
      //         width: 32,
      //         height: 32,
      //         backgroundColor: dark ? TColors.black : TColors.white,
      //         overlayColor: dark ? TColors.white : TColors.black,
      //       ),
      //     ),
      //     const BrandTitleWithVerification(
      //       brandTitleWithVerificationModel:
      //           BrandTitleWithVerificationModel(brandName: "Brownie"),
      //     ),
      //   ],
      // ),
    ]);
  }
}
