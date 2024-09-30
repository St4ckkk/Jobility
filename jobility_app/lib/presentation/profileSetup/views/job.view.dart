import 'package:flutter/material.dart';
import 'package:jobility_app/core/imports.dart';

import '../../../core/assets/functions.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  final Map<String, bool> _jobTypeSelections = {
    'Full-time': false,
    'Part-time': false,
    'Contract': false,
    'Internship': false,
    'Freelance': false,
  };

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
                  child: _buildJobTypeSelection(),
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
            'What type of job are you looking for?',
            style: AppTypography.headlineLarge.copyWith(
              color: AppColors.darkColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        AppLayout.spaceSmall,
        Container(
          child: Text(
            'Please select the type of job that suits you (You can select multiple)',
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

  Widget _buildJobTypeSelection() {
    return ListView(
      children: _jobTypeSelections.keys.map((String key) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ExpertiseCard(
            expertise: key,
            isSelected: _jobTypeSelections[key] ?? false,
            onSelected: (bool isSelected) {
              setState(() {
                _jobTypeSelections[key] = isSelected;
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
            _buildIconForJobType(widget.expertise),
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
            _buildCustomCheckIcon(widget.isSelected),
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

  Widget _buildIconForJobType(String jobType) {
    switch (jobType) {
      case 'Full-time':
        return const Icon(Icons.work, color: Colors.blueAccent);
      case 'Part-time':
        return const Icon(Icons.timer, color: Colors.green);
      case 'Contract':
        return const Icon(Icons.assignment, color: Colors.orange);
      case 'Internship':
        return const Icon(Icons.school, color: Colors.redAccent);
      case 'Freelance':
        return const Icon(Icons.laptop_mac, color: Colors.purple);
      default:
        return const Icon(Icons.help_outline, color: Colors.black);
    }
  }
}
