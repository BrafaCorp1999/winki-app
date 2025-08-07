import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wink/core/enums/status.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/core/utils/validators/validation.dart';
import 'package:wink/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:wink/features/auth/presentation/logic/register/register_state.dart';
import 'package:wink/features/auth/presentation/views/signup/auth.dart';
import 'package:wink/features/auth/presentation/views/login/login_view2.dart';
import 'package:wink/features/auth/presentation/widgets/terms_and_privacy_agreement.dart';
import 'package:wink/features/shop/presentation/views/home_view.dart';
import 'package:wink/features/shop/presentation/views/main_navigation_view.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';

class SignUpFormSectionFStyled extends StatefulWidget {
  const SignUpFormSectionFStyled({super.key});

  @override
  State<SignUpFormSectionFStyled> createState() => _SignUpFormSectionFStyledState();
}

class _SignUpFormSectionFStyledState extends State<SignUpFormSectionFStyled> {
  final _formKey = GlobalKey<FormState>();
  final _authController = AuthController();
  final _auth = FirebaseAuth.instance;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _signUp() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final user = await _authController.registerWithEmailAndPassword(
          _emailController.text, _passwordController.text);

      if (user != null) {
        await _authController.saveClientDetailsToFirestore2(
          user.uid,
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _passwordController.text.trim(),
          _phoneController.text.trim(),
          _emailController.text.trim(),
          "https://firebasestorage.googleapis.com/v0/b/musikme-d7fd7.appspot.com/o/profile_pictures%2Fplaceholder_profile_picture.png?alt=media&token=ed4bcd51-586d-4e9d-ba5d-7bc3d163706c",
          "",
        );
        await prefs.setString('name_user', _emailController.text);
        THelperFunctions.showSnackBar(
            context: context,
            message: "Usuario registrado correctamente",
            type: SnackBarType.success);
        THelperFunctions.navigateReplacementToScreen(context, MainNavigationView());
      }
    } on FirebaseAuthException catch (e) {
     
      // QuickAlert.show(
      //     context: context,
      //     type: QuickAlertType.error,
      //     title: "Error al Registrarse",
      //     text: e.message ?? "Error desconocido");

    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          _signUp();
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
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
            const SizedBox(height: TSizes.spaceBtwInputFields),

            Row(
              children: [
                Expanded(child: _buildTextField(_firstNameController, Iconsax.user, "Username")),
                // const SizedBox(width: TSizes.spaceBtwInputFields),
                // Expanded(child: _buildTextField(_lastNameController, Iconsax.user, TTexts.lastName)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            _buildTextField(_emailController, Icons.mail, "Email", validator: TValidator.validateEmail),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            // _buildTextField(_phoneController, Iconsax.call, TTexts.phoneNo),
            // const SizedBox(height: TSizes.spaceBtwInputFields),
            //_buildTextField(_addressController, Iconsax.location, 'Dirección'),
            //const SizedBox(height: TSizes.spaceBtwInputFields),
            _buildTextField(_passwordController, Icons.password, "Password", isPassword: true),
            // const SizedBox(height: TSizes.spaceBtwInputFields),
            // _buildTextField(_confirmPasswordController, Icons.key, 'Confirmar Contraseña',
            //     isPassword: true,
            //     validator: (value) => TValidator.validateConfirmPassword(value, _passwordController)),
            //const SizedBox(height: TSizes.spaceBtwInputFields),
            //const TermsAndPrivacyAgreement(),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  THelperFunctions.hideKeyboard();
                  if (_formKey.currentState!.validate()) {
                    _signUp();
                  }
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF8836F),
                 
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Register",style: TextStyle(color:Colors.white)),
              ),
                ),
                const SizedBox(height: 16),

              Center(
                  child:  GestureDetector(
                  onTap: () {
                    THelperFunctions.navigateToScreen(
        context,
        const LoginView2(),
      );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Tienes una cuenta? ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black87,
                      ),
                      children: [

                        TextSpan(
                          text: "Login",
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