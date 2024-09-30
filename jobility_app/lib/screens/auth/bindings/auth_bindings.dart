// auth_binding.dart

import 'package:get/get.dart';
import '../controllers/auth_controllers.dart'; 

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => _createAuthController(), 
    );
  }

  AuthController _createAuthController() {
    return AuthController(); 
  }
}