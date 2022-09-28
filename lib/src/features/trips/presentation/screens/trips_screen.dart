import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/booking/cubit/booking_states.dart';
import 'package:booking_app/src/features/trips/presentation/widgets/favorites_list.dart';
import 'package:booking_app/src/features/trips/presentation/widgets/finished_list.dart';
import 'package:booking_app/src/features/trips/presentation/widgets/upcoming_list.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/core/helpers/cash_helper.dart';
import '../../../booking/cubit/booking_cubit.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookingCubit = BookingCubit.get(context);
    bookingCubit.getAllBookingsTypes(
      token: CashHelper.getData("token"),
    );
    print("hereeee");

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Trips",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  child: Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: const StadiumBorder(),
                    child: Center(
                      child: TabBar(
                        labelColor: mainAppColor,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: const TextStyle(fontSize: 16.0),
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        tabs: const [
                          Tab(
                            text: "Upcoming",
                          ),
                          Tab(
                            text: "Finished",
                          ),
                          Tab(
                            text: "Cancelled",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    UpcomingBookingsList(),
                    FinishedBookingsList(),
                    CancelledBookingsList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
