import 'package:flutter/material.dart';

class AppLayout {
  // Margins
  static const EdgeInsetsGeometry marginSmall = EdgeInsets.all(8.0);
  static const EdgeInsetsGeometry marginMedium = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry marginLarge = EdgeInsets.all(24.0);

  // Paddings
  static const EdgeInsetsGeometry paddingSmall = EdgeInsets.all(8.0);
  static const EdgeInsetsGeometry paddingMedium = EdgeInsets.all(16.0);
  static const EdgeInsetsGeometry paddingLarge = EdgeInsets.all(24.0);

  // Image sizes
  static const double imageSmall = 60.0;
  static const double imageMedium = 100.0;
  static const double imageLarge = 400.0;

  // Border radius
  static const BorderRadiusGeometry borderRadiusSmall =
      BorderRadius.all(Radius.circular(8.0));
  static const BorderRadiusGeometry borderRadiusMedium =
      BorderRadius.all(Radius.circular(16.0));
  static const BorderRadiusGeometry borderRadiusLarge =
      BorderRadius.all(Radius.circular(50.0));

  // Custom SizedBox spacers
  static const SizedBox spaceSmall = SizedBox(height: 8.0);
  static const SizedBox spaceMedium = SizedBox(height: 40.0);
  static const SizedBox spaceLarge = SizedBox(height: 60.0);
}
