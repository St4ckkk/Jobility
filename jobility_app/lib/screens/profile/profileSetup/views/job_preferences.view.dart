import 'package:flutter/material.dart';
import 'package:jobility_app/core/imports.dart';

import '../../../../core/assets/functions.dart';

class JobPreferencesPage extends StatefulWidget {
  const JobPreferencesPage({super.key});

  @override
  State<JobPreferencesPage> createState() => _JobPreferencesPageState();
}

class _JobPreferencesPageState extends State<JobPreferencesPage> {
  final Map<String, bool> _jobRoleSelections = {
    'Product Designer': false,
    'Motion Designer': false,
    'UX Designer': false,
    'Graphics Designer': false,
    'Full-Stack Developer': false,
    'Developer': false,
  };

  final Map<String, bool> _locationSelections = {
    'Worldwide': false,
    'USA': false,
    'California': false,
    'San Jose': false,
    'New York': false,
    'Seattle': false,
  };

  final Map<String, bool> _jobTypeSelections = {
    'Any': true,
    'Full-Time': false,
    'Part-Time': false,
  };

  final Map<String, bool> _officeSelections = {
    'Any': true,
    'On-Site': false,
    'Remote': false,
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
                // _buildHeaderText(),
                AppLayout.spaceMedium,
                Expanded(
                  child: ListView(
                    children: [
                      _buildJobRolesSelection(),
                      AppLayout.spaceMedium,
                      _buildLocationSelection(),
                      AppLayout.spaceMedium,
                      _buildJobTypeSelection(),
                      AppLayout.spaceMedium,
                      _buildOfficeSelection(),
                    ],
                  ),
                ),
                AppLayout.spaceMedium,
                _buildSaveButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Keeping the background image implementation
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

  // Keeping the original back button implementation
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
          'Job Preferences',
          style: AppTypography.buttonText.copyWith(
            color: AppColors.darkColor,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  // Widget _buildHeaderText() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       AppLayout.spaceMedium,
  //       Container(
  //         child: Text(
  //           'Customize Your Job Search: Accessibility Preferences',
  //           style: AppTypography.headlineLarge.copyWith(
  //             color: AppColors.darkColor,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //       AppLayout.spaceSmall,
  //       Text(
  //         'Please select your preferred job roles, locations, job types, and office settings to find job opportunities that cater to your needs.',
  //         style: AppTypography.bodyMedium.copyWith(
  //           color: AppColors.darkColor,
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //     ],
  //   );
  // }

  Widget _buildJobRolesSelection() {
    return _buildSectionWithTitle(
      'Select Job Roles',
      _jobRoleSelections,
    );
  }

  Widget _buildLocationSelection() {
    return _buildSectionWithTitle(
      'Select Location',
      _locationSelections,
    );
  }

  Widget _buildJobTypeSelection() {
    return _buildSectionWithTitle(
      'Job Type',
      _jobTypeSelections,
    );
  }

  Widget _buildOfficeSelection() {
    return _buildSectionWithTitle(
      'Office',
      _officeSelections,
    );
  }

  Widget _buildSectionWithTitle(String title, Map<String, bool> selections) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: AppColors.darkColor,
          ),
        ),
        AppLayout.spaceSmall,
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 10.0,
          runSpacing: 10.0,
          children: selections.keys.map((String key) {
            return ChoiceChip(
              label: Text(key,
                  style: AppTypography.caption.copyWith(
                      color: selections[key] ?? false
                          ? AppColors.lightColor
                          : AppColors.grayAccentColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold)),
              selected: selections[key] ?? false,
              onSelected: (bool isSelected) {
                setState(() {
                  selections[key] = isSelected;
                  if (title == 'Job Type' || title == 'Office') {
                    selections.forEach((k, v) {
                      selections[k] = k == key;
                    });
                  }
                });
              },
              selectedColor: AppColors.primaryColor,
              labelStyle: TextStyle(
                fontSize: 12.0,
                color: selections[key] ?? false
                    ? Colors.white
                    : AppColors.darkColor,
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0), // Adjusted radius
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomButton(
        onPressed: () {
          print("Save button pressed");
        },
        label: 'Save',
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
