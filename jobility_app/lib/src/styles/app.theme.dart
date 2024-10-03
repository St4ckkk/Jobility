// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0078FF);
  static final Color primaryColor30 = primaryColor.withOpacity(0.3);
  static final Color orangeColor = Color(0xFFFF5C00);
  static final Color orangeColor30 = orangeColor.withOpacity(0.3);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color lightColor = Color(0xFFFFFFFF);
  static const Color grayAccentColor = Color(0xFF858484);
  static const Color grayColor = Color(0xFFE5E5E5);

  static const Color textDarkColor = Color(0xFF494A50);

  static const Color darkColor = Color(0xFF000000);
  static const Color darkPrimaryColor = Color(0xFF130160);

  static const Color lightAccentColor = Color(0xFF524B6B);
  static const Color accentColor = Color(0xFFD9D9D9);

  static const List<Color> cardColors = [
    Color(0xFF416AB9), // Darker blue
    Color(0xFF0066CC), // Darker cyan-blue
    Color(0xFFE65000), // Darker orange
    Color.fromARGB(255, 22, 21, 24), // Darker purple
    Color(0xFFB3B3B3), // Darker grey
    Color(0xFF345399), // Darker indigo
  ];
}

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
  );
}
