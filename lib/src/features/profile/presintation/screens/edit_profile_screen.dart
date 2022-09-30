import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/components/loaders/simple_loader.dart';
import 'package:booking_app/src/app/core/components/text_form_fields/editable_txt_field.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/app/injector.dart';
import 'package:booking_app/src/features/auth/data/models/profile_info_model.dart';
import 'package:booking_app/src/features/auth/data/models/user_model.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/states.dart';
import 'package:booking_app/src/features/profile/presintation/widgets/profile_image_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //get back to home
        Navigator.pushReplacementNamed(context, Routes.home);
        return true;
      },
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: BlocProvider(
              key:const Key("sdffdsf"),
                create: (context) => sl<AuthCubit>()..userProfile(),
                child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                  if (state is ErrorAuthState) {
                    Fluttertoast.showToast(msg: state.exception.message);
                  }
                  if (state is SuccessUpdateProfileState) {
                    Fluttertoast.showToast(msg: "profile updated successfully");
                  }
                  return (state is LoadingAuthState)
                      ? SimpleLoader()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.home);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_sharp,
                                    color: ColorMangerH.profileIconColor,
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  "Edit Profile",
                                  style: getBoldStyle(fontSize: FontSize.s22),
                                ),
                              ),
                              //Profile Image
                              ProfileImage(
                                  m: AuthCubit.get(context).profileModel!),
                              EditableTextFormField(
                                hintText: "User Name",
                                controller: name,
                                suffixString: AuthCubit.get(context)
                                    .profileModel!
                                    .data!
                                    .name,
                              ),
                              EditableTextFormField(
                                hintText: "Email",
                                controller: email,
                                suffixString: AuthCubit.get(context)
                                    .profileModel!
                                    .data!
                                    .email,
                              ),
                              EditableTextFormField(
                                hintText: "Phone",
                                controller: phone,
                                suffixString: AuthCubit.get(context)
                                        .profileModel!
                                        .data!
                                        .phone ??
                                    "phone",
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var temp = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2020),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now(),
                                  );
                                  if (temp != null)
                                    dateOfBirth.text =
                                        DateFormat("d, MMM ,yyyy").format(temp);
                                },
                                child: EditableTextFormField(
                                  hintText: "Date of Birth",
                                  suffixString: AuthCubit.get(context)
                                      .profileModel!
                                      .data!
                                      .dateOfBirth,
                                  controller: dateOfBirth..text,
                                  enabled: false,
                                ),
                              ),
                              EditableTextFormField(
                                  hintText: "Address",
                                  controller: address,
                                  suffixString: AuthCubit.get(context)
                                      .profileModel!
                                      .data!
                                      .address),
                              Center(
                                child: state is LoadingUpdateProfileState ||
                                        state is LoadingAuthState
                                    ? const SimpleLoader()
                                    : MainButton(
                                        txt: "update",
                                        onPressed: () async {
                                          await AuthCubit.get(context)
                                              .editUserProfile(
                                            user: UserModel(
                                                id: AuthCubit.get(context)
                                                    .profileModel!
                                                    .data!
                                                    .id,
                                                token: AuthCubit.get(context)
                                                    .profileModel!
                                                    .data!
                                                    .token,
                                                name: name.text,
                                                email: email.text,
                                                address: address.text,
                                                dateOfBirth: dateOfBirth.text,
                                                phone: phone.text),
                                          );
                                        },
                                      ),
                              ),
                            ]);
                })),
          ),
        ),
      )),
    );
  }
}
