import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeMode themeMode = ThemeMode.light;
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: mainBackgroundColor,
      elevation: 0,
      toolbarHeight: 90,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    iconTheme: IconThemeData(size: 30, color: mainAppColor),
    scaffoldBackgroundColor: mainBackgroundColor,

  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.darkBackGround,
  );
}
