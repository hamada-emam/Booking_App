import 'hotel_facility.dart';
import 'hotel_image.dart';

class HotelData
{
  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;
  List<HotelImage>? hotelImages = [];
  List<HotelFacility>? hotelFacilities = [];

  HotelData.fromJson(Map<String, dynamic> map)
  {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    price = map['price'];
    address = map['address'];
    longitude = map['longitude'];
    latitude = map['latitude'];
    rate = map['rate'];
    map['hotel_images'] != null ? map['hotel_images'].forEach((element){
      hotelImages!.add(HotelImage.fromJson(element));
    }) : [];

    map['hotel_facilities'] != null ? map['hotel_facilities'].forEach((element){
      hotelFacilities!.add(HotelFacility.fromJson(element));
    }) : [];

  }
}