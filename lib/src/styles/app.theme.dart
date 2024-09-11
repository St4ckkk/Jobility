// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class AppColors {
  static const Color backgroundColor = Color(0xFF0078FF);
  static const Color textColor = Color(0xFFFFFFFF);
}

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
  );
}
