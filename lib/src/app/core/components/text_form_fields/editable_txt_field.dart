import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:flutter/material.dart';

class EditableTextFormField extends StatelessWidget {
  final String hintText;

  TextEditingController? controller;
  String Function(String?)? onFieldSubmitted;
  bool? isDark;
  String? Function(String?)? validator;
  String? suffixString;
  TextInputType? keyboardType;
  bool enabled;

  EditableTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    this.validator,
    this.enabled = true,
    this.isDark = false,
    this.onFieldSubmitted,
    this.suffixString,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        onSaved: onFieldSubmitted,
        controller: controller,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        cursorColor: isDark! ? ColorManager.lightGrey : Colors.black,
        style: TextStyle(
          color: isDark! ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          enabled: enabled,
          hintStyle: getCaptionStyle(
              color: Colors.grey.shade400, fontSize: FontSize.s14),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5)),
          focusedBorder: const UnderlineInputBorder(),
          border: UnderlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: Text(suffixString!.isEmpty ? hintText : suffixString!),
        ),
      ),
    );
  }
}
