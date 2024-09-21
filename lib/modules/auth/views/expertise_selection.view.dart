import 'package:flutter/material.dart';
import 'package:jobility_app/core/config/imports.dart';

class ExpertiseSelectionPage extends StatefulWidget {
  @override
  _ExpertiseSelectionPageState createState() => _ExpertiseSelectionPageState();
}

class _ExpertiseSelectionPageState extends State<ExpertiseSelectionPage> {
  final Map<String, bool> _expertiseSelections = {
    'Accountants': false,
    'Software Developer': false,
    'Project Manager': false,
    'HR Specialist': false,
    'Data Scientist': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppLayout.marginLarge, // Add consistent padding
        child: Column(
          children: [
            _buildBackButton(),
            _buildHeaderText(),
            AppLayout.spaceLarge, // Add space between header and expertise list
            Expanded(
                child:
                    _buildExpertiseSelection()), // Use expanded for proper layout handling
          ],
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
            Navigator.pop(context); // Navigate back to previous page
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
}

class ExpertiseCard extends StatefulWidget {
  final String expertise;
  final bool isSelected;
  final Function(bool) onSelected;

  const ExpertiseCard({
    Key? key,
    required this.expertise,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

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
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.isSelected ? AppColors.primaryColor : AppColors.accentColor,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Checkbox(
              value: widget.isSelected,
              activeColor: AppColors.primaryColor,
              checkColor: Colors.white,
              onChanged: (bool? value) {
                widget.onSelected(value ?? false);
              },
            ),
            Text(
              widget.expertise,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.lightAccentColor,
                fontWeight: FontWeight.w800,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}