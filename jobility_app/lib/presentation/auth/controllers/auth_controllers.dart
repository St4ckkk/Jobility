import 'package:get/get.dart';
import '../services/auth_services.dart';
import '../../../models/user_models.dart';
import 'package:jobility_app/core/utils/forms/forms.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final Forms _forms = Forms();

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxBool isLoading = false.obs;
  RxBool showPasswordField = false.obs;
  RxBool isObscure = true.obs;

  // Email validation
  void validateEmail(String email) {
    _forms.validate(email, ''); // Validate only email here
    emailError.value = _forms.errors()['email'] ?? '';
    showPasswordField.value = emailError.value.isEmpty;
  }

  // Password validation
  void validatePassword(String password) {
    _forms.validate('', password); // Validate only password here
    passwordError.value = _forms.errors()['password'] ?? '';
  }

  Future<bool> signUp(String email, String password) async {
    bool isValid =
        _forms.validate(email, password); 
    emailError.value = _forms.errors()['email'] ?? '';
    passwordError.value = _forms.errors()['password'] ?? '';

    if (isValid) {
      isLoading.value = true;

      final UserModel? result =
          await _authService.signUpWithEmail(email, password);

      isLoading.value = false;

      if (result != null) {
        Get.snackbar(
            "Signup Successful", "Welcome to the app, ${result.email}!");
        return true;
      } else {
        Get.snackbar("Signup Failed", "Please try again.");
        return false;
      }
    }
    return false;
  }

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }
}
