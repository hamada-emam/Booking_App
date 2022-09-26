import 'package:booking_app/src/features/auth/data/models/user_model.dart';

import '../../../explore_hotels/data/models/hotel_data.dart';

class AllBookingData
{
  List<BookingData>? data = [];
  AllBookingData.fromJson(Map<String, dynamic> map)
  {
    map['data']['data'] != null ? map['data']['data'].forEach((element){
      data!.add(BookingData.fromJson(element));
    }) : [];
  }
}

class BookingData
{
  int? bookingId;
  String? userId;
  String? hotelId;
  String? type;
  String? createdAt;
  String? updatedAt;
  UserModel? user;
  HotelData? hotel;

  BookingData.fromJson(Map<String, dynamic> map)
  {
    bookingId = map['id'];
    userId = map['user_id'];
    hotelId = map['hotel_id'];
    type = map['type'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
    user = UserModel.fromJson(map['user']);
    hotel = HotelData.fromJson(map['hotel']);
  }

}