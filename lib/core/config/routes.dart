import 'package:flutter/material.dart';
import 'imports.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> _routes = {
    '/': (_) => const HomePage(),
    '/splash': (_) => const SplashScreen(),
    '/registration': (_) => const RegistrationPage(),
    '/signin': (_) => const LoginPage(),
    '/signup': (_) => const RegistrationPage(),
    '/verification': (_) => const ProfileSetupPage(),
    '/roles': (_) => const RolePage(),
  };

  static final Map<String, WidgetBuilder> _authRoutes = {
    '/signin': (_) => const LoginPage(),
    '/signup': (_) => const RegistrationPage(),
    '/verification': (_) => const ProfileSetupPage(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (_authRoutes.containsKey(settings.name)) {
      return MaterialPageRoute(builder: _authRoutes[settings.name]!);
    } else {
      return MaterialPageRoute(builder: _routes[settings.name] ?? (_) => const HomePage());
    }
  }
}