class HotelFacility
{
  int? id;
  String? hotelId;
  String? facilityId;

  HotelFacility.fromJson(Map<String, dynamic> map)
  {
    id = map['id'];
    hotelId = map['hotel_id'];
    facilityId = map['facility_id'];
  }
}