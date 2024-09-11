import 'package:flutter/material.dart';
import '../../core/imports.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: Text(
          'Registration Page Content',
          style: AppTypography.headlineLarge,
        ),
      ),
    );
  }
}
