import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/helpers/cash_helper.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/features/home/presentation/widgets/profile_widgets/profile_item.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/get_started_screen.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_sharp,
                color: ColorMangerH.profileIconColor,
              )),
          title: Text(
            "Setting",
            style: getBoldStyle(fontSize: FontSize.s22),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileItem(
                      title: "Notifications",
                      icon: Icons.notifications,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Theme Mode",
                      icon: Icons.dark_mode,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Fonts",
                      icon: Icons.font_download_sharp,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Color",
                      icon: Icons.color_lens,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Language",
                      icon: Icons.language,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Country",
                      icon: Icons.notifications,
                      text: "Egypt",
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Terms of Services",
                      icon: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Privacy of Policy",
                      icon: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Give Us Feedbacks",
                      icon: Icons.arrow_forward_ios,
                      onTap: () {},
                    ),
                    ProfileItem(
                      title: "Log out",
                      icon: Icons.arrow_forward_ios,
                      onTap: () async {
                        await CashHelper.sharedPreferences!.remove("token");
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.getStarted, (route) => false);
                      },
                    )
                  ]),
            )));
  }
}
