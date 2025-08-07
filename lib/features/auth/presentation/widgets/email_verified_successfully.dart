import 'package:flutter/material.dart';
import 'package:wink/core/common/view_models/success_view_model.dart';
import 'package:wink/core/utils/constants/image_strings.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/core/common/widgets/success_view.dart';
import 'package:wink/features/auth/presentation/views/login/login_view2.dart';
import 'package:wink/features/auth/presentation/views/login/login_view.dart';

class EmailVerifiedSuccessfully extends StatelessWidget {
  const EmailVerifiedSuccessfully({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SuccessView(
      successModel: SuccessModel(
        image: TImages.staticSuccessIllustration,
        title: TTexts.yourAccountCreatedTitle,
        subTitle: TTexts.yourAccountCreatedSubTitle,
        buttonText: TTexts.tContinue,
        onPressed: () {
          THelperFunctions.navigateReplacementToScreen(
              context, const LoginView2());
        },
      ),
    );
  }
}
