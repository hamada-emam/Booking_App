class UserModel {
  final int id;
  final String token;
  final String name;
  final String email;
  // further info
  final String ?phone;
  final String ?dateOfBirth;
  final String ?address;
  String? imageUrl;
  

  UserModel({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    this.address,
    this.dateOfBirth,
    this.imageUrl,
    this.phone,
    
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      token: json['api_token'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['image']??"",
      address: json['address']??"",
      dateOfBirth: json['date_of_birth']??"",
      phone: json['phone']??"",
      
      
    );
  }
}