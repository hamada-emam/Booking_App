import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/utils/assets_manager.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryManager().init(context);
    return Scaffold(
      body: ShadedBackGround(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQueryManager.screenHeight * 0.2,
            ),
            Image.asset(
              AssetsManager.hotelLogo,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Motel",
                style: getBoldStyle(fontSize: FontSize.s22),
              ),
            ),
            Text(
              "Best hotel deals for your holiday",
              style: getCaptionStyle(fontSize: FontSize.s14),
            ),
            const Spacer(),
            MainButton(
              txt: "Get started",
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.onboarding);
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an account ? ",
                          style: getLightStyle(fontSize: FontSize.s14)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OnboardingScreen(),
                                  ));
                            }),
                          text: " Login",
                          style: getLightStyle(fontSize: FontSize.s16)),
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShadedBackGround extends StatelessWidget {
  final Widget child;
  const ShadedBackGround({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.grey.shade700.withOpacity(0.7), BlendMode.darken),
                image: const AssetImage(AssetsManager.getStartedImage),
                fit: BoxFit.fill)),
        child: child);
  }
}
