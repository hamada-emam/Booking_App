import 'dart:math';

import 'package:booking_app/src/app/core/helpers/cash_helper.dart';
import 'package:booking_app/src/app/core/utils/assets_manager.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/features/booking/cubit/booking_cubit.dart';
import 'package:booking_app/src/features/booking/presentation/screens/booking_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/core/core.dart';
import '../../data/models/hotel_data.dart';

class HotelItem extends StatelessWidget {
  final HotelData hotelData;
  bool? canEditStatus;
  int? bookingId;

  HotelItem(
      {Key? key,
      required this.hotelData,
      this.canEditStatus = false,
      this.bookingId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BookingScreen(hotelData: hotelData)));
        },
        child: Card(
          elevation: 5,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  hotelData.hotelImages!.isNotEmpty
                      ? Image.network(
                          'http://api.mahmoudtaha.com/images/${hotelData.hotelImages![next(0, hotelData.hotelImages!.length-1)].image}',
                          height: 200,
                          width: MediaQueryManager.screenWidth,
                          fit: BoxFit.cover,
                          // height: 50,
                        )
                      : Image.asset(
                          AssetsManager.hotelImage,
                          height: 210,
                          // width: 380,
                          fit: BoxFit.cover,
                          // height: 50,
                        ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: canEditStatus!
                          ? Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    BookingCubit.get(context)
                                        .updateBookingStatus(
                                      token: CashHelper.getData('token'),
                                      bookingId: bookingId,
                                      statusType: 'cancelled',
                                    );

                                    //update data
                                    BookingCubit.get(context)
                                        .getAllBookingsTypes(
                                      token: CashHelper.getData("token"),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    primary: Colors.white, // <-- Button color
                                    onPrimary: mainAppColor, // <-- Splash color
                                  ),
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    size: 20,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    BookingCubit.get(context)
                                        .updateBookingStatus(
                                      token: CashHelper.getData('token'),
                                      bookingId: bookingId,
                                      statusType: 'completed',
                                    );

                                    //update data
                                    BookingCubit.get(context)
                                        .getAllBookingsTypes(
                                      token: CashHelper.getData("token"),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    primary: Colors.white, // <-- Button color
                                    onPrimary: mainAppColor, // <-- Splash color
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )
                          : ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                primary: Colors.white, // <-- Button color
                                onPrimary: mainAppColor, // <-- Splash color
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                size: 20,
                              ),
                            ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${hotelData.name}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "\$${hotelData.price}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "${hotelData.address}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "/per night",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_sharp,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${hotelData.rate}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  final random = Random();

  int next(int min, int max) => min + random.nextInt(max - min);
}
