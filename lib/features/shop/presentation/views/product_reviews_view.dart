import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/app_bar_view_model.dart';
import 'package:wink/core/common/widgets/app_bar.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/features/shop/presentation/widgets/custom_rating_bar_indicator.dart';
import 'package:wink/features/shop/presentation/widgets/product_overall_rating.dart';
import 'package:wink/features/shop/presentation/widgets/user_review_card.dart';

class ProductReviewsView extends StatelessWidget {
  const ProductReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appBarModel: AppBarModel(
        hasArrowBack: true,
        title: const Text(
          "Reseñas y Calificación",
        ),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Las reseñas y calificaciones son integradas de personas las cuales ya compraron el producto.",
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const ProductOverallRating(),
                const CustomRatingBarIndicator(
                  rating: 4.5,
                ),
                Text("23", style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const UserReviewCard(),
                // const UserReviewCard(),
                // const UserReviewCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
