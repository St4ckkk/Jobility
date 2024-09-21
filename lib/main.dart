import 'package:flutter/material.dart';
import 'core/config/routes.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',  
      onGenerateRoute: AppRouter.generateRoute,  
    );
  }
}
