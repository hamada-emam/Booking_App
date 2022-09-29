import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';

class MyRangeSlider extends StatefulWidget {
  const MyRangeSlider({Key? key}) : super(key: key);

  @override
  State<MyRangeSlider> createState() => _MyRangeSliderState();
}

class _MyRangeSliderState extends State<MyRangeSlider> {

  @override
  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    return RangeSlider(
      activeColor: mainAppColor,
      inactiveColor: mainGreyColor,
      values: exploreCubit.selectedPriceRange,
      onChanged: (RangeValues newRange) {
        setState(() {
          exploreCubit.selectedPriceRange = newRange;
        });
      },
      min: 0,
      max: 500,
      labels: RangeLabels('\$${exploreCubit.selectedPriceRange.start}', '\$${exploreCubit.selectedPriceRange.end}'),
      divisions: 50,
    );
  }
}
