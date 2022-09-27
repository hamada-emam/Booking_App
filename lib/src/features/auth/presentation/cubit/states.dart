import 'package:booking_app/src/app/core/exceptions/network_exception.dart';

abstract class AuthState {}

class InitalAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final PrimaryServerException exception;
  ErrorAuthState({
    required this.exception,
  });
}

class LoadingImageState extends AuthState {}

class SuccessImageState extends AuthState {}

class ErrorImageState extends AuthState {
  final PrimaryServerException exception;
  ErrorImageState({
    required this.exception,
  });
}
  class LoadingUpdateProfileState extends AuthState {}

class SuccessUpdateProfileState extends AuthState {}

class ErrorUpdateProfileState extends AuthState {}


