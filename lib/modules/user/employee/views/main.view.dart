import 'package:flutter/material.dart';
import 'package:jobility_app/core/config/imports.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> jobCategories = [
    {
      'label': 'Remote Job',
      'count': '44.5k',
      'color': Colors.lightBlueAccent,
      'icon': Icons.work_outline,
    },
    {
      'label': 'Full Time',
      'count': '66.8k',
      'color': Colors.purpleAccent,
      'icon': Icons.schedule,
    },
    {
      'label': 'Part Time',
      'count': '38.9k',
      'color': Colors.orangeAccent,
      'icon': Icons.timer,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Transform.translate(
            offset: Offset(0, 16.0),
            child: CustomAppBar(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: _jobCategory(),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _jobCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Find Your Job',
            style: AppTypography.headlineMedium.copyWith(
              color: AppColors.darkColor,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: JobCategoryCard(
                label: jobCategories[0]['label'],
                count: jobCategories[0]['count'],
                color: jobCategories[0]['color'],
                icon: jobCategories[0]['icon'],
                cardHeight: 250.0,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  JobCategoryCard(
                    label: jobCategories[1]['label'],
                    count: jobCategories[1]['count'],
                    color: jobCategories[1]['color'],
                    icon: jobCategories[1]['icon'],
                    cardHeight: 120.0,
                  ),
                  const SizedBox(height: 12),
                  JobCategoryCard(
                    label: jobCategories[2]['label'],
                    count: jobCategories[2]['count'],
                    color: jobCategories[2]['color'],
                    icon: jobCategories[2]['icon'],
                    cardHeight: 120.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}