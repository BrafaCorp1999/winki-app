import 'package:flutter/material.dart';
import 'package:wink/features/shop/presentation/view_models/rating_progress_indicator_model.dart';
import 'package:wink/features/shop/presentation/widgets/rating_progress_indicator.dart';

class ProductOverallRating extends StatelessWidget {
  const ProductOverallRating({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "4.8",
           
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(
                progressIndicatorModel: RatingProgressIndicatorModel(
                  text: "5",
                  value: 0.3,
                ),
              ),
              RatingProgressIndicator(
                progressIndicatorModel: RatingProgressIndicatorModel(
                  text: "4",
                  value: 0.2,
                ),
              ),
              RatingProgressIndicator(
                progressIndicatorModel: RatingProgressIndicatorModel(
                  text: "3",
                  value: 0.1,
                ),
              ),
              RatingProgressIndicator(
                progressIndicatorModel: RatingProgressIndicatorModel(
                  text: "2",
                  value: 0.1,
                ),
              ),
              RatingProgressIndicator(
                progressIndicatorModel: RatingProgressIndicatorModel(
                  text: "1",
                  value: 0.1,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
