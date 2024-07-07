import 'package:smart_qr/utils/responsive.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
    fontFamily: AppTheme.quicksand,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.kBackground,
    primarySwatch: getMaterialColor(AppColors.kBackground),
    unselectedWidgetColor: getMaterialColor(AppColors.kBackground),
    appBarTheme: AppBarTheme(
      color: AppColors.kPrimary,
      foregroundColor: AppColors.kBackground,
      iconTheme: const IconThemeData(color: AppColors.kPrimary),
      toolbarTextStyle: txt8pt,
      titleTextStyle: txt8pt,
      elevation: 0,
    ),
  );

  static const String quicksand = 'Quicksand';

  static TextStyle txt11pt = TextStyle(
    fontSize: Responsive.getHeightSize(15),
    fontWeight: FontWeight.w400,
    color: AppColors.kTextColor,
  );

  static TextStyle txt12pt = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(16),
  );

  static TextStyle txt14pt = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(18.7),
  );

  static TextStyle txtMenuButton = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(21),
    color: AppColors.kTextColor,
  );

  static TextStyle txt10pt = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(13),
  );

  static TextStyle txt9pt = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(12),
  );

  static TextStyle txt8pt = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(11),
  );
  static TextStyle txtSubMenu = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(16),
  );

  static TextStyle txtTitleButton = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(14),
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle txtTitle = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(14),
    color: Colors.black,
  );
  static TextStyle txtTitleDialog = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(16),
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle txtContent = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(12),
    color: Colors.black,
  );
  static TextStyle txtTitleAppBar = txt11pt.copyWith(
    fontSize: Responsive.getHeightSize(14),
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

MaterialColor getMaterialColor(Color color) {
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
