import 'package:booking_app/src/app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class FontConstants {}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
}

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    Color color = const Color.fromRGBO(255, 255, 255, 1)}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

 TextStyle getCaptionStyle(
    {double fontSize = FontSize.s12,
    Color color =ColorManager.lightGrey}) {
  return  _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    Color color = const Color.fromRGBO(255, 255, 255, 1)}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    Color color = const Color.fromRGBO(255, 255, 255, 1)}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    Color color = const Color.fromRGBO(255, 255, 255, 1)}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
