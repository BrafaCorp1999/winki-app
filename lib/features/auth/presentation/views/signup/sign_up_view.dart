import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:wink/features/auth/presentation/views/signup/sign_up_form_section_fstyled.dart';
import 'package:wink/features/auth/presentation/views/signup/sign_up_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  final Color background = const Color(0xFFF8F8F8);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: background, // fondo crema
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Image.asset(
        //     'assets/logos/wink-background.png',
        //     height: 40,
        //   ),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child:   Image.asset(
            'assets/logos/wink_background.png',
            height: 120,
            width:120
          ),
                  ),
               
                  Text(
                    "Solo regístrate y descubre lo fácil que es transaccionar.",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const SignUpFormSectionFStyled(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class _SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color bgColor;
  final Color textColor;

  const _SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: Icon(icon, color: textColor),
        label: Text(text, style: TextStyle(color: textColor)),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}