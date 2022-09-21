import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String txt;
  final Color color;
  final double borderRadius;
  final Function onPressed;
  final bool isExpanded;
  const MainButton(
      {Key? key,
      required this.txt,
      this.isExpanded=false,
      required this.onPressed,
      this.color = ColorManager.primaryColor,
      this.borderRadius = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: color,
            minimumSize:isExpanded?
             Size(MediaQuery.of(context).size.width *0.8,
                MediaQuery.of(context).size.width / 8): Size(MediaQuery.of(context).size.width / 1.5,
                MediaQuery.of(context).size.width / 8)),
        child: Text(
          txt,
          style: getLightStyle(fontSize: FontSize.s14),
        ),
        onPressed: () async {
          onPressed();
        });
  }
}
