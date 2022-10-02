import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/string_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';
class OrLogDivider extends StatelessWidget {
  const OrLogDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
          child: Text(
        StringsManager.orLogWith,
        style: getCaptionStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
      )),
    );
  }
}
