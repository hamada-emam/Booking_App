
import 'package:booking_app/src/features/auth/data/models/status_model.dart';
import 'package:booking_app/src/features/auth/data/models/user_model.dart';

class ProfileModel {
  final StatusModel status;
  final UserModel? data;

  ProfileModel({
    required this.status,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}

// {
//     "status": {
//         "type": "1"
//     },
//     "data": {
//         "id": 21,
//         "name": "hamada emam",
//         "email": "hamada152emam@gmail.com",
//         "email_verified_at": null,
//         "api_token": "qDfdgSLeGzS90Ao2a4gW9GoUoyFqQtZg3vwBuVBmoUoJtkjQPGGhB93nQlNs",
//         "image": "http://api.mahmoudtaha.com/images",
//         "created_at": "2022-09-18T20:45:06.000000Z",
//         "updated_at": "2022-09-18T20:45:06.000000Z",
//         "google_id": null,
//         "provider": null
//     }
// }