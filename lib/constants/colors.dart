import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimary = Color(0xFF4D7CFE);
  static const Color kPrimaryDark = Color(0xFF252631);
  static const Color kSecondaryDark = Color(0xFF778CA2);
  static const Color kSecondaryDark2 = Color(0xFF98A9BC);
  static const Color kSecondary = Color(0xFFFFAB2B);
  static const Color kSecondary2 = Color(0xFF6DD230);
  static const Color kSecondary3 = Color(0xFFFE4D97);
  static const Color kSecondary4 = Color(0xFF2CE5F6);
  static const Color kOutline = Color(0xFFE8ECEF);
  static const Color kBackground = Color(0xFFF2F4F6);
  static const Color kBackground2 = Color(0xFFF8FAFB);
  static const Color backgroundAppBar = Color(0xFFFFFFFF);
  static const Color kTextColor = Colors.black;

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}
