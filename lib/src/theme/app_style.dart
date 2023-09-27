import 'package:flutter/material.dart';
String fontFamily = 'Sedgwick Ave Display';

class AppStyle{
  static TextStyle bodyH2(Color color){
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 24,
      color: color,
      height: 1.7
    );
  }

  static TextStyle bodyContent(Color color){
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      color: color,
      letterSpacing: 1
    );
  }
}