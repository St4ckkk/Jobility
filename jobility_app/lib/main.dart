import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSharedPreferences();
  runApp(const MainApp());
}

Future<void> initializeSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final lastRoute = prefs.getString('lastRoute');
  if (lastRoute != null) {
    AppRouter.defaultRoute = lastRoute;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/employeeDashboard',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}