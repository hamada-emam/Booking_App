import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  final String txt1, txt2;
  final bool isDark;
  final Function onTap;
  const OrWidget(
      {required this.onTap,
      Key? key,
      this.txt1 = "Already have an account ? ",
      this.txt2 = " Login",
      this.isDark = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: txt1,
                  style: isDark
                      ? getCaptionStyle(
                          fontSize: FontSize.s14, color: Colors.white)
                      : getLightStyle(fontSize: FontSize.s14)),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() {
                      onTap();
                    }),
                  text: txt2,
                  style: isDark
                      ? getRegularStyle(
                          color: ColorManager.primaryColor,
                          fontSize: FontSize.s17)
                      : getLightStyle(
                          fontSize: FontSize.s16,
                        )),
            ])),
      ),
    );
  }
}
