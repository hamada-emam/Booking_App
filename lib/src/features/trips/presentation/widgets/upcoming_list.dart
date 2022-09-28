import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/app/core/helpers/cash_helper.dart';
import 'package:booking_app/src/features/booking/cubit/booking_cubit.dart';
import 'package:booking_app/src/features/booking/cubit/booking_states.dart';
import 'package:booking_app/src/features/explore_hotels/presentation/components/hotel_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingBookingsList extends StatelessWidget {
  const UpcomingBookingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookingCubit = BookingCubit.get(context);

    return BlocConsumer<BookingCubit, BookingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: bookingCubit.upcomingBookings != null,
            builder: (context) {
              return (bookingCubit.upcomingBookings!.data!.isEmpty)
                  ? const Center(child: Text("There are no data here"))
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => HotelItem(
                        hotelData:
                            bookingCubit.upcomingBookings!.data![index].hotel!,
                        bookingId: bookingCubit
                            .upcomingBookings!.data![index].bookingId,
                        canEditStatus: true,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: bookingCubit.upcomingBookings!.data!.length,
                    );
            },
            fallback: (context) => const Center(
              child: Text("There are no data here"),
            ),
          );

        });
  }
}
