import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff082659);
Color secondaryColor = const Color(0xff51eec2);

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    centerTitle: true,
  ),
  brightness: Brightness.light,
  primaryColor: primaryColor,
  colorScheme: ColorScheme.light(
    primary: primaryColor,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: secondaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: primaryColor),
    iconColor: secondaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: secondaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
