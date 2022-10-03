import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xffeb5e28);
  static const Color secondaryColor = Color(0xff403d39);
  static const Color tertiaryColor = Color(0xffccc5b9);
  static const Color lightPrimaryColor = Color(0xffffe5d9);
  static const Color lightTertiaryColor = Color(0xfffffcf2);
  static const Color darkColor = Color(0xff252422);

  static final ThemeData myTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 24),
    ),
    scaffoldBackgroundColor: tertiaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: lightPrimaryColor,
        textStyle: const TextStyle(fontSize: 20),
      ),
    ),
  );
}
