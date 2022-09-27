import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/features/onboarding/presentation/components/autoplay_pages.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MediaQueryManager().init(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQueryManager.screenWidth * 0.1),
          child: const AutoPlayPages(),
        ));
  }
}
