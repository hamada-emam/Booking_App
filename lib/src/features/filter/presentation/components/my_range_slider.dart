import 'package:booking_app/src/app/core/core.dart';
import 'package:flutter/material.dart';

class MyRangeSlider extends StatefulWidget {
  const MyRangeSlider({Key? key}) : super(key: key);

  @override
  State<MyRangeSlider> createState() => _MyRangeSliderState();
}

class _MyRangeSliderState extends State<MyRangeSlider> {
  var selectedRange = const RangeValues(10, 1000);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      activeColor: mainAppColor,
      inactiveColor: mainGreyColor,
      values: selectedRange,
      onChanged: (RangeValues newRange) {
        setState(() {
          selectedRange = newRange;
        });
      },
      min: 0,
      max: 1000,
      labels: RangeLabels('\$${selectedRange.start}', '\$${selectedRange.end}'),
      divisions: 20,
    );
  }
}
