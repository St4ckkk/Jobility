import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/config/routes/routes.dart'; 

class AppRouter {
  static String _defaultRoute = '/splash';

  static String get defaultRoute => _defaultRoute;

  static set defaultRoute(String value) => _defaultRoute = value;

  // Use routes from AppRoutes
  static final List<GetPage> routes = AppRoutes.routes.entries.map((entry) {
    return GetPage(
      name: entry.key,
      page: () => entry.value(Get.context!), 
    );
  }).toList();

  // Navigate to a route
  static void navigateTo(String routeName) {
    Get.toNamed(routeName);
  }

  // Store the last route in SharedPreferences
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

  static Future<void> navigateToLastRoute() async {
    final lastRoute = await _getLastRoute();
    if (lastRoute != null) {
      Get.offNamed(lastRoute);
    }
  }
}
