import 'package:flutter/material.dart';
import 'package:jobility_app/core/imports.dart';

import '../../../core/assets/functions.dart';

class ExpertiseSelectionPage extends StatefulWidget {
  const ExpertiseSelectionPage({super.key});

  @override
  _ExpertiseSelectionPageState createState() => _ExpertiseSelectionPageState();
}

class _ExpertiseSelectionPageState extends State<ExpertiseSelectionPage> {
  final Map<String, bool> _expertiseSelections = {
    'Designer': false,
    'Developer': false,
    'Administrative': false,
    'Marketing': true,
    'Management': true,
    'Others': false,
  };

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(), 
          Padding(
            padding: AppLayout.marginLarge,
            child: Column(
              children: [
                _buildBackButton(),
                _buildHeaderText(),
                AppLayout.spaceMedium,
                Expanded(
                  child: _buildExpertiseSelection(),
                ),
                AppLayout.spaceMedium,
                _buildContinueButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPaths.getImagePath('registration-cover.jpg')),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Row(
      children: [
        IconButton(
          icon: Transform.scale(
            scale: 1.3,
            child: const Icon(Icons.arrow_back),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
    );
  }

  Widget _buildHeaderText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppLayout.spaceMedium,
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
    );
  }

  Widget _buildExpertiseSelection() {
    return ListView(
      children: _expertiseSelections.keys.map((String key) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ExpertiseCard(
            expertise: key,
            isSelected: _expertiseSelections[key] ?? false,
            onSelected: (bool isSelected) {
              setState(() {
                _expertiseSelections[key] = isSelected;
              });
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomButton(
        onPressed: () {
          print("Continue button pressed");
        },
        label: 'Continue',
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}

class ExpertiseCard extends StatefulWidget {
  final String expertise;
  final bool isSelected;
  final Function(bool) onSelected;

  const ExpertiseCard({
    super.key,
    required this.expertise,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _ExpertiseCardState createState() => _ExpertiseCardState();
}

class _ExpertiseCardState extends State<ExpertiseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(!widget.isSelected);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? AppColors.primaryColor.withOpacity(0.1)
              : Colors.white,
          border: Border.all(
            color: widget.isSelected
                ? AppColors.primaryColor
                : AppColors.accentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            _buildIconForExpertise(widget.expertise), 
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                widget.expertise,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            _buildCustomCheckIcon(
                widget.isSelected), // Moved checkbox to the right
          ],
        ),
      ),
    );
  }

  Widget _buildCustomCheckIcon(bool isSelected) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.accentColor,
        ),
        color: isSelected ? AppColors.primaryColor : Colors.white,
      ),
      child: isSelected
          ? const Icon(Icons.check, color: Colors.white, size: 16.0)
          : null,
    );
  }

  Widget _buildIconForExpertise(String expertise) {
    switch (expertise) {
      case 'Designer':
        return const Icon(Icons.design_services, color: Colors.blueAccent);
      case 'Developer':
        return const Icon(Icons.code, color: Colors.green);
      case 'Administrative':
        return const Icon(Icons.admin_panel_settings, color: Colors.orange);
      case 'Marketing':
        return const Icon(Icons.campaign, color: Colors.redAccent);
      case 'Management':
        return const Icon(Icons.manage_accounts, color: Colors.purple);
      case 'Others':
        return const Icon(Icons.more_horiz, color: Colors.grey);
      default:
        return const Icon(Icons.help_outline, color: Colors.black);
    }
  }
}
