import 'dart:async';
import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/utils/app_values_manager.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/features/onboarding/presentation/components/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AutoPlayPages extends StatefulWidget {
  const AutoPlayPages({Key? key}) : super(key: key);

  @override
  State<AutoPlayPages> createState() => _AutoPlayPagesState();
}

class _AutoPlayPagesState extends State<AutoPlayPages> {
  Timer? timer;
  int currentPage = 0;

  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(AppValues.slideDuration, (timer) {
      (currentPage < 2) ? currentPage++ : currentPage = 0;
      pageController.animateToPage(currentPage,
          curve: Curves.linear, duration: AppValues.transitionDurataion);
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQueryManager.screenHeight * 0.75,
          child: PageView.builder(
            controller: pageController,
            itemCount: 3,
            itemBuilder: (context, index) => OnboardingItem(index: index),
          ),
        ),
        SmoothPageIndicator(
            effect: const WormEffect(
                dotHeight: 11,
                dotWidth: 11,
                activeDotColor: ColorManager.primaryColor,
                dotColor: Colors.grey),
            controller: pageController,
            count: 3),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: MainButton(
            txt: "Login",
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.login);
            },
            isExpanded: true,
          ),
        ),
        MainButton(
          txt: "Create account",
          txtColor: ColorMangerH.darker,
          color: ColorMangerH.textBoxColor,
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.signup);
          },
          isExpanded: true,
        ),
      ],
    );
  }
}
