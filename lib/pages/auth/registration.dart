import 'package:flutter/material.dart';
import '../../core/imports.dart';
import '../../core/functions.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AssetPaths.getImagePath('registration-cover.jpg'),
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
