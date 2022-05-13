import 'package:flutter/material.dart';

class AppColors {
  static Color bluePrimaryColor = const Color(0xff5798A6);
  static Color lightBluePrimaryColor = const Color(0xffCAE3FF);
  static Color pinkPrimaryColor = const Color(0xffFFB8B7);

  static MaterialColor bluePrimarySwatch = MaterialColor(
    0xff5798A6,
    <int, Color>{
      50: bluePrimaryColor,
      100: bluePrimaryColor,
      200: bluePrimaryColor,
      300:bluePrimaryColor,
      400: bluePrimaryColor,
      500: bluePrimaryColor,
      600:bluePrimaryColor,
      700:bluePrimaryColor,
      800:bluePrimaryColor,
      900:bluePrimaryColor
    },
  );
}