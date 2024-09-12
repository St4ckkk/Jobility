import 'package:flutter/material.dart';
import '../../core/config/imports.dart';
import '../../core/config/functions.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  bool _isObscure = true; // New boolean to manage password visibility

  void _navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, '/registration');
  }

  void _navigateToForgotPassword(BuildContext context) {
    Navigator.pushNamed(
        context, '/forgot-password'); // Add route for Forgot Password
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
                      'Sign in',
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
                            text: 'Join Jobility',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _navigateToSignIn(context);
                              },
                          ),
                        ],
                      ),
                    ),
                    AppLayout.spaceMedium,
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
                    AppLayout.spaceMedium,
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
                    AppLayout.spaceMedium,
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
                        decoration: InputDecoration(
                          labelText: 'Email or Phone',
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
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    AppLayout.spaceSmall,
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
                        obscureText: _isObscure, // Password visibility toggle
                        decoration: InputDecoration(
                          labelText: 'Password',
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
                                _isObscure =
                                    !_isObscure; 
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    AppLayout.spaceSmall,
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'Remember me.',
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.lightAccentColor,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Learn more',
                                  style: AppTypography.bodySmall.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Add your 'Learn more' navigation or action here
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppLayout.spaceSmall,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          _navigateToForgotPassword(context);
                        },
                        child: Text(
                          'Forgot password?',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    AppLayout.spaceMedium,
                    SizedBox(
                      width: double.infinity,
                      height: AppLayout.buttonHeightMedium,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your Continue button action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: AppLayout.borderRadiusLarge,
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: AppTypography.buttonText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    AppLayout.spaceMedium,
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
