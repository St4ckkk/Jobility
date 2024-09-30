import 'package:flutter/material.dart';
import 'package:jobility_app/screens/profileSetup/views/jobType.view.dart';
import '../../../screens/profileSetup/views/job_preferences.view.dart';
import '../../imports.dart';

class AppRoutes {
  // Keep the routes map private
  static final Map<String, WidgetBuilder> _routes = {
    '/': (_) => const HomePage(),
    '/splash': (_) => const SplashScreen(),
    '/registration': (_) => const RegistrationPage(),
    '/signin': (_) => const LoginPage(),
    '/signup': (_) => const RegistrationPage(),
    '/profile': (_) => const Profile(),
    '/roles': (_) => const RolePage(),
    '/dashboard': (_) => const Dashboard(),
    '/expertise': (_) => const ExpertiseSelectionPage(),
    '/job': (_) => const JobPage(),
    '/jobPreferences': (_) => const JobPreferencesPage(),
  };

  static Map<String, WidgetBuilder> get routes => _routes;
}
