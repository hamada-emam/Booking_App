import 'dart:io';

import 'package:booking_app/src/app/core/exceptions/network_exception.dart';
import 'package:booking_app/src/app/core/helpers/cash_helper.dart';
import 'package:booking_app/src/features/auth/data/models/login_model.dart';
import 'package:booking_app/src/features/auth/data/models/profile_info_model.dart';
import 'package:booking_app/src/features/auth/data/models/user_model.dart';
import 'package:booking_app/src/features/auth/data/repo/auth_repo.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({
    required this.repository,
  }) : super(InitalAuthState());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  LoginModel? userModel;

  Future<void> userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required File image,
  }) async {
    emit(LoadingAuthState());
    final res = await repository.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        image: image);
    res.fold((l) {
      emit(ErrorAuthState(exception: l));
    }, (r) async {
      userModel = r;
      print("------------------" + r.data!.token);
      await CashHelper.setData("token", r.data!.token);

      emit(SuccessAuthState());
    });
  }

  Future<void> userLogin(String email, String password) async {
    emit(LoadingAuthState());

    final response = await repository.login(
      email: email,
      password: password,
    );

    response.fold(
      (l) {
        emit(ErrorAuthState(exception: l));
      },
      (r) async {
        userModel = r;
        await CashHelper.setData("token", r.data!.token);
        emit(SuccessAuthState());
      },
    );
  }

  ProfileModel? profileModel;

  Future<void> userProfile() async {
    emit(LoadingAuthState());

    final response =
        await repository.getProfile(token: CashHelper.getData("token"));

    response.fold(
      (l) {
        emit(ErrorAuthState(exception: l));
      },
      (r) {
        profileModel = r;

        emit(SuccessAuthState());
      },
    );
  }

  //var base64string ;
  File? image;
  Future<String?> uploadImage() async {
    emit(LoadingImageState());
    try {
      var pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        String imagePath = pickedFile.path;
        image = File(imagePath);
        // String imageExtension = imagePath.split('.').last;
        // print(imageExtension);
        // Uint8List imageBytes =
        //     await pickedFile.readAsBytes(); //convert to bytes
        // base64string =
        //     base64.encode(imageBytes); //convert bytes to base64 string
        // base64string = "data:image/$imageExtension;base64,$base64string";
        // return base64string;
        emit(SuccessImageState());
      }
    } on Exception catch (e) {
      emit(ErrorImageState(
          exception: PrimaryServerException(
              code: 105, error: e.toString(), message: "image loading faild")));
    }
  }

  Future<void> editUserProfile(
      {required UserModel user, String? imagepath}) async {
    emit(LoadingUpdateProfileState());
    final res =
        await repository.updateProfile(user: user, imagePath: imagepath);
    res.fold((l) {
      emit(
        ErrorAuthState(exception: l),
      );
    }, (r) {
      profileModel = r;
      emit(SuccessUpdateProfileState());
    });
  }
}
