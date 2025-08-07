import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3)); // muestra el logo por un tiempo

    final prefs = await SharedPreferences.getInstance();
    final onboardingSeen = prefs.getBool('onboarding_seen') ?? false;
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Image(
            image: AssetImage('assets/logos/wink_background.png'),
            height: 120, // Tamaño inicial de la imagen antes de la animación
          ),
        ),
        // child: TweenAnimationBuilder(
        //   tween: Tween<double>(begin: 0.5, end: 6.5), // De tamaño pequeño a tamaño grande
        //   duration: const Duration(seconds: 5), // Duración de la animación
        //   curve: Curves.easeInOut, // Curva para una transición suave
        //   builder: (context, double scale, child) {
        //     return Transform.scale(
        //       scale: scale, // Controlamos el tamaño de la imagen
        //       child: child,
        //     );
        //   },
        //   child: 
        //   const Image(
        //     image: AssetImage('assets/logos/wink_background.png'),
        //     height: 120, // Tamaño inicial de la imagen antes de la animación
        //   ),
        // ),
      //),
    );
  }
}
