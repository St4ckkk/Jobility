import 'package:flutter/material.dart';
import '../core/imports.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor = AppColors.lightColor,
    this.textColor = AppColors.darkColor,
    this.borderColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppLayout.buttonHeightMedium,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: AppLayout.borderRadiusLarge,
            // side: BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          label,
          style: AppTypography.buttonText.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}