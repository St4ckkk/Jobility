import 'package:flutter/material.dart';
import 'imports.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/registration':
        return MaterialPageRoute(builder: (_) => const RegistrationPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const RegistrationPage());
      case '/verification':
        return MaterialPageRoute(builder: (_) => const ProfileSetupPage());
      case '/roles':
        return MaterialPageRoute(builder: (_) => const RolePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
