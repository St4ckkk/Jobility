class Validator {
  static bool email(String value) {
    final emailPattern = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailPattern.hasMatch(value);
  }

  static bool password(String value) {
    return value.isNotEmpty && value.length >= 8; 
  }
}
