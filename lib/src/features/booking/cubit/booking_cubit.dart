import 'package:booking_app/src/features/booking/cubit/booking_states.dart';
import 'package:booking_app/src/features/booking/data/models/all_bookings_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/core/helpers/api_helpert.dart';
import '../../../app/injector.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit() : super(InitBookingState());

  static BookingCubit get(context) => BlocProvider.of(context);

  // AllBookingData? allBookingData;
  AllBookingData? upcomingBookings;
  AllBookingData? finishedBookings;
  AllBookingData? cancelledBookings;

  Future<void> getAllBookingsTypes({required String token})
  async {
    emit(LoadingGetBookingsState());
    await getUpcomingBookings(token: token);
    await getFinishedBookings(token: token);
    await getCancelledBookings(token: token);
    emit(SuccessGetBookingsState());

  }
  Future<void> getUpcomingBookings({required String token}) async {
    try {
      DioHelper apiHelper = sl<DioHelper>();
      var value = await apiHelper.get(
        endPoint: '/get-bookings',
        token: token,
        query: {
          'type' : 'upcomming',
        },
      );
      // showToastMessage(message: "${value.data['message']}");

      if(value != null) {
        upcomingBookings = AllBookingData.fromJson(value);
        debugPrint("--------------------my upcoming---------------------------");
        debugPrint(upcomingBookings!.data!.length.toString());
        debugPrint("-----------------------my upcoming------------------------");
      }
      else{
        upcomingBookings = null;
      }

    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
        // showToastMessage(message: "${e.response!.data['message']}", toastColor: Colors.red);
      }
    }
  }
  Future<void> getFinishedBookings({required String token,}) async {
    try {
      DioHelper apiHelper = sl<DioHelper>();
      var value = await apiHelper.get(
        endPoint: '/get-bookings',
        token: token,
        query: {
          'type' : 'completed',
        },
      );
      if(value != null) {
        finishedBookings = AllBookingData.fromJson(value);
        debugPrint("-----------------------------------------------");
        debugPrint(finishedBookings!.data!.length.toString());
        debugPrint("-----------------------------------------------");
      }
      else{
        finishedBookings = null;
      }

    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
      }
    }
  }
  Future<void> getCancelledBookings({required String token,}) async {
    try {
      DioHelper apiHelper = sl<DioHelper>();
      var value = await apiHelper.get(
        endPoint: '/get-bookings',
        token: token,
        query: {
          'type' : 'cancelled',
        },
      );

      if(value != null) {
        cancelledBookings = AllBookingData.fromJson(value);
        debugPrint("-----------------------------------------------");
        debugPrint(cancelledBookings!.data!.length.toString());
        debugPrint("-----------------------------------------------");
      }
      else{
        cancelledBookings = null;
      }

    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
      }
    }
  }


  Future<void> createBooking({required String token, required int? hotelId}) async {
    try {
      DioHelper apiHelper = sl<DioHelper>();
      var value = await apiHelper.post(
        endPoint: '/create-booking',
        token: token,
        data: {
          'hotel_id' : hotelId
        }
      );
      debugPrint("-----------------------created------------------------");

      emit(SuccessCreateBookingState());
    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
      }
      emit(FailedCreateBookingState());
    }
  }

  Future<void> updateBookingStatus({required String token, required int? bookingId, required String statusType}) async {
    try {
      DioHelper apiHelper = sl<DioHelper>();
      var value = await apiHelper.post(
        endPoint: '/update-booking-status',
        token: token,
        data: {
          'booking_id' : bookingId,
          'type' : statusType,
        }
      );
      debugPrint("-----------------------created------------------------");
      debugPrint("$value");

      // emit(SuccessUpdateBookingState());
    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
      }
      // emit(FailedUpdateBookingState());
    }
  }

}
