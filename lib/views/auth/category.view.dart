import 'package:flutter/material.dart';
import 'package:jobility_app/core/config/functions.dart';
import 'package:jobility_app/core/config/imports.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildCenteredLogo(context),
          _buildHeaderText(context),
          // _buildButtons(context),
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
}

Widget _buildHeaderText(BuildContext context) {
  return Positioned(
    top: MediaQuery.of(context).size.height * 0.1 + AppLayout.imageMedium + 20,
    left: 0,
    right: 0,
    child: Column(
      children: [
        Text(
          'Select a Job Category',
          style: AppTypography.headlineLarge.copyWith(
            fontSize: 35.0,
            color: AppColors.darkColor,
          ),
          textAlign: TextAlign.center,
        ),
        AppLayout.spaceSmall,
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              width: 380.0,
              child: Text(
                "Select whether you're seeking inclusive job opportunities or your organization is hiring skilled individuals with diverse abilities",
                style: AppTypography.subtitleSmall.copyWith(
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            )),
        AppLayout.spaceLarge,
        Container(
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
            Card(
              elevation: 0,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFD9D9D9), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: Container(
                width: 150,
                height: 200,
              ),
            ),
            SizedBox(width: 20),
            Card(
              elevation: 0,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFD9D9D9), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: Container(
                width: 150,
                height: 200,
              ),
            ),
          ],
        ),
        AppLayout.spaceMedium,
        SizedBox(
          width: 350,
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
      ],
    ),
  );
}
