import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/app_theme/app_colors.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: "cairo",
    primarySwatch: AppColors.bluePrimarySwatch,
    scaffoldBackgroundColor: Colors.grey.shade50,

    iconTheme: IconThemeData(color: AppColors.bluePrimaryColor),
    listTileTheme: ListTileThemeData(iconColor: AppColors.lightBluePrimaryColor),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent
    ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.bluePrimaryColor),
        titleTextStyle: TextStyle(
            color: AppColors.bluePrimaryColor,
            fontSize: 22,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w600)));
