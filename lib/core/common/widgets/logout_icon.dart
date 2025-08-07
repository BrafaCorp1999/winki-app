import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wink/core/common/view_models/cart_counter_icon_view_model.dart';
import 'package:wink/core/utils/constants/colors.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/auth/presentation/views/login/login_view.dart';
import 'package:wink/features/auth/presentation/views/login/login_view2.dart';

final _auth = FirebaseAuth.instance;

class logoutIcon extends StatelessWidget {
  const logoutIcon({
    super.key,
    required this.cartCounterIconModel,
  });
  final CartCounterIconModel cartCounterIconModel;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: (){
            signOut(context);
          },
          icon: Icon(
            Iconsax.logout,
            color: cartCounterIconModel.color,
          ),
        ),
      //   Positioned(
      //     top: 0,
      //     right: 0,
      //     child: Container(
      //       width: 18,
      //       height: 18,
      //       decoration: const BoxDecoration(
      //         color: TColors.black,
      //         shape: BoxShape.circle,
      //       ),
      //       child: Center(
      //         child: Text(
      //           cartCounterIconModel.count.toString(),
      //           style: Theme.of(context)
      //               .textTheme
      //               .labelLarge!
      //               .apply(color: TColors.white, fontSizeFactor: .8),
      //         ),
      //       ),
      //     ),
      //   ),
       ],
    );
  }

   Future<void> signOut(context) async {
    await _auth.signOut();
    THelperFunctions.navigateToScreen(context, const LoginView2());

  }
}