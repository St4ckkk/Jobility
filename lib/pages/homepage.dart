import 'package:flutter/material.dart';
import 'package:jobility_app/core/Functions.dart';
import '../core/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.6), 
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Image.asset(
                  AssetPaths.getImagePath('header.png'),
                  height: AppLayout.imageLarge,
                  width: AppLayout.imageLarge,
                  fit: BoxFit.contain,
                ),
                AppLayout.spaceSmall,
                Align(
                  alignment: Alignment.centerLeft, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: AppTypography.headlineLarge.copyWith(
                            color: AppColors.darkColor,
                          ),
                        ),
                        Text(
                          'Jobility',
                          style: AppTypography.headlineLarge.copyWith(
                            color: AppColors.primaryColor, 
                          ),
                        ),
                        AppLayout.spaceSmall,
                        Text(
                          'Helping Differently-Abled Individuals Connect with Accessible Job Opportunities',
                          style: AppTypography.subtitleSmall.copyWith(
                            color: AppColors.darkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: AppLayout.marginLarge,
              child: Text(
                'Jobility',
                style: AppTypography.headlineSmall.copyWith(
                  color: AppColors.darkColor,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: AppLayout.paddingLarge,
              child: FloatingActionButton(
                onPressed: () {
                  // Action for button press
                },
                backgroundColor: AppColors.darkPrimaryColor,
                child: Icon(Icons.arrow_forward, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: AppLayout.borderRadiusLarge, 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
