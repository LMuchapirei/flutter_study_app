import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25.0;
const double _cardBorderRadius = 10.0;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding =>
      EdgeInsets.all(_mobileScreenPadding);
  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }

  static double get iconSize => 25.0;

  static InputDecoration  inputDecoration({ required String hintText} ) => InputDecoration(
    hintText: hintText,
    
  );
}
