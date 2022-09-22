import 'package:booking_app/src/app/core/core.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double currentValue = 5;

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: mainAppColor,
        inactiveColor: mainGreyColor,
        value: currentValue,
        onChanged: (newValue) {
          setState(() {
            currentValue = newValue;
          });
        },
      min: 1,
      max: 10,
      label: 'Less than $currentValue Km',
      divisions: 9,
    );
  }
}
