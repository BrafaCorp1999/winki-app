// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wink/core/utils/helpers/helper_functions.dart';
import 'package:wink/features/auth/presentation/views/login/login_view.dart';
import 'package:wink/features/auth/presentation/views/login/login_view2.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  
  Future<void> _finishOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
      THelperFunctions.navigateReplacementToScreen(context, const LoginView2());
  }

  OnBoardingCubit() : super(OnBoardingInitial());
  final PageController pageController = PageController();
  int currentIndex = 0;
  void dotNavigationClicked(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(OnBoardingUpdateIndicator());
  }

  goToNextPage(BuildContext context) {
    if (currentIndex != 2) {
      currentIndex++;

      pageController.jumpToPage(currentIndex);
      emit(OnBoardingUpdateIndicator());
    } else {
      _finishOnboarding(context);
    
    }
  }

  void updatePageIndicator(int index) {
    currentIndex = index;
    emit(OnBoardingUpdateIndicator());
  }

  void skipPage() {
    currentIndex = 2;
    pageController.jumpToPage(currentIndex);
    emit(OnBoardingUpdateIndicator());
  }
}
