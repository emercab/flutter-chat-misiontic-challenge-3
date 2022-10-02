import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xff22333b);
  static const Color secondaryColor = Color(0xff5e503f);
  static const Color tertiaryColor = Color(0xffc6ac8f);
  static const Color lightPrimaryColor = Color(0xffd6dadb);
  static const Color lightTertiaryColor = Color(0xffeae0d5);
  static const Color darkColor = Color(0xff0a0908);

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
        backgroundColor: secondaryColor,
        foregroundColor: lightTertiaryColor,
        textStyle: const TextStyle(fontSize: 20),
      ),
    ),
  );
}
