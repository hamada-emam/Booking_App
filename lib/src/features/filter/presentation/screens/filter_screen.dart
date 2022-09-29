import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/explore_hotels/cubit/explore_cubit.dart';
import 'package:booking_app/src/features/filter/presentation/components/my_checkbox.dart';
import 'package:booking_app/src/features/filter/presentation/components/my_range_slider.dart';
import 'package:booking_app/src/features/filter/presentation/components/my_slider.dart';
import 'package:booking_app/src/features/filter/presentation/components/my_switch.dart';
import 'package:flutter/material.dart';

import '../../../../app/core/components/text_form_fields/app_textform_field.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  // List<String> popularFilterOptions = [
  //   'Free Breakfast',
  //   'Free Parking',
  //   'Pool',
  //   'Pet Friendly',
  //   'Free Wifi',
  // ];

  @override
  Widget build(BuildContext context) {
    var exploreCubit = ExploreCubit.get(context);
    exploreCubit.facilities = [];
    return Scaffold(
      bottomSheet: Container(
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.grey[200]!)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            child: MainButton(
              onPressed: () {
                print("${exploreCubit.selectedPriceRange.start is int}");
                print("${exploreCubit.selectedPriceRange.end}");
                Navigator.popAndPushNamed(context, Routes.search);
              },
              txt: 'Apply',
            ),
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Filter",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text("Filter by address",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: mainGreyColor)),
              const SizedBox(
                height: 20,
              ),
              AppTextFormField(
                hintText: 'Enter the address',
                controller: exploreCubit.addressController,
              ),
              const Divider(
                height: 50,
                thickness: 1,
              ),

              Text("Price (for 1 night)",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: mainGreyColor)),
              const SizedBox(
                height: 20,
              ),
              const MyRangeSlider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text('\$${exploreCubit.selectedPriceRange.start.floor()}'),
                    Spacer(),
                    Text('\$${exploreCubit.selectedPriceRange.end.floor()}'),

                  ],
                ),
              ),
              const Divider(
                height: 40,
                thickness: 1,
              ),
              Text(
                "Popular filter",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: mainGreyColor),
              ),
              exploreCubit.allFacilitiesData != null
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 50,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) => MycheckBox(
                          facilityData:
                              exploreCubit.allFacilitiesData!.data[index]),
                      itemCount: ExploreCubit.get(context)
                          .allFacilitiesData!
                          .data
                          .length,
                    )
                  : Container(),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       child: Column(
              //         children: const [
              //           MycheckBox(optionName: 'Free Breakfast'),
              //           MycheckBox(optionName: 'Pool'),
              //           MycheckBox(optionName: 'Free Wifi'),
              //         ],
              //       ),
              //     ),
              //     Expanded(
              //       child: Column(
              //         children: const [
              //           MycheckBox(optionName: 'Free Parking'),
              //           MycheckBox(optionName: 'Pet Friendly'),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),

              const Divider(
                height: 40,
                thickness: 1,
              ),
              Text(
                "Distance from city center",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: mainGreyColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const MySlider(),
              const Divider(
                height: 40,
                thickness: 1,
              ),
              Text(
                "Type of Accommodation",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: mainGreyColor),
              ),
              const MySwitch(optionName: 'All'),
              const Divider(
                // height: 40,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              const MySwitch(optionName: 'Apartment'),
              const MySwitch(optionName: 'Home'),
              const MySwitch(optionName: 'Villa'),
              const MySwitch(optionName: 'Hotel'),
              const MySwitch(optionName: 'Resort'),

              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
