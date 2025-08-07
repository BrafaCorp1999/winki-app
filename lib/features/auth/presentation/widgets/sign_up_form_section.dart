import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quickalert/models/quickalert_type.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wink/core/enums/status.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/core/utils/validators/validation.dart';
import 'package:wink/features/auth/data/models/register_req_body.dart';
import 'package:wink/features/auth/domain/usecases/register_usecase.dart';
import 'package:wink/features/auth/presentation/logic/register/register_cubit.dart';
import 'package:wink/features/auth/presentation/logic/register/register_state.dart';
import 'package:wink/features/auth/presentation/views/login/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wink/features/auth/presentation/views/signup/auth.dart';
import 'package:wink/features/shop/presentation/views/home_view.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';
import 'terms_and_privacy_agreement.dart';
import 'package:wink/features/shop/presentation/views/main_navigation_view.dart';


class SignUpFormSection extends StatefulWidget {
  const SignUpFormSection({super.key});

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final AuthController _authController = AuthController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();

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

  final _auth = FirebaseAuth.instance;
  final auth = AuthController();
  bool showSpinner = true;
  String? selectedCompany;
  List<String> companyList = [];


  void _handleRegistration() {
    _signUp();
      // final registerReqBody = RegisterReqBody(
      //   name:
      //       '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
      //   email: _emailController.text.trim()..toLowerCase(),
      //   password: _passwordController.text.trim(),
      //   confirmPassword: _confirmPasswordController.text.trim(),
      //   address: _addressController.text.trim(),
      //   mobile: _phoneController.text.trim(),
      // );

      // context.read<RegisterCubit>().register(
      //       RegisterParams(registerReqBody: registerReqBody),
      //     );
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {

          _signUp();

         } else if (state.status == RegisterStatus.failure) {
          THelperFunctions.showSnackBar(
              context: context,
              message: state.message,
              type: SnackBarType.error);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Campo Nombre/s es requerido'
                        : null,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.firstName,
                      enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    validator: (value) =>
                        value?.isEmpty ?? true ? 'Campo Apellido/s es requerido' : null,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: TTexts.lastName,
                      enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (value) {
                return TValidator.validateEmail(value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: TTexts.email,
                enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: _phoneController,
              //validator: (value) => TValidator.validatePhoneNumber(value),
              decoration:  InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: TTexts.phoneNo,
                enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              controller: _addressController,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Campo Dirección es requerido' : null,
              decoration:  InputDecoration(
                prefixIcon: Icon(Iconsax.location),
                labelText: 'Direccion',
                enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              //validator: (value) => TValidator.validatePassword(value),
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                labelText: TTexts.password,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: _confirmPasswordController,
              validator: (value) => TValidator.validateConfirmPassword(
                  value, _passwordController),
              obscureText: _obscurePassword,
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
                prefixIcon: Icon(Icons.password),
                labelText: 'Confirmar Contraseña',
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            const TermsAndPrivacyAgreement(),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(100, 158, 143, 47),
      side: const BorderSide(color: Color.fromARGB(100, 158, 143, 47), width: 2), // 👈 Borde blanco
       // 👈 Color del texto e íconos
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
                    onPressed: state.status == RegisterStatus.loading
                        ? null
                        : () {
                          THelperFunctions.hideKeyboard();
                          _handleRegistration();
                        },
                    child: state.status == RegisterStatus.loading
                        ? const Text(TTexts.loading,style: TextStyle(color: Colors.black))
                        : const Text(TTexts.createAccount,style: TextStyle(color: Colors.black),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signUp() async {
    final prefs = await SharedPreferences.getInstance();

      try {
        final user = await auth.registerWithEmailAndPassword(
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
        THelperFunctions.showSnackBar(
              context: context,
              message: "No se pudo registrar al usuario: "+e.toString(),
              type: SnackBarType.success);

        
      }
    } 
  }

