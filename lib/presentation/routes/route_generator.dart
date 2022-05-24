import 'package:flutter/material.dart';
import 'package:lawma_app/presentation/screens/login_screen.dart';
import 'package:lawma_app/presentation/screens/onboarding_screen.dart';

class RouteGenerator {




  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';





  static Route<dynamic>? generateRoute(RouteSettings settings) {


    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        
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
