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
  static const double imageSmall = 30.0;
  static const double imageMedium = 80.0;
  static const double imageLarge = 350.0;

  // Border radius
  static const BorderRadiusGeometry borderRadiusSmall =
      BorderRadius.all(Radius.circular(8.0));
  static const BorderRadiusGeometry borderRadiusMedium =
      BorderRadius.all(Radius.circular(16.0));
  static const BorderRadiusGeometry borderRadiusLarge =
      BorderRadius.all(Radius.circular(50.0));

  // Custom SizedBox spacers
  static const SizedBox spaceSmall = SizedBox(height: 8.0);
  static const SizedBox spaceMedium = SizedBox(height: 30.0);
  static const SizedBox spaceLarge = SizedBox(height: 60.0);

  static const SizedBox spaceSmallWidth = SizedBox(width: 8.0);
  static const SizedBox spaceMediumWidth = SizedBox(width: 40.0);
  static const SizedBox spaceLargeWidth = SizedBox(width: 60.0);

  // Button sizes
  static const double buttonHeightSmall = 40.0;
  static const double buttonHeightMedium = 50.0;
  static const double buttonHeightLarge = 60.0;

  static const double buttonWidthSmall = 120.0;
  static const double buttonWidthMedium = 150.0;
  static const double buttonWidthLarge = 200.0;


  // Getters for top margins and paddings
  static EdgeInsetsGeometry get marginTopSmall => const EdgeInsets.only(top: 8.0);
  static EdgeInsetsGeometry get marginTopMedium => const EdgeInsets.only(top: 16.0);
  static EdgeInsetsGeometry get marginTopLarge => const EdgeInsets.only(top: 24.0);

  static EdgeInsetsGeometry get paddingTopSmall => const EdgeInsets.only(top: 8.0);
  static EdgeInsetsGeometry get paddingTopMedium => const EdgeInsets.only(top: 16.0);
  static EdgeInsetsGeometry get paddingTopLarge => const EdgeInsets.only(top: 24.0);
}
