import 'package:flutter/material.dart';
import 'package:jobility_app/core/assets/functions.dart';
import 'package:jobility_app/core/imports.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  bool _isJobCardSelected = false;
  bool _isEmployeeCardSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildCenteredLogo(context),
          _buildHeaderText(context),
          _buildContinueButton(),
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

  Widget _buildCenteredLogo(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.1 - 20,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Image.asset(
              AssetPaths.getImagePath('logo-medium.png'),
              width: AppLayout.imageMedium,
              height: AppLayout.imageMedium,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Positioned(
      top:
          MediaQuery.of(context).size.height * 0.1 + AppLayout.imageMedium + 20,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            'Select a Job Category',
            style: AppTypography.headlineMedium.copyWith(
              fontSize: 32.0,
              color: AppColors.darkColor,
            ),
            textAlign: TextAlign.center,
          ),
          AppLayout.spaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              width: 380.0,
              child: Text(
                "Select whether you're seeking inclusive job opportunities or your organization is hiring skilled individuals with diverse abilities",
                style: AppTypography.subtitleSmall.copyWith(
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AppLayout.spaceLarge,
          const SizedBox(
            width: 350,
            child: Divider(
              color: Color(0xFFD9D9D9),
              thickness: 1,
            ),
          ),
          AppLayout.spaceLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildJobCard(),
              const SizedBox(width: 20),
              _buildEmployeeCard(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard() {
    return InkWell(
      onTap: () {
        setState(() {
          _isJobCardSelected = true;
          _isEmployeeCardSelected = false;
        });
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _isJobCardSelected
                ? AppColors.primaryColor
                : const Color(0xFFD9D9D9),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor30,
                  ),
                  child: Center(
                    child: Image.asset(
                      AssetPaths.getImagePath('suitcase.png'),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Find a Job',
                        style: AppTypography.subtitleSmall.copyWith(
                          color: AppColors.darkColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        'I want to find Job',
                        style: AppTypography.caption.copyWith(
                          fontSize: 12.0,
                          color: AppColors.grayAccentColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 150,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeCard() {
    return InkWell(
      onTap: () {
        setState(() {
          _isJobCardSelected = false;
          _isEmployeeCardSelected = true;
        });
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: _isEmployeeCardSelected
                ? AppColors.primaryColor
                : const Color(0xFFD9D9D9),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orangeColor30,
                  ),
                  child: Center(
                    child: Image.asset(
                      AssetPaths.getImagePath('avatar.png'),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Find an Employee',
                        style: AppTypography.subtitleSmall.copyWith(
                          color: AppColors.darkColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 100, // adjust the width as needed
                      child: Text(
                        'I want to find Employees',
                        style: AppTypography.caption.copyWith(
                          fontSize: 12.0,
                          color: AppColors.grayAccentColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 150,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 350,
          height: AppLayout.buttonHeightMedium,
          child: CustomButton(
            onPressed: () {
              // Add your Continue button action here
            },
            label: 'Continue',
            backgroundColor: AppColors.primaryColor,
            textColor: Colors.white,
            borderColor: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}