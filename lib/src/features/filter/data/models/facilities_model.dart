class AllFacilitiesData
{

  List<FacilityData> data = [];
  AllFacilitiesData.fromJson(Map<String, dynamic> map)
  {
    map['data'] != null ? map['data'].forEach((element){
      data.add(FacilityData.fromJson(element));
    }) : [];
  }

}

class FacilityData{
  int? id;
  String? name;
  String? image;
  FacilityData.fromJson(Map<String, dynamic> map)
  {
    id = map['id'];
    name = map['name'];
    image = map['image'];
  }
}