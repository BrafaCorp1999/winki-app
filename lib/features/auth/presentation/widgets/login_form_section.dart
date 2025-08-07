import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wink/core/common/widgets/navigation_menu.dart';
import 'package:wink/core/cubits/navigation_menu_cubit/navigation_menu_cubit.dart';
import 'package:wink/core/enums/status.dart';
import 'package:wink/core/utils/constants/sizes.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/core/utils/service_locator/service_locator.dart';
import 'package:wink/features/auth/data/models/login_req_body.dart';
import 'package:wink/features/auth/domain/usecases/login_usecase.dart';
import 'package:wink/features/auth/presentation/logic/login/login_cubit.dart';
import 'package:wink/features/auth/presentation/logic/login/login_state.dart';
import 'package:wink/features/auth/presentation/views/password_configuration/forget_password_view.dart';
import 'package:wink/features/auth/presentation/views/signup/sign_up_view.dart';
import 'package:wink/features/shop/presentation/controller/shop_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wink/features/shop/presentation/views/home_view.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = true;
  final _auth = FirebaseAuth.instance;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      
     // if(_emailController.text.trim()=="wink_1@gmail.com" && _passwordController.text.trim()=="12345678"){

         THelperFunctions.showSnackBar(
            context: context,
            message: "Inicio de sesión correcto",
            type: SnackBarType.success,
          );

          THelperFunctions.navigateReplacementToScreen(
            context,
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<NavigationMenuCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<ShopCubit>()
                    ..getSortedProducts(sortBy: 'rating', sortType: "desc"),
                ),
              ],
              child: const NavigationMenu(),
            ),
          );
  //     }
  //     else{
  //        ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text("Credenciales Incorrectas"),
  //     duration: Duration(seconds: 3),
  //   ),
  // );
  //   }
      
      // final loginReqBody = LoginReqBody(
      //   phoneEmail: _emailController.text.trim(),
      //   password: _passwordController.text.trim(),
      // );

      // context.read<LoginCubit>().login(LoginParms(loginReqBody: loginReqBody));
    }
  }


  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();

      try {
          await _auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
            
        prefs.setString('email', _emailController.text);

        THelperFunctions.showSnackBar(
          context: context,
          message: "Inicio de sesión correcto",
          type: SnackBarType.success,
        );

        THelperFunctions.navigateReplacementToScreen(
          context,
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<NavigationMenuCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ShopCubit>()
                  ..getSortedProducts(sortBy: 'rating', sortType: "desc"),
              ),
            ],
            child: const NavigationMenu(),
          ),
        );
            } on FirebaseAuthException catch (e) {

      //   showAlert(QuickAlertType.error,
      //       "El correo electrónico y/o la contraseña son incorrectos.\nPor favor, revisa tus credenciales y vuelve a intentarlo.");


       }
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          login();
        } else if (state.status == LoginStatus.failure) {
          THelperFunctions.showSnackBar(
            context: context,
            message: state.message,
            type: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.mail),
                    labelText: TTexts.email,
                    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: Color.fromARGB(100, 158, 143, 47),
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? true;
                            });
                          },
                        ),
                        const Text(TTexts.rememberMe),
                      ],
                    ),
                   
                  ],
                ), 
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                        onPressed: () {
                          THelperFunctions.navigateToScreen(
                            context,
                            const ForgetPasswordView(),
                          );
                        },
                        child: const Text(TTexts.forgetPassword, style: TextStyle(color: Colors.black),),
                      ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(100, 158, 143, 47),
      side: const BorderSide(color: Color.fromARGB(100, 158, 143, 47), width: 2), // 👈 Borde blanco
      // 👈 Color del texto e íconos
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
                    //child: const Text("Iniciar Sesión"),
                    // onPressed: () {
                    //   _handleLogin();
                    // }, 
                    onPressed: state.status == LoginStatus.loading
                        ? null
                        : () {
                             THelperFunctions.hideKeyboard();
                            //_handleLogin();
                            login();
                          },
                    child: state.status == LoginStatus.loading
                        ? const Text(TTexts.loading,style: TextStyle(color: Colors.black),)
                        : const Text(TTexts.signIn,style: TextStyle(color: Colors.black),),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
  width: double.infinity,
  child: OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.black, width: 2), // 👈 Borde blanco
       // 👈 Color del texto e íconos
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
    onPressed: () {
      THelperFunctions.navigateToScreen(
        context,
        const SignUpView(),
      );
    },
    child: const Text(TTexts.createAccount),
  ),
),

              ],
            ),
          ),
        );
      },
    );
  }
}
