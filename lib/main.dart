import 'package:bloc/bloc.dart';
import 'package:booking_app/src/app/app.dart';
import 'package:booking_app/src/app/core/helpers/api_helpert.dart';
import 'package:booking_app/src/app/injector.dart';
import 'package:booking_app/src/app/core/utils/bloc_observer.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Bloc.observer = MyBlocObserver(); //Observe the changing of states
  runApp(const MyApp());
}
