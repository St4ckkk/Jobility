// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'app.theme.dart';

class AppTypography {
  static TextStyle get headlineLarge => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      );

  static TextStyle get textSuperSmall => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: AppColors.darkColor,
      );

  static TextStyle get bodyLarge => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 16.0,
        color: AppColors.textColor,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 14.0,
        color: AppColors.textColor,
      );

  static TextStyle get bodySmall => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 12.0,
        color: AppColors.textColor,
      );

  static TextStyle get caption => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 11.0,
        color: AppColors.textColor,
      );

  

  static TextStyle get buttonText => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      );

  static TextStyle get subtitleLarge => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      );

  static TextStyle get subtitleSmall => TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      );
}
