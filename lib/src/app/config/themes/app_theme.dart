import 'package:booking_app/src/app/core/core.dart';
import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeMode themeMode = ThemeMode.light;
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color(0xfff7f7f7),
      elevation: 0,
      toolbarHeight: 90,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    iconTheme: IconThemeData(size: 30, color: mainAppColor),
    scaffoldBackgroundColor: const Color(0xfff7f7f7),

  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.darkBackGround,
  );
}
