import '../../config/imports.dart';

class Forms {
  final Map<String, String> _errors = {};
  
  bool validate(String email, String password) {
    _errors.clear();

    if (!Validator.email(email)) {
      _errors['email'] = 'Please provide a valid email address.';
    }

    if (!Validator.password(password)) {
      _errors['password'] = 'Password must be at least 8 characters long.';
    }

    return _errors.isEmpty;
  }

  Map<String, String> errors() {
    return _errors;
  }
}
