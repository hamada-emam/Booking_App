import 'package:booking_app/src/app/core/utils/assets_manager.dart';
import 'package:booking_app/src/app/core/utils/string_manager.dart';
import 'package:booking_app/src/features/auth/presentation/widgets/autologin_widget.dart';
import 'package:flutter/material.dart';
//facebook & twitter Auth
class AutoAuthWidget extends StatelessWidget {
  const AutoAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AutoLoginWidget(
              color: Colors.blue.shade900,
              icon: AssetsManager.facebookLogo,
              ontap: () {},
              title: StringsManager.facebook),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: AutoLoginWidget(
              color: Colors.lightBlue,
              icon: AssetsManager.twitterLogo,
              ontap: () {},
              title: StringsManager.twitter),
        )
      ],
    );
  }
}
