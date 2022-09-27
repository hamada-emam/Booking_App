import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/features/auth/data/repo/validators.dart';
import 'package:booking_app/src/features/auth/presentation/widgets/text_field_layout.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_sharp,
                  color: ColorMangerH.profileIconColor,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Change Password",
                style: getBoldStyle(fontSize: FontSize.s22),
              ),
            ),
            Text(
              "Enter your new password and confirm your password",
              style: getRegularStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: buildFieldLayout(
                  header: "New Password",
                  hint: "Enter new password",
                  validator: (w) {
                    return Validator.emptyValiadtion(w, "new Password");
                  },
                  controller: newPassword),
            ),
            buildFieldLayout(
                header: "Confirm Password",
                hint: "Enter confirm password",
                validator: (w) {
                  return Validator.emptyValiadtion(w, "new Password");
                },
                controller: confirmPassword),
            SizedBox(
              height: 15,
            ),
            Center(
                child: MainButton(
              txt: "Apply",
              onPressed: () {},
              isExpanded: true,
              color: Colors.blue,
            ))
          ],
        ),
      ),
    ));
  }
}
