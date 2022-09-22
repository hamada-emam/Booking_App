import 'package:flutter/material.dart';

class SearchTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String Function(String?)? onFieldSubmitted;
  IconData? suffixIcon;

  SearchTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.onFieldSubmitted,
        this.suffixIcon,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(30),
            ),
            fillColor: Colors.white,
            filled: true,
          suffixIcon: Icon(suffixIcon)
        ),
      ),
    );
  }
}
