import 'package:flutter/material.dart';

import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/utils/assets_manager.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/or_widget.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryManager().init(context);
    return Scaffold(
      body: ShadedBackGround(
        isDark: false, //default Light Mode
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQueryManager.screenHeight * 0.2,
            ),
            Card(
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  fit: BoxFit.contain,
                  AssetsManager.hotelLogo,
                  height: 60,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Motel",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black),
              ),
            ),
            Text(
              "Best hotel deals for your holiday",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade700, shadows: [
                const Shadow(
                  color: Colors.white,
                  blurRadius: 30,
                )
              ]),
            ),
            const Spacer(),
            MainButton(
              txt: "Get started",
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.onboarding);
              },
            ),
            OrWidget(
                isDark: false,
                onTap: () {
                  Navigator.pushNamed(context, Routes.login);
                }),
          ],
        ),
      ),
    );
  }
}

class ShadedBackGround extends StatelessWidget {
  final Widget child;
  final bool isDark;

  const ShadedBackGround({
    required this.child,
    required this.isDark,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: isDark
                    ? ColorFilter.mode(
                        Colors.grey.shade700.withOpacity(0.6), BlendMode.darken)
                    : null,
                image: const AssetImage(AssetsManager.getStartedImage),
                fit: BoxFit.fill)),
        child: child);
  }
}
