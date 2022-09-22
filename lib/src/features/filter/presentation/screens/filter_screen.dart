import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/filter/presentation/components/my_checkbox.dart';
import 'package:booking_app/src/features/filter/presentation/components/my_range_slider.dart';
import 'package:booking_app/src/features/filter/presentation/components/my_slider.dart';
import 'package:booking_app/src/features/filter/presentation/components/my_switch.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      bottomSheet: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[200]!)
        ),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            child: MainButton(onPressed: () {}, txt: 'Apply'),
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
              Text("Price (for 1 night)",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: mainGreyColor)),
              const SizedBox(
                height: 20,
              ),
              const MyRangeSlider(),
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
              // Container(
              //   height: 200,
              //   child: GridView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              //     itemBuilder: (_, index) => MycheckBox(optionName: popularFilterOptions[index]),
              //     itemCount: popularFilterOptions.length,
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        MycheckBox(optionName: 'Free Breakfast'),
                        MycheckBox(optionName: 'Pool'),
                        MycheckBox(optionName: 'Free Wifi'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        MycheckBox(optionName: 'Free Parking'),
                        MycheckBox(optionName: 'Pet Friendly'),
                      ],
                    ),
                  ),
                ],
              ),
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
