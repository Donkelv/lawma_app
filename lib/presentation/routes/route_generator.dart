import 'package:flutter/material.dart';
import 'package:lawma_app/presentation/screens/bottom_app_bar.dart';
import 'package:lawma_app/presentation/screens/login_screen.dart';
import 'package:lawma_app/presentation/screens/onboarding_screen.dart';
import 'package:lawma_app/presentation/screens/sign_up_screen.dart';

class RouteGenerator {




  static const String onBoardingScreen = '/onBoardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String bottomAppBarScreen = '/bottomAppBarScreen';





  static Route<dynamic>? generateRoute(RouteSettings settings) {


    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case bottomAppBarScreen:
        return MaterialPageRoute(builder: (_) => const BottomAppBarScreeen());
        
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
