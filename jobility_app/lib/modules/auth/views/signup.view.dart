import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/imports.dart';
import '../../../core/config/functions.dart';
import '../controllers/auth_controllers.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildHeader(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        AssetPaths.getImagePath('registration-cover.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: AppLayout.marginLarge,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(),
              AppLayout.spaceMedium,
              _buildHeaderText(),
              _buildSignInLink(),
              AppLayout.spaceMedium,
              _buildEmailFormField(),
              Obx(() {
                return _authController.showPasswordField.value
                    ? Column(
                        children: [
                          AppLayout.spaceSmall,
                          _buildPasswordFormField(),
                        ],
                      )
                    : const SizedBox.shrink();
              }),
              AppLayout.spaceSmall,
              _buildAgreeAndJoinButton(),
              AppLayout.spaceSmall,
              _buildOrDivider(),
              AppLayout.spaceSmall,
              _buildGoogleButton(),
              AppLayout.spaceSmall,
              _buildFacebookButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
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

  Widget _buildHeaderText() {
    return Text(
      'Join Jobility',
      style: AppTypography.subtitleLarge.copyWith(
        color: AppColors.darkColor,
      ),
    );
  }

  Widget _buildSignInLink() {
    return Text.rich(
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
    );
  }

  Widget _buildFormContainer(Widget child) {
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
      child: child,
    );
  }

  Widget _buildEmailFormField() {
    return Obx(() {
      return _buildFormContainer(
        CustomTextFormField(
          controller: _emailController,
          labelText: 'Email or Phone*',
          errorText: _authController.emailError.value.isEmpty
              ? null
              : _authController.emailError.value, // Display error
          onChanged: (value) {
            _authController.validateEmail(value); // Call validation on change
          },
        ),
      );
    });
  }

  Widget _buildPasswordFormField() {
    return _buildFormContainer(
      Obx(() {
        return CustomTextFormField(
          controller: _passwordController,
          labelText: 'Password*',
          obscureText: _authController.isObscure.value,
          errorText: _authController.passwordError.value.isEmpty
              ? null
              : _authController.passwordError.value, // Display password error
          suffixIcon: GestureDetector(
            onTap: _authController.togglePasswordVisibility,
            child: Icon(
              _authController.isObscure.value
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: AppColors.darkColor,
            ),
          ),
          onChanged: (value) {
            _authController
                .validatePassword(value); // Call password validation on change
          },
        );
      }),
    );
  }

  Widget _buildAgreeAndJoinButton() {
    return SizedBox(
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
    );
  }

  void _onAgreeAndJoinPressed() async {
    // Call sign up and wait for the result
    bool success = await _authController.signUp(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    // Navigate to verification page if successful
    if (success) {
      Get.toNamed('/profileSetup');
    } else {
      print("Sign-up failed. Please try again.");
    }
  }

  Widget _buildOrDivider() {
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

  Widget _buildSocialButton(String assetPath, String text) {
    return SizedBox(
      width: double.infinity,
      height: AppLayout.buttonHeightMedium,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Image.asset(
          AssetPaths.getImagePath(assetPath),
          width: AppLayout.imageSmall,
          height: AppLayout.imageSmall,
          fit: BoxFit.contain,
        ),
        label: Text(
          text,
          style: AppTypography.buttonText.copyWith(
            color: AppColors.darkColor,
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleButton() =>
      _buildSocialButton('google.png', 'Continue with Google');

  Widget _buildFacebookButton() =>
      _buildSocialButton('facebook.png', 'Continue with Facebook');
}
