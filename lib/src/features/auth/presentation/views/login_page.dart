import 'package:booking_app/src/app/core/utils/string_manager.dart';
import 'package:booking_app/src/features/auth/presentation/widgets/auto_auth_meathods.dart';
import 'package:booking_app/src/features/auth/presentation/widgets/or_log_divider.dart';
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
import 'package:booking_app/src/features/auth/presentation/widgets/autologin_widget.dart';
import 'package:booking_app/src/features/auth/presentation/widgets/text_field_layout.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(repository: sl()),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: ColorManager.darkBackGround,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          backgroundColor: ColorManager.darkBackGround,
          body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.loginTitle,
                        style: getBoldStyle(fontSize: FontSize.s22),
                      ),
                      SizedBox(
                        height: MediaQueryManager.screenHeight * 0.05,
                      ),
                      const AutoAuthWidget(),
                      const OrLogDivider(),
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
                                      txt: StringsManager.loginTitle,
                                      isExpanded: true,
                                      onPressed: () async {
                                        if (formkey.currentState!.validate()) {
                                          try {
                                            await AuthCubit.get(context)
                                                .userLogin(emailController.text,
                                                    passwordController.text);
                                       
                                          } catch (e) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "sorry we run into problem");
                                          }
                                        }
                                      }),
                                );
                        },
                      )
                    ]),
              )),
        ));
  }
}
