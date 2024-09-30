import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onSuffixIconPress;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.errorText,
    this.suffixIcon,
    this.prefixIcon,
    this.onSuffixIconPress,
    this.onChanged,
    this.keyboardType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          errorText: errorText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon, // Add this line for prefixIcon
        ),
        onChanged: onChanged,
      ),
    );
  }
}
