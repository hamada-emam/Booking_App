import 'package:booking_app/src/app/core/core.dart';
import 'package:flutter/material.dart';

class MycheckBox extends StatefulWidget {
  final String optionName;

  const MycheckBox({Key? key, required this.optionName}) : super(key: key);

  @override
  State<MycheckBox> createState() => _MycheckBoxState();
}

class _MycheckBoxState extends State<MycheckBox> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: mainAppColor,
          value: checkedValue,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue!;
            });
          },
        ),
        Text(
          widget.optionName,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
