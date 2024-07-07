import 'package:flutter/material.dart';

import 'colors.dart';

class LightTheme {
  final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.getMaterialColor(AppColors.kPrimary),
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundAppBar,
    ),
    buttonTheme: const ButtonThemeData(),
  );
}
