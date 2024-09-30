import 'package:flutter/material.dart';
import '../../../core/imports.dart';
import '../../../core/functions.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  bool _isObscure = true;

  void _navigateToSignIn(BuildContext context) {
    Navigator.pushNamed(context, '/signup');
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
                    _buildHeader(),
                    AppLayout.spaceMedium,
                    _buildSignInText(),
                    AppLayout.spaceMedium,
                    _buildSocialMediaButtons(),
                    AppLayout.spaceMedium,
                    _buildDivider(),
                    AppLayout.spaceMedium,
                    _buildFormFields(),
                    AppLayout.spaceSmall,
                    _buildRememberMeRow(),
                    AppLayout.spaceSmall,
                    _buildForgotPasswordButton(),
                    AppLayout.spaceMedium,
                    _buildContinueButton(),
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

  Widget _buildHeader() {
    return Row(
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
    );
  }

  Widget _buildSignInText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign in',
          style: AppTypography.subtitleLarge.copyWith(
            color: AppColors.darkColor,
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'or Join ',
            style: AppTypography.caption.copyWith(
              color: AppColors.lightAccentColor,
              fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text: 'Jobility',
                style: AppTypography.caption.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, '/signup');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialMediaButtons() {
    return Column(
      children: [
        _buildSocialMediaButton(
          imagePath: 'google.png',
          label: 'Continue with Google',
          onPressed: () {}, // Add your Google login action here
        ),
        AppLayout.spaceSmall,
        _buildSocialMediaButton(
          imagePath: 'facebook.png',
          label: 'Continue with Facebook',
          onPressed: () {}, // Add your Facebook login action here
        ),
      ],
    );
  }

  Widget _buildSocialMediaButton({
    required String imagePath,
    required String label,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: AppLayout.buttonHeightMedium,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          AssetPaths.getImagePath(imagePath),
          width: AppLayout.imageSmall,
          height: AppLayout.imageSmall,
          fit: BoxFit.contain,
        ),
        label: Text(
          label,
          style: AppTypography.buttonText.copyWith(
            color: AppColors.darkColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightColor,
          shape: const RoundedRectangleBorder(
            borderRadius: AppLayout.borderRadiusLarge,
            side: BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
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
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildTextField(
          labelText: 'Email or Phone*',
          keyboardType: TextInputType.emailAddress,
        ),
        AppLayout.spaceSmall,
        _buildTextField(
          labelText: 'Password*',
          obscureText: _isObscure,
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: AppColors.lightAccentColor,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String labelText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 212, 209, 209).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
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
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }

  Widget _buildRememberMeRow() {
    return Row(
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
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
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
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
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
    );
  }
}
