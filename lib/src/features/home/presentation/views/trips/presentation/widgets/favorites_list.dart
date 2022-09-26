import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/features/booking/cubit/booking_cubit.dart';
import 'package:booking_app/src/features/booking/cubit/booking_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../app/core/helpers/cash_helper.dart';
import '../../../../../../explore_hotels/presentation/components/hotel_item.dart';

class CancelledBookingsList extends StatelessWidget {
  const CancelledBookingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookingCubit = BookingCubit.get(context);
    bookingCubit.getAllBookings(
      token: CashHelper.getData("token"),
      bookingType: 'cancelled',
    );
    return BlocConsumer<BookingCubit, BookingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is! LoadingGetBookingsState)
        {
          return ConditionalBuilder(
            condition: bookingCubit.allBookingData!.data!.isNotEmpty,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => HotelItem(
                hotelData: bookingCubit.allBookingData!.data![index].hotel!,
                bookingId: bookingCubit.allBookingData!.data![index].bookingId,
                canEditStatus: true,
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: bookingCubit.allBookingData!.data!.length,
            ),
            fallback: (context) => const Center(
              child:Text("There are no data here"),
            ),
          );
        }
        else
        {
          return Center(
            child: CircularProgressIndicator(
              color: mainAppColor,
            ),
          );
        }
      },
    );
  }
}
