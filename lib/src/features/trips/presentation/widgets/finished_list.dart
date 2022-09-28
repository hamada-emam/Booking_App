import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/app/core/helpers/cash_helper.dart';
import 'package:booking_app/src/features/booking/cubit/booking_cubit.dart';
import 'package:booking_app/src/features/booking/cubit/booking_states.dart';
import 'package:booking_app/src/features/explore_hotels/presentation/components/hotel_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishedBookingsList extends StatelessWidget {
  const FinishedBookingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookingCubit = BookingCubit.get(context);

    return BlocConsumer<BookingCubit, BookingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is! LoadingGetBookingsState) {
            return ConditionalBuilder(
              condition: bookingCubit.finishedBookings != null,
              // means that the list is not empty
              builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => HotelItem(
                  hotelData: bookingCubit.finishedBookings!.data![index].hotel!,
                  bookingId:
                      bookingCubit.finishedBookings!.data![index].bookingId,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: bookingCubit.finishedBookings!.data!.length,
              ),
              fallback: (context) => const Center(
                child: Text("There are no data here"),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: mainAppColor,
                strokeWidth: 3,
              ),
            );
          }
        });
  }
}
