import 'package:flutter/material.dart';
import 'package:jobility_app/core/config/imports.dart';

class ExpertiseSelectionPage extends StatefulWidget {
  const ExpertiseSelectionPage({super.key});

  @override
  _ExpertSelectionPageState createState() => _ExpertSelectionPageState();
}

class _ExpertSelectionPageState extends State<ExpertiseSelectionPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Row(
              children: [
                IconButton(
                  icon: Transform.scale(
                    scale: 1.3,
                    child: Icon(Icons.arrow_back),
                  ),
                  onPressed: () {},
                ),
                AppLayout.spaceSmallWidth,
                Text(
                  'Back',
                  style: AppTypography.buttonText.copyWith(
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          _buildHeaderText(),
        ],
      ),
    );
  }

  Widget _buildHeaderText() {
    return Padding(
      padding: AppLayout.marginLarge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppLayout.spaceLarge,
          Container(
            child: Text(
              'What is your Field of Expertise?',
              style: AppTypography.headlineLarge.copyWith(
                color: AppColors.darkColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          AppLayout.spaceSmall,
          Container(
            child: Text(
              'Please select your field of expertise (Up to 5)',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.lightAccentColor,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
