//to return the header and formfield as on part
import 'package:booking_app/src/app/core/components/text_form_fields/app_textform_field.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/features/auth/data/repo/validators.dart';
import 'package:flutter/material.dart';

buildFieldLayout(
    {required String header,
    required String hint,
    required String? Function(String?) validator,
    required TextEditingController controller}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            header,
            style: getRegularStyle(
                color: Colors.grey.shade600, fontSize: FontSize.s14),
          ),
        ),
      ),
      AppTextFormField(
          hintText: hint,
          isDark: false,
          validator: validator,
          controller: controller)
    ],
  );
}
