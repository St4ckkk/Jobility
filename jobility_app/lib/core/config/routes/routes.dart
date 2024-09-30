import 'package:flutter/material.dart';
import '../../imports.dart';

class AppRoutes {
  // Keep the routes map private
  static final Map<String, WidgetBuilder> _routes = {
    '/': (_) => const HomePage(),
    '/splash': (_) => const SplashScreen(),
    '/registration': (_) => const RegistrationPage(),
    '/signin': (_) => const LoginPage(),
    '/signup': (_) => const RegistrationPage(),
    '/profileSetup': (_) => const ProfileSetupPage(),
    '/roles': (_) => const RolePage(),
    '/employeeDashboard': (_) => const EmployeeDashboard(),
  };

  static Map<String, WidgetBuilder> get routes => _routes;
}
