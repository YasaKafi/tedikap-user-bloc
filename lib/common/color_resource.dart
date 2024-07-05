import 'package:flutter/material.dart';

class ColorResources {
  
  static const Color black = Color(0xff000000);
  static const Color black30 = Colors.black12;
  static const Color primaryColor = Color.fromRGBO(252, 197, 72, 1);
  static const Color white = Color(0xffFFFFFF);
  static const Color white50 = Color(0xffFCFCFF);
  static const Color lightSkyBlue = Color(0xff8DBFF6);
  static const Color harlequin = Color(0xff3FCC01);
  static const Color cris = Color(0xffE2206B);
  static  Color grey = Colors.grey.shade400;
  static  Color greyBold = Color(0xFFFF7F7F7F);
  static  Color greySemi = Color(0xFFF1F1F2);
  static const Color red = Color(0xFFD32F2F);
  static const Color blueDark = Color(0xFF324A59);
  static const Color yellow = Color(0xffFEC446);
  static const Color gold = Color(0xffE4A923);
  static const Color hintTextColor = Color(0xff9E9E9E);
  static const Color gainsBg = Color(0xffE6E6E6);
  static const Color textBg = Color(0xffF3F9FF);
  static const Color iconBg = Color(0xffF9F9F9);
  static const Color homeBg = Color(0xffF0F0F0);
  static const Color imageBg = Color(0xffE2F0FF);
  static const Color sellerText = Color(0xff92C6FF);
  static const Color chatIconColor = Color(0xffD4D4D4);
  static const Color lowGreen = Color(0xffEFF6FE);
  static const Color green = Color(0xff23CB60);


  static const Map<int, Color> colorMap = {
    50: Color(0x101455AC),
    100: Color(0x201455AC),
    200: Color(0x301455AC),
    300: Color(0x401455AC),
    400: Color(0x501455AC),
    500: Color(0x601455AC),
    600: Color(0x701455AC),
    700: Color(0x801455AC),
    800: Color(0x901455AC),
    900: Color(0xff1455AC),
  };

  static const MaterialColor primaryMaterial =
      MaterialColor(0xFF1455AC, colorMap);
}