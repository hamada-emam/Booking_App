import 'hotel_data.dart';

class AllHotelsData
{
  List<HotelData>? data = [];
  AllHotelsData.fromJson(Map<String, dynamic> map)
  {
    map['data']['data'] != null ? map['data']['data'].forEach((element){
      data!.add(HotelData.fromJson(element));
    }) : [];
  }

}
