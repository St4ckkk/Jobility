import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobility_app/modules/main.view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/router.dart';
import 'package:firebase_core/firebase_core.dart';
import './config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return GetMaterialApp( 
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.defaultRoute,
      getPages: AppRouter.routes, 
      home: const HomePage(), 
    );
  }
}
