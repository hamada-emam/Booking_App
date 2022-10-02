import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AutoLoginWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;
  final Function ontap;

  const AutoLoginWidget(
      {Key? key,
      required this.color,
      required this.icon,
      required this.ontap,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            backgroundColor: color,
            primary: color,
            shape: StadiumBorder()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 20),
            Text(title,
                style: getRegularStyle(
                  fontSize: FontSize.s16,
                ))
          ],
        ),
        onPressed: () {
          ontap();
        });
  }
}
