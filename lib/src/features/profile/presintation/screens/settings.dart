import 'package:booking_app/src/app/core/helpers/cash_helper.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/features/home/presentation/widgets/profile_widgets/profile_item.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_sharp,
                              color: ColorMangerH.profileIconColor,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Setting",
                            style: getBoldStyle(fontSize: FontSize.s22),
                          ),
                        ),
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
                          },
                        )
                      ]),
                ))));
  }
}
