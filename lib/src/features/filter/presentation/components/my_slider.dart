import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {

  @override
  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    return Slider(
      activeColor: mainAppColor,
        inactiveColor: mainGreyColor,
        value: exploreCubit.currentDistanceValue,
        onChanged: (newValue) {
          setState(() {
            exploreCubit.currentDistanceValue = newValue;
          });
        },
      min: 1,
      max: 10,
      label: 'Less than ${exploreCubit.currentDistanceValue} Km',
      divisions: 9,
    );
  }
}
