import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wink/core/common/widgets/navigation_menu.dart';
import 'package:wink/core/cubits/navigation_menu_cubit/navigation_menu_cubit.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/core/utils/service_locator/service_locator.dart';
import 'package:wink/core/enums/status.dart';
import 'package:wink/features/auth/presentation/views/signup/sign_up_view.dart';
import 'package:wink/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:wink/features/shop/presentation/controller/shop_cubit.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wink/features/shop/presentation/views/main_navigation_view.dart';


class LoginView2 extends StatefulWidget {
  const LoginView2({super.key});

  @override
  State<LoginView2> createState() => _WinkLoginViewState();
}

class _WinkLoginViewState extends State<LoginView2> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      await _auth.signInWithEmailAndPassword(
          email: _usernameController.text.trim(),
          password: _passwordController.text.trim());

      prefs.setString('email', _usernameController.text);

      THelperFunctions.showSnackBar(
        context: context,
        message: "Inicio de sesión correcto",
        type: SnackBarType.success,
      );

      THelperFunctions.navigateReplacementToScreen(context, MainNavigationView());


      // THelperFunctions.navigateReplacementToScreen(
      //     context,
      //     MultiBlocProvider(
      //       providers: [
      //         BlocProvider(
      //           create: (context) => getIt<NavigationMenuCubit>(),
      //         ),
      //         BlocProvider(
      //           create: (context) => getIt<ShopCubit>()
      //             ..getSortedProducts(sortBy: 'rating', sortType: "desc"),
      //         ),
      //       ],
      //       child: const NavigationMenu(),
      //     ),
      //   );
        
    } on FirebaseAuthException catch (e) {
          THelperFunctions.showSnackBar(
              context: context,
              message: "Error. El correo electrónico y/o la contraseña son incorrectos.\nPor favor, revisa tus credenciales y vuelve a intentarlo",
              type: SnackBarType.success);
     
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color coral = const Color(0xFFF8836F);
    final Color winkCoral = const Color(0xFFF8836F);
  
    final Color background = const Color(0xFFF8F8F8);
    final Color textColor = const Color(0xFF333333);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                 Center(
                  child: 
                  Image.asset(
  'assets/logos/wink_background.png',
  height: 150,
  width: 150,
  fit: BoxFit.contain,
),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Welcome Back to\n Mabank Wallet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _SocialButton(
                      text: 'Google',
                      icon: Icons.g_mobiledata,
                      bgColor: Colors.white,
                      textColor: Colors.black,
                    ),
                    const SizedBox(width: 10),
                    _SocialButton(
                      text: 'Facebook',
                      icon: Icons.facebook,
                      bgColor: Colors.blue.shade700,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                              Expanded(child: _buildTextField(_usernameController, Iconsax.user, "Username")),

            const SizedBox(height: TSizes.spaceBtwInputFields),

                        _buildTextField(_passwordController, Icons.password, "Password", isPassword: true),

                
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: winkCoral,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child:  GestureDetector(
                  onTap: () {
                    THelperFunctions.navigateToScreen(
        context,
        const SignUpView(),
      );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Aún no tienes cuenta? ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black87,
                      ),
                      children: [

                        TextSpan(
                          text: "Regístrate",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3A6EA5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildTextField(TextEditingController controller, IconData icon, String label,
      {bool isPassword = false, String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? _obscurePassword : false,
      validator: validator ??
          (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(_obscurePassword ? Iconsax.eye_slash : Iconsax.eye),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
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
