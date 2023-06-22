import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Applayout{
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
  static getKeyHeight(BuildContext context){
    return MediaQuery.of(context).viewInsets.bottom;
  }

  static getScreenHeight(){
    return Get.height;
  }

  static getScreenWidth(){
    return Get.width;
  }

  static getHeight(double pixels){
    double x = getScreenHeight() / pixels;
    return getScreenHeight()/x;
  }
  static getWidth(double pixels){
    double x = getScreenWidth() / pixels;
    return getScreenWidth()/x;
  }

  static androidBottom(){
    double x = getScreenHeight() / 50;
    return getScreenWidth()/x;
  }
}