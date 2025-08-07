import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/service_locator/service_locator.dart';
import 'package:wink/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:wink/features/auth/presentation/widgets/divider_widget.dart';
import 'package:wink/features/auth/presentation/widgets/login_form_section.dart';
import 'package:wink/features/auth/presentation/widgets/login_header_section.dart';
import 'package:wink/features/auth/presentation/widgets/sign_in_methods_section.dart';


const Color babyPinkUltraLight = Color(0xFFF5DDD8); // Más clarito aún
const Color softGold = Color(0xFFFFD700);
const Color lightFrenchBeige = const Color(0xFFD0A583); // Fondo principal
const Color bittersweetShimmer = const Color(0xFFBA4353); // Encabezados y elementos destacados
const Color oliveDrabCamouflage = const Color(0xFF54E34); // Botones principales (marrón)
const Color citron = const Color(0xFFAD9F22); // Color secundario/acentos
const Color beige = const Color(0xFFF5F5DC);
const Color crema = const Color.fromARGB(1, 253, 252, 246);
const Color crema2 = Color.fromARGB(0, 231, 227, 205);


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const Scaffold(
        body: Scaffold(
          backgroundColor: const Color.fromARGB(255, 253, 252, 246),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: TSizes.paddingWithAppBarHeight,
              child: Column(
                children: [
                  LoginHeaderSection(),
                  LoginFormSection(),
                  // DividerWidget(
                  //   text: TTexts.orSignInWith,
                  // ),
                  // SizedBox(
                  //   height: TSizes.spaceBtwSections,
                  // ),
                  //SignInMethodsSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
