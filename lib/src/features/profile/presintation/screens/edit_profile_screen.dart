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
    ProfileModel m = ModalRoute.of(context)!.settings.arguments as ProfileModel;
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
                create: (context) => sl<AuthCubit>(),
                child: BlocBuilder<AuthCubit, AuthState>(
                  
                    builder: (context, state) {
                  bool withImage = AuthCubit.get(context).image != null;
                  if (state is ErrorAuthState) {
                    Fluttertoast.showToast(msg: state.exception.message);
                  }
                  if (state is SuccessUpdateProfileState) {
                    m = AuthCubit.get(context).profileModel!;
                    Fluttertoast.showToast(msg: "profile updated successfully");
                  }
                  return Column(
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
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Edit Profile",
                            style: getBoldStyle(fontSize: FontSize.s22),
                          ),
                        ),
                        //Profile Image
                        ProfileImage(m: m),
                        EditableTextFormField(
                          hintText: "User Name",
                          controller: name,
                          suffixString: m.data!.name,
                        ),
                        EditableTextFormField(
                          hintText: "Email",
                          controller: email,
                          suffixString: m.data!.email,
                        ),
                        EditableTextFormField(
                          hintText: "Phone",
                          controller: phone,
                          suffixString: m.data!.phone ?? "phone",
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
                            suffixString: m.data!.dateOfBirth,
                            controller: dateOfBirth..text,
                            enabled: false,
                          ),
                        ),
                        EditableTextFormField(
                            hintText: "Address",
                            controller: address,
                            suffixString: m.data!.address),
                        Center(
                          child: state is LoadingUpdateProfileState
                              ? const SimpleLoader()
                              : MainButton(
                                  txt: "update",
                                  onPressed: () {
                                    AuthCubit.get(context).editUserProfile(
                                      user: UserModel(
                                          id: m.data!.id,
                                          token: m.data!.token,
                                          name: name.text,
                                          email: email.text,
                                          address: address.text,
                                          dateOfBirth: dateOfBirth.text,
                                          phone: phone.text),
                                      imagepath: withImage
                                          ? AuthCubit.get(context).image!.path
                                          : null,
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
