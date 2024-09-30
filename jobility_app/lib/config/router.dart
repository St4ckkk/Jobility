import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/config/routes/routes.dart';

class AppRouter {
  static String defaultRoute = '/profile';

  static final List<GetPage> routes = AppRoutes.routes.entries.map((entry) {
    return GetPage(
      name: entry.key,
      page: () => entry.value(Get.context!),
    );
  }).toList();

  static void navigateTo(String routeName) {
    Get.toNamed(routeName);
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
