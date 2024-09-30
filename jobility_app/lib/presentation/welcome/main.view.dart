import 'package:flutter/material.dart';
import '../core/imports.dart';
import '../core/functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateToRegistration(BuildContext context) {
    Navigator.pushNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.2), 
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Image.asset(
                  AssetPaths.getImagePath('header.png'),
                  height: AppLayout.imageLarge,
                  width: AppLayout.imageLarge,
                  fit: BoxFit.contain,
                ),
                AppLayout.spaceMedium,
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
                onPressed: () => _navigateToRegistration(context),
                backgroundColor: AppColors.primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppLayout.borderRadiusLarge,
                ),
                child: const Icon(Icons.arrow_forward, color: AppColors.lightColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
