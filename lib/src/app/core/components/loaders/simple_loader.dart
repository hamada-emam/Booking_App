import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class SimpleLoader extends StatelessWidget {
  const SimpleLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorManager.primaryColor,
        strokeWidth: 3,
      ),
    );
  }
}
