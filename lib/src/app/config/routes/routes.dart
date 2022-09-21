import 'package:booking_app/src/features/auth/presentation/views/login_page.dart';
import 'package:booking_app/src/features/auth/presentation/views/signup.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/get_started_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static const String home = '/home';
  static const String getStarted = '/get_started';

  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';

  static Map<String, WidgetBuilder> get routes {
    return {
      getStarted: (context) => const GetStarted(),
    
      onboarding: (context) => const OnboardingScreen(),
      login: (context) => const LoginScreen(),
      signup: (context) => const SignupScreen(),
      
    };
  }
}