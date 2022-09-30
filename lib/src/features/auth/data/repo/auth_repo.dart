import 'dart:io';

import 'package:booking_app/src/app/core/components/data/end_points.dart';
import 'package:booking_app/src/app/core/exceptions/network_exception.dart';
import 'package:booking_app/src/app/core/helpers/api_helpert.dart';
import 'package:booking_app/src/features/auth/data/models/login_model.dart';
import 'package:booking_app/src/features/auth/data/models/profile_info_model.dart';
import 'package:booking_app/src/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future<Either<PrimaryServerException, LoginModel>> login({
    required String email,
    required String password,
  });
  Future<Either<PrimaryServerException, LoginModel>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required File image,
  });

  Future<Either<PrimaryServerException, ProfileModel>> getProfile({
    required String token,
  });

  Future<Either<PrimaryServerException, ProfileModel>> updateProfile(
      {required UserModel user, File? image});
}

class RepositoryImplementation extends AuthRepository {
  final DioHelper dioHelper;

  RepositoryImplementation({
    required this.dioHelper,
  });

  @override
  Future<Either<PrimaryServerException, ProfileModel>> getProfile({
    required String token,
  }) async {
    return basicErrorHandling<ProfileModel>(
      onSuccess: () async {
        final response = await dioHelper.get(
          endPoint: profileEndPoint,
          token: token,
        );

        return ProfileModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, LoginModel>> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required File image}) async {
    return basicErrorHandling<LoginModel>(
      onSuccess: () async {
        var formData = FormData.fromMap({
          "name": firstName,
          "image": await MultipartFile.fromFile(image.path),
          "email": email,
          "password": password,
          "last_name": lastName,
          "password_confirmation": password
        });

        final res = await dioHelper.post(
            endPoint: registerEndPoint, isMultipart: true, data: formData);

        return LoginModel.fromJson(res);
      },
      onPrimaryServerException: (exception) async {
        return exception;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    return basicErrorHandling<LoginModel>(
      onSuccess: () async {
        final response = await dioHelper.post(
          endPoint: loginEndPoint,
          data: {
            'email': email,
            'password': password,
          },
        );

        return LoginModel.fromJson(response);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, ProfileModel>> updateProfile(
      {required UserModel user, File? image}) async {
    return basicErrorHandling(
      onSuccess: () async {
        print("99999999999999999999999999999");
        print(image.toString());
        print("99999999999999999999999999999");

        final response = await dioHelper.post(
          endPoint: updateProfileEndPoint,
          token: user.token,
          isMultipart: true,
          data: FormData.fromMap({
            'name': user.name,
            'email': user.email,
            if (image != null)
              'image': await MultipartFile.fromFile(
                image.path,
                filename: Uri.file(image.path).pathSegments.last,
              ),
          }),
        );
        return ProfileModel.fromJson(response);
      },
      onPrimaryServerException: (exception) async => exception,
    );
  }
}

extension on AuthRepository {
  Future<Either<PrimaryServerException, T>> basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception)?
        onPrimaryServerException,
  }) async {
    try {
      final r = await onSuccess();
      return Right(r);
    } on PrimaryServerException catch (e, s) {
      debugPrint(s.toString());
      return Left(e);
    }
  }
}
