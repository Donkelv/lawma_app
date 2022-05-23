import 'package:flutter/material.dart';
import 'package:lawma_app/presentation/screens/onboarding_screen.dart';

class RouteGenerator {




  static const String onBoardingScreen = '/onBoardingScreen';
  static Route<dynamic>? generateRoute(RouteSettings settings) {


    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        
      default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
    }
    
  }
}
