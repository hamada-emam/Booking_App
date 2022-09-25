import 'package:booking_app/src/features/auth/presentation/views/login_page.dart';
import 'package:booking_app/src/features/auth/presentation/views/signup.dart';
import 'package:booking_app/src/features/booking/presentation/screens/booking_screen.dart';
import 'package:booking_app/src/features/explore_hotels/presentation/screens/explore_screen.dart';
import 'package:booking_app/src/features/filter/presentation/screens/filter_screen.dart';
import 'package:booking_app/src/features/home/home_screen.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/get_started_screen.dart';
import 'package:booking_app/src/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static const String home = '/home';
  static const String getStarted = '/get_started';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String exploreHotels = '/explore_hotels';
  static const String filter = '/filter';
  static const String search = '/search';
  // static const String booking = '/booking';

  static Map<String, WidgetBuilder> get routes {
    return {
      getStarted: (context) => const GetStarted(),
      onboarding: (context) => const OnboardingScreen(),
      login: (context) =>  LoginScreen(),
      signup: (context) =>  SignupScreen(),
      home:(context) => const HomeScreen(),
      exploreHotels: (context) => ExploreScreen(),
      filter: (context) => FilterScreen(),
      search: (context) => SearchScreen(),
      // booking: (context) => BookingScreen(),
    };
  }
}
