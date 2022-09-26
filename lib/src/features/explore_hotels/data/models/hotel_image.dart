class HotelImage
{
  int? id;
  String? hotelId;
  String? image;

  HotelImage.fromJson(Map<String, dynamic> map)
  {
    id = map['id'];
    hotelId = map['hotel_id'];
    image = map['image'];
  }
}