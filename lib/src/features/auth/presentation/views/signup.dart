import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Signup",style: getBoldStyle(fontSize: 40),)),
    );
  }
}
