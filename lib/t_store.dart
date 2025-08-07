import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wink/core/common/widgets/navigation_menu.dart';
import 'package:wink/core/cubits/navigation_menu_cubit/navigation_menu_cubit.dart';
import 'package:wink/core/utils/constants/text_strings.dart';
import 'package:wink/core/utils/service_locator/service_locator.dart';
import 'package:wink/core/utils/theme/theme.dart';
import 'package:wink/features/auth/presentation/logic/on_boarding/on_boarding_cubit.dart';
import 'package:wink/features/auth/presentation/logic/splash_screen.dart';
import 'package:wink/features/auth/presentation/views/login/login_view.dart';
import 'package:wink/features/auth/presentation/views/login/login_view2.dart';
import 'package:wink/features/auth/presentation/views/on_boarding/on_boarding_view.dart';
import 'package:wink/features/shop/presentation/controller/shop_cubit.dart';
import 'package:wink/features/shop/presentation/views/home_view.dart';
import 'package:wink/features/shop/presentation/views/new_home_view.dart';
import 'package:wink/features/shop/presentation/views/main_navigation_view.dart';

class TStore extends StatelessWidget {
  const TStore();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnBoardingCubit>(
          create: (_) => OnBoardingCubit(),
        ),
        BlocProvider<ShopCubit>(
          create: (context) => getIt<ShopCubit>(), // Inicializa si es necesario
        ),
        BlocProvider<NavigationMenuCubit>(
          create: (_) => getIt<NavigationMenuCubit>(),
        ),
        // Agrega otros cubits aquí si los tienes
      ],
      child: MaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashView(),
          '/onboarding': (context) => const OnBoardingView(),
          '/login': (context) => const LoginView2(),
          '/home': (context) => MainNavigationView(),
          
          
        },
      ),
    );
  }
}
