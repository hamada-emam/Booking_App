import 'package:booking_app/src/features/auth/data/models/profile_info_model.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileModel m = ModalRoute.of(context)!.settings.arguments as ProfileModel;
    return Scaffold(
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back))
        ],
      ),
    );
  }
}
