import 'package:flutter/material.dart';
import 'package:jobility_app/core/imports.dart';

// RecommendedJobs Widget
class RecommendedJobs extends StatelessWidget {
  final List<Map<String, dynamic>> recommendedJobs = [
    {
      'jobTitle': 'UX Designer',
      'company': 'Dribbble',
      'salary': '\$80,000/y',
      'icon': Icons.design_services,
      'backgroundColor': const Color(0xFFFEEFF4),
    },
    {
      'jobTitle': 'Sr Engineer',
      'company': 'Facebook',
      'salary': '\$96,000/y',
      'icon': Icons.engineering,
      'backgroundColor': const Color(0xFFF0F4FF),
    },
  ];

  RecommendedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recommended Jobs', style: AppTypography.headlineSmall.copyWith(
                color: AppColors.darkColor,
              )),
              GestureDetector(
                onTap: () {
                  // Add action for "See all"
                },
                child: Text(
                  'See all',
                  style: AppTypography.subtitleSmall.copyWith(
                    color: AppColors.grayAccentColor,
                  )
                ),
              ),
            ],
          ),
        ),
        // Jobs Row
        Row(
          children: recommendedJobs.map((job) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: job['backgroundColor'],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(job['icon'], size: 40, color: Colors.pink),
                      const SizedBox(height: 10),
                      Text(
                        job['jobTitle'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        job['company'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        job['salary'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
