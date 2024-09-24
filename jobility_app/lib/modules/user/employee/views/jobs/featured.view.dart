import 'package:flutter/material.dart';
import '../../../../../core/config/imports.dart';

class FeaturedJobsView extends StatelessWidget {
  final List<Map<String, dynamic>> featuredJobs;

  const FeaturedJobsView({super.key, required this.featuredJobs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Featured Jobs',
                style: AppTypography.headlineSmall.copyWith(
                  color: AppColors.darkColor,
                )),
            GestureDetector(
              onTap: () {
                // Navigate to see all jobs page
              },
              child: Text(
                'See all',
                style: AppTypography.subtitleSmall.copyWith(
                  color: AppColors.grayAccentColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: featuredJobs.map((job) {
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: FeaturedJobCard(
                  companyName: job['companyName'],
                  jobTitle: job['jobTitle'],
                  salary: job['salary'],
                  location: job['location'],
                  jobTags: List<String>.from(job['jobTags']),
                  logoPath: job['logoPath'],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
