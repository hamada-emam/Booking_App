import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final bool isDark;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final String Function(String?)? onFieldSubmitted;
  IconData? suffixIcon;

  AppTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.isDark,
    this.onFieldSubmitted,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onFieldSubmitted,
      controller: controller,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: isDark ? ColorManager.lightGrey : Colors.black,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          hintText: hintText,
          hintStyle: getCaptionStyle(
              color: isDark ? ColorManager.lightGrey : Colors.black,
              fontSize: FontSize.s14),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(30),
          ),
          fillColor: isDark ? ColorManager.greyFiller : Colors.white,
          filled: true,
          suffixIcon: Icon(suffixIcon)),
    );
  }
}
