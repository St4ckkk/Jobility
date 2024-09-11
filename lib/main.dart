import 'package:flutter/material.dart';
import 'routes.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',  // Set the initial route to splash screen
      onGenerateRoute: AppRouter.generateRoute,  // Use the router for route generation
    );
  }
}
