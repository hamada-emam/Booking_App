import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:booking_app/src/features/filter/data/models/facilities_model.dart';
import 'package:flutter/material.dart';

class MycheckBox extends StatefulWidget {
  final FacilityData facilityData;

  const MycheckBox({Key? key, required this.facilityData}) : super(key: key);

  @override
  State<MycheckBox> createState() => _MycheckBoxState();
}

class _MycheckBoxState extends State<MycheckBox> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    return Row(
      children: [
        Checkbox(
          activeColor: mainAppColor,
          value: checkedValue,
          onChanged: (newValue) {
            setState(() {
              checkedValue = newValue!;
              if(checkedValue)
                {
                  exploreCubit.facilities.add(widget.facilityData.id);
                }
              else{
                exploreCubit.facilities.remove(widget.facilityData.id);
              }
              debugPrint(exploreCubit.facilities.toString());
            });
          },
        ),
        Text(
          widget.facilityData.name!,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
