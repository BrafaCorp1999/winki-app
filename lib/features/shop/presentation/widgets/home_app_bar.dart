import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/app_bar_view_model.dart';
import 'package:wink/core/common/view_models/cart_counter_icon_view_model.dart';
import 'package:wink/core/common/widgets/app_bar.dart';
import 'package:wink/core/common/widgets/cart_counter_icon.dart';
import 'package:wink/core/common/widgets/logout_icon.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/auth/presentation/views/login/login_view.dart';
import 'package:wink/features/shop/presentation/views/cart_view.dart';
import 'package:wink/features/auth/presentation/views/login/login_view2.dart';

final _auth = FirebaseAuth.instance;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      appBarModel: AppBarModel(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.homeAppbarTitle,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: TColors.grey,
                  ),
            ),
            Text(
              TTexts.homeAppbarSubTitle,
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: TColors.white,
                  ),
            ),
          ],
        ),
        actions: [
          logoutIcon(
            cartCounterIconModel: CartCounterIconModel(
              color: TColors.white,
              onPressed: () {
                _auth.signOut();
                THelperFunctions.navigateToScreen(context, const LoginView2());
              },
            ),
          ),
           //CartCounterIcon(
          //   cartCounterIconModel: CartCounterIconModel(
          //     color: TColors.white,
          //     onPressed: () {
          //       THelperFunctions.navigateToScreen(context, const CartView());
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
