class AllHotelsDataModel
{
  List<HotelAllData>? data = [];
  AllHotelsDataModel.fromJson(Map<String, dynamic> map)
  {
    map['data']['data'] != null ? map['data']['data'].forEach((element){
      data!.add(HotelAllData.fromJson(element));
    }) : [];
  }

}

class HotelAllData
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

  HotelAllData.fromJson(Map<String, dynamic> map)
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