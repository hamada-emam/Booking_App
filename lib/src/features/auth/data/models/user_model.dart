class UserModel {
  final int id;
  final String token;
  final String name;
  final String email;
   String? imageUrl;
  

  UserModel({
    required this.id,
    required this.token,
    required this.name,
    required this.email,
    this.imageUrl
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      token: json['api_token'],
      name: json['name'],
      email: json['email'],
      imageUrl: json['image']??"",
      
    );
  }
}