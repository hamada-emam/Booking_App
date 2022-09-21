import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final int index;
  const OnboardingItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQueryManager.screenHeight * 0.12,
        ),
        Image.asset(
          onboradings[index].img,
          fit: BoxFit.fill,
          height: MediaQueryManager.screenHeight * 0.3,
        ),
        SizedBox(
          height: MediaQueryManager.screenHeight * 0.1,
        ),
        Text(onboradings[index].tit,
            style: getBoldStyle(
              fontSize: FontSize.s22,
            )),
        SizedBox(
          height: MediaQueryManager.screenHeight * 0.03,
        ),
        Text(
          onboradings[index].sub,
          textAlign: TextAlign.center,
          style: getCaptionStyle(
              fontSize: FontSize.s14, color: ColorManager.darkGrey),
        ),
      ],
    );
  }
}
