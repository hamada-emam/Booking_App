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

  AllBookingData? allBookingData;

  Future<void> getAllBookings({required String token, required String bookingType}) async {
    emit(LoadingGetBookingsState());
    try {
      DioHelper apiHelper = sl<DioHelper>();
      var value = await apiHelper.get(
        endPoint: '/get-bookings',
        token: token,
        query: {
          'type' : bookingType,
        },
      );
      // showToastMessage(message: "${value.data['message']}");

      allBookingData = AllBookingData.fromJson(value);
      debugPrint("-----------------------------------------------");
      debugPrint(allBookingData!.data!.length.toString());
      debugPrint("-----------------------------------------------");

      emit(SuccessGetBookingsState());
    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
        // showToastMessage(message: "${e.response!.data['message']}", toastColor: Colors.red);
      }
      emit(FailedGetBookingsState());
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
      // showToastMessage(message: "${value.data['message']}");
      debugPrint("-----------------------created------------------------");

      emit(SuccessCreateBookingState());
    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
        // showToastMessage(message: "${e.response!.data['message']}", toastColor: Colors.red);
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
      // showToastMessage(message: "${value.data['message']}");
      debugPrint("-----------------------created------------------------");
      debugPrint("$value");

      emit(SuccessUpdateBookingState());
    } on DioError catch (e) {
      if (e.response == null) {
        // showToastMessage(message: "Check you connection", toastColor: Colors.red);
      } else {
        debugPrint(e.response!.data);
        // showToastMessage(message: "${e.response!.data['message']}", toastColor: Colors.red);
      }
      emit(FailedUpdateBookingState());
    }
  }

}
