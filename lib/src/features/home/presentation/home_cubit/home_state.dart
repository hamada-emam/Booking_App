part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class ScreenChangedState extends HomeState {}
class SuccessGetHotelsDataState extends HomeState {}
class FailedGetHotelsDataState extends HomeState {}
