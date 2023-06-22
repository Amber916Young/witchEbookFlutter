import 'package:flutter/material.dart';
import 'package:witchbook/utils/app_layout.dart';
import 'package:witchbook/utils/app_styles.dart';

class ThemeConfig {

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Styles.lightBG,
      brightness: Brightness.light,
    ),
    primaryColor:  Styles.lightPrimary,
    scaffoldBackgroundColor:  Styles.lightBG,
    appBarTheme: AppBarTheme(
      color:  Styles.lightPrimary,
      elevation: Applayout.getHeight(0),
      titleTextStyle:  TextStyle(
        color: Colors.black,
        fontSize: Applayout.getHeight(20),
        fontWeight: FontWeight.w800,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary:  Styles.darkBG,
      brightness: Brightness.dark,
    ),
    primaryColor:  Styles.darkPrimary,
    scaffoldBackgroundColor:  Styles.darkBG,
    appBarTheme: AppBarTheme(
      color:  Styles.darkPrimary,
      elevation: Applayout.getHeight(0),
      titleTextStyle:  TextStyle(
        color: Colors.white,
        fontSize: Applayout.getHeight(20),
        fontWeight: FontWeight.w800,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
