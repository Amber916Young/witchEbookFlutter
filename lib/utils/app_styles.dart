import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_layout.dart';
Color primary = const Color(0xFF393939);

class Styles {
  static String appName = '女巫怪谈';
  static Color primaryColor = primary;

  static Color mainColor1 = const Color(0xff7690ff);
  static Color mainColor2 = const Color(0xff2b4edc);
  static Color mainColor3 = const Color(0xff0a2ea1);


  static Color textColor = const Color(0xFF3b3b3b);
  static Color textColor2 = const Color(0xffa3a0a0);
  static Color textColor3 = const Color(0xff656565);
  static Color whiteColor = const Color(0xffffffff);

  static Color inactiveColor = const Color(0xFF526480);
  static Color activeColor = mainColor2;

  static Color iconColor1 = Color(0xFFF48A37);
  static Color shadowColor1 = Color(0xFFD3D3D3).withOpacity(.84);
  static Color blackColor1 = Color(0xFF393939);
  static Color lightBlackColor1 = Color(0xFF8F8F8F);

  static Color lightPrimary = Colors.white;
  static Color darkPrimary = const Color(0xff1f1f1f);
  static Color lightAccent = const Color(0xff2ca8e2);
  static Color darkAccent = const Color(0xff2ca8e2);
  static Color lightBG = Colors.white;
  static Color darkBG = const Color(0xff121212);


  static TextStyle textStyle = TextStyle(
      fontSize: Applayout.getHeight(14), color: textColor, fontWeight: FontWeight.w500);
  static TextStyle textStylePop = TextStyle(
      fontSize: Applayout.getHeight(16), color: textColor2, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle = TextStyle(
      fontSize: Applayout.getHeight(30), color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLine1Style = TextStyle(
      fontSize: Applayout.getHeight(26), color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLine2Style = TextStyle(
      fontSize: Applayout.getHeight(21), color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLine3Style = TextStyle(fontSize: Applayout.getHeight(17), fontWeight: FontWeight.w500);
  static TextStyle headLine4Style = TextStyle(fontSize:  Applayout.getHeight(14), color: Colors.grey.shade500, fontWeight: FontWeight.w500);

}