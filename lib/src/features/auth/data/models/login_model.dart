

import 'package:booking_app/src/features/auth/data/models/status_model.dart';
import 'package:booking_app/src/features/auth/data/models/user_model.dart';

class LoginModel {
  final StatusModel status;
  final UserModel? data;

  LoginModel({
    required this.status,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}










// {
//     "status": {
//         "type": "1",
//         "title": {
//             "ar": "تم  تسجيل الدخول بنجاح",
//             "en": "signed in successfuly"
//         }
//     },

//     "data": {
//         "id": 21,
//         "name": "hamada emam",
//         "email": "hamada152emam@gmail.com",
//         "email_verified_at": null,
//         "api_token": "qDfdgSLeGzS90Ao2a4gW9GoUoyFqQtZg3vwBuVBmoUoJtkjQPGGhB93nQlNs",
//         "image": null,
//         "created_at": "2022-09-18T20:45:06.000000Z",
//         "updated_at": "2022-09-18T20:45:06.000000Z",
//         "google_id": null,
//         "provider": null
//     }

// }