import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/imports.dart';

class AppRouter {
  static String _defaultRoute = '/splash';

  static String get defaultRoute => _defaultRoute;

  static set defaultRoute(String value) => _defaultRoute = value;
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
    _storeCurrentRoute(settings.name);
    if (_authRoutes.containsKey(settings.name)) {
      return MaterialPageRoute(builder: _authRoutes[settings.name]!);
    } else {
      return MaterialPageRoute(
          builder: _routes[settings.name] ?? (_) => const HomePage());
    }
  }

  static Future<void> _storeCurrentRoute(String? routeName) async {
    if (routeName != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('lastRoute', routeName);
    }
  }

  static Future<String?> _getLastRoute() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastRoute');
  }

  static Future<void> navigateToLastRoute(BuildContext context) async {
    final lastRoute = await _getLastRoute();
    if (lastRoute != null) {
      Navigator.pushReplacementNamed(context, lastRoute);
    }
  }
}
