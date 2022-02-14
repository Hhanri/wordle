import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: MyColors.mainColor,
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: MyColors.primaryColor,
      onPrimary: MyColors.mainColor,
      secondary: MyColors.secondaryColor,
      onSecondary: MyColors.mainColor,
      error: MyColors.errorColor,
      onError: MyColors.sideColor,
      background: MyColors.mainColor,
      onBackground: MyColors.sideColor,
      surface: MyColors.mainColor,
      onSurface: MyColors.sideColor
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: MyColors.mainColor
  )
);

class MyColors {
  static const Color mainColor = Color(0xFF000A1F);
  static const Color primaryColor = Color(0xFF11FFEE);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFF000A1F);
  static const Color errorColor = Color(0xDFFFFFFF);
  static const Color sideColor = Color(0xFF2B2E4A);
}

class MyShapes {
  static final BorderRadiusGeometry circularBorders = BorderRadius.circular(5);
}