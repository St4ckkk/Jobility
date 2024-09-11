import 'package:flutter/material.dart';
import 'routes.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',  
      onGenerateRoute: AppRouter.generateRoute,  
    );
  }
}
