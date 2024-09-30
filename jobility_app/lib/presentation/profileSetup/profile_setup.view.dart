import 'package:flutter/material.dart';
import '../../core/imports.dart';
import '../../core/functions.dart';
import 'package:flutter/gestures.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  _ProfileSetupPageState createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  bool _isChecked = false;

  void _navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, '/signin');
  }

  void _navigateToForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/forgot-password');
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
                                _navigateToSignIn(context);
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
                        decoration: InputDecoration(
                          labelText: 'First name*',
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
                          labelText: 'Last name*',
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
                    AppLayout.spaceMedium,
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
