import 'package:booking_app/src/app/core/utils/string_manager.dart';
import 'package:booking_app/src/features/auth/presentation/widgets/auto_auth_meathods.dart';
import 'package:booking_app/src/features/auth/presentation/widgets/or_log_divider.dart';
import 'package:booking_app/src/features/onboarding/presentation/screens/or_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:booking_app/src/app/config/routes/routes.dart';
import 'package:booking_app/src/app/core/components/buttons/main_button.dart';
import 'package:booking_app/src/app/core/components/loaders/simple_loader.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:booking_app/src/app/core/utils/mediaquery_managment.dart';
import 'package:booking_app/src/app/core/utils/text_styles_manager.dart';
import 'package:booking_app/src/app/injector.dart';
import 'package:booking_app/src/features/auth/data/repo/validators.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/states.dart';
import 'package:booking_app/src/features/auth/presentation/widgets/text_field_layout.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(repository: sl()),
        child: Scaffold(
          backgroundColor: ColorManager.darkBackGround,
          body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: formkey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<AuthCubit, AuthState>(
                          buildWhen: (previous, current) {
                            return current is LoadingImageState ||
                                current is ErrorImageState ||
                                current is SuccessImageState;
                          },
                          builder: (context, state) {
                            if (state is ErrorImageState) {
                              Fluttertoast.showToast(
                                  msg: state.exception.message);
                              return CircleAvatar(
                                child: Icon(Icons.error),
                              );
                            }
                            return AuthCubit.get(context)
                                    .image!=null
                                    
                                ? Center(
                                    child: CircleAvatar(
                                      child: Icon(Icons.done),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () async {
                                      await AuthCubit.get(context)
                                          .uploadImage();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.image),
                                    ),
                                  );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Text(
                          StringsManager.signupTitle,
                          style: getBoldStyle(fontSize: FontSize.s22),
                        ),
                        SizedBox(
                          height: MediaQueryManager.screenHeight * 0.05,
                        ),
                        const AutoAuthWidget(),
                        const OrLogDivider(),
                        buildFieldLayout(
                            header: StringsManager.firstName,
                            hint: StringsManager.firstNameHint,
                            validator: (txt) => Validator.emptyValiadtion(
                                txt, StringsManager.firstName),
                            controller: nameController),
                        SizedBox(
                          height: MediaQueryManager.screenHeight * 0.02,
                        ),
                        buildFieldLayout(
                            header: StringsManager.lastName,
                            hint: StringsManager.lastNameHint,
                            validator: (txt) => Validator.emptyValiadtion(
                                txt, StringsManager.lastName),
                            controller: lastNameController),
                        SizedBox(
                          height: MediaQueryManager.screenHeight * 0.02,
                        ),
                        buildFieldLayout(
                          header: StringsManager.yourEmail,
                          controller: emailController,
                          hint: StringsManager.hintEmail,
                          validator: Validator.isEmail,
                        ),
                        SizedBox(
                          height: MediaQueryManager.screenHeight * 0.02,
                        ),
                        buildFieldLayout(
                            header: StringsManager.yourPassword,
                            hint: StringsManager.hintPassword,
                            validator: Validator.passwordStringth,
                            controller: passwordController),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              StringsManager.forgetYourPassword,
                              style: getRegularStyle(
                                  color: ColorManager.lightGrey,
                                  fontSize: FontSize.s14),
                            ),
                          ),
                        ),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is SuccessAuthState) {
                              Navigator.pushNamed(context, Routes.exploreHotels);
                            }
                          },
                          builder: (context, state) {
                            if (state is ErrorAuthState) {
                              Fluttertoast.showToast(
                                  msg: state.exception.message);
                            }
                            return state is LoadingAuthState
                                ? const SimpleLoader()
                                : Center(
                                    child: MainButton(
                                        txt: StringsManager.signupTitle,
                                        isExpanded: true,
                                        onPressed: () async {
                                          if (AuthCubit.get(
                                                  context) //first validate the image
                                              .image==null
                                              ) {
                                            Fluttertoast.showToast(
                                                msg: "Please Provide an image");
                                          } else {
                                            if (formkey.currentState!
                                                .validate()) {
                                              try {
                                                //then Validate the fields
                                                await AuthCubit.get(context)
                                                    .userRegister(
                                                        email: emailController
                                                            .text,
                                                        firstName:
                                                            nameController.text,
                                                        lastName:
                                                            lastNameController
                                                                .text,
                                                        image: AuthCubit.get(
                                                                context)
                                                            .image!,
                                                        password:
                                                            passwordController
                                                                .text);
                                              } catch (e) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "sorry we run into problem");
                                              }
                                            }
                                          }
                                        }),
                                  );
                          },
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 15),
                          child: Text(
                            StringsManager.polices,
                            textAlign: TextAlign.center,
                            style:
                                getCaptionStyle(color: ColorManager.lightGrey),
                          ),
                        )),
                        OrWidget(
                            isDark: true,
                            onTap: () {
                              Navigator.pushNamed(context, Routes.login);
                            })
                      ]),
                )),
          ),
        ));
  }
}
