// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0078FF);
  static final Color primaryColor30 = primaryColor.withOpacity(0.3);
  static final Color orangeColor = Color(0xFFFF5C00);
  static final Color orangeColor30 = orangeColor.withOpacity(0.3);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color lightColor = Color(0xFFFFFFFF);

  static const Color darkColor = Color(0xFF000000);
  static const Color darkPrimaryColor = Color(0xFF130160);

  static const Color lightAccentColor = Color(0xFF524B6B);
  static const Color accentColor = Color(0xFFD9D9D9);
}

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
  );
}
