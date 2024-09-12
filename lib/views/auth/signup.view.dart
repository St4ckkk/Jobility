import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/config/imports.dart';
import '../../core/config/functions.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _showPasswordField = false;
  bool _isObscure = true;
  String? _emailError;
  String? _passwordError;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginForm _loginForm = LoginForm();

  void _validateEmail(String value) {
    setState(() {
      _loginForm.validate(value, _passwordController.text);
      _emailError = _loginForm.errors()['email'];

      // Show the password field if the email is valid
      _showPasswordField = _emailError == null;
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _loginForm.validate(_emailController.text, value);
      _passwordError = _loginForm.errors()['password'];
    });
  }

  void _onAgreeAndJoinPressed() {
    setState(() {
      _loginForm.validate(_emailController.text, _passwordController.text);
      _emailError = _loginForm.errors()['email'];
      _passwordError = _loginForm.errors()['password'];

      // Navigate to the verification page if both email and password are valid
      if (_emailError == null && _passwordError == null) {
        Navigator.pushNamed(context, '/verification');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AssetPaths.getImagePath('registration-cover.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: AppLayout.marginLarge,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Jobility',
                          style: AppTypography.headlineSmall.copyWith(
                            color: AppColors.darkColor,
                          ),
                        ),
                        AppLayout.spaceSmallWidth,
                        Image.asset(
                          AssetPaths.getImagePath('light-logo.png'),
                          width: AppLayout.imageSmall,
                          height: AppLayout.imageSmall,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                      ],
                    ),
                    AppLayout.spaceMedium,
                    Text(
                      'Join Jobility',
                      style: AppTypography.subtitleLarge.copyWith(
                        color: AppColors.darkColor,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'or ',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.lightAccentColor,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/signin');
                              },
                          ),
                        ],
                      ),
                    ),
                    AppLayout.spaceMedium,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 212, 209, 209)
                                .withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email or Phone*',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          errorText: _emailError,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: _validateEmail,
                      ),
                    ),
                    AppLayout.spaceSmall,
                    if (_showPasswordField) ...[
                      AppLayout.spaceSmall,
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 212, 209, 209)
                                  .withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            labelText: 'Password*',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.lightAccentColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            errorText: _passwordError,
                          ),
                          onChanged: _validatePassword,
                        ),
                      ),
                    ],
                    AppLayout.spaceSmall,
                    SizedBox(
                      width: double.infinity,
                      height: AppLayout.buttonHeightMedium,
                      child: ElevatedButton(
                        onPressed: _onAgreeAndJoinPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: AppLayout.borderRadiusLarge,
                          ),
                        ),
                        child: Text(
                          'Agree & Join',
                          style: AppTypography.buttonText.copyWith(
                            color: AppColors.lightColor,
                          ),
                        ),
                      ),
                    ),
                    AppLayout.spaceSmall,
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColors.accentColor,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'or',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.lightAccentColor,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.accentColor,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    AppLayout.spaceSmall,
                    SizedBox(
                      width: double.infinity,
                      height: AppLayout.buttonHeightMedium,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Image.asset(
                          AssetPaths.getImagePath('google.png'),
                          width: AppLayout.imageSmall,
                          height: AppLayout.imageSmall,
                          fit: BoxFit.contain,
                        ),
                        label: Text(
                          'Continue with Google',
                          style: AppTypography.buttonText.copyWith(
                            color: AppColors.darkColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: AppLayout.borderRadiusLarge,
                              side: BorderSide(color: AppColors.primaryColor)),
                        ),
                      ),
                    ),
                    AppLayout.spaceSmall,
                    SizedBox(
                      width: double.infinity,
                      height: AppLayout.buttonHeightMedium,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Image.asset(
                          AssetPaths.getImagePath('facebook.png'),
                          width: AppLayout.imageSmall,
                          height: AppLayout.imageSmall,
                          fit: BoxFit.contain,
                        ),
                        label: Text(
                          'Continue with Facebook',
                          style: AppTypography.buttonText.copyWith(
                            color: AppColors.darkColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: AppLayout.borderRadiusLarge,
                              side: BorderSide(color: AppColors.primaryColor)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
