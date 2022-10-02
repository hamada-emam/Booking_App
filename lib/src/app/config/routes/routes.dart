import 'package:booking_app/src/features/auth/presentation/views/login_page.dart';
import 'package:booking_app/src/features/auth/presentation/views/signup.dart';
import 'package:booking_app/src/features/explore/details_page.dart';
import 'package:booking_app/src/features/explore_hotels/presentation/screens/explore_screen.dart';
import 'package:booking_app/src/features/filter/presentation/screens/filter_screen.dart';

import 'package:booking_app/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/get_started_screen.dart';
import 'package:booking_app/src/features/profile/presintation/screens/change_pass.dart';
import 'package:booking_app/src/features/profile/presintation/screens/edit_profile_screen.dart';
import 'package:booking_app/src/features/profile/presintation/screens/helpcenter.dart';
import 'package:booking_app/src/features/profile/presintation/screens/invite_friend.dart';
import 'package:booking_app/src/features/profile/presintation/screens/payment.dart';
import 'package:booking_app/src/features/profile/presintation/screens/settings.dart';

import 'package:booking_app/src/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../../features/home/presentation/views/home_screen.dart';

class Routes {
  static const String home = '/home';
  static const String getStarted = '/get_started';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String exploreHotels = '/explore_hotels';
  static const String filter = '/filter';
  static const String search = '/search';
  static const String editProfile = '/edit_profile';

  static const String changePassword = '/changePassword';
  static const String invitefriend = '/invitefriend';
  static const String helpcenter = '/helpcenter';
  static const String settings = '/settings';
  static const String payment = '/payment';
  static const String details = '/details';
  // static const String booking = '/booking';

  static Map<String, WidgetBuilder> get routes {
    return {
      getStarted: (context) => const GetStarted(),
      onboarding: (context) => const OnboardingScreen(),
      login: (context) => LoginScreen(),
      signup: (context) => SignupScreen(),
      home: (context) => const HomeScreen(),
      exploreHotels: (context) => ExploreScreen(),
      filter: (context) => FilterScreen(),
      search: (context) => SearchScreen(),
      editProfile: (context) => EditProfileScreen(),
      changePassword: (context) => ChangePassword(),
      invitefriend: (context) => const InviteFriend(),
      helpcenter: (context) => const HelpCenter(),
      payment: (context) => const Payment(),
      // booking: (context) => BookingScreen(),
      settings: (context) => const Settings(),
      details: (context) =>  Details(),
    };
  }
}
