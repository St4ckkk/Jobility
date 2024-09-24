import 'package:flutter/material.dart';
import '../../../../core/config/imports.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  int _selectedIndex = 0;

  // Array of featured jobs
  final List<Map<String, dynamic>> featuredJobs = [
    {
      'companyName': 'Facebook',
      'jobTitle': 'Software Engineer',
      'salary': '\$180,000/year',
      'location': 'California, USA',
      'jobTags': ['IT', 'Full-Time', 'Junior'],
      'logoPath': 'assets/facebook_logo.png',
    },
    {
      'companyName': 'Google',
      'jobTitle': 'UI/UX Designer',
      'salary': '\$160,000/year',
      'location': 'New York, USA',
      'jobTags': ['Design', 'Full-Time', 'Mid-Level'],
      'logoPath': 'assets/google_logo.png',
    },
    {
      'companyName': 'Amazon',
      'jobTitle': 'Data Scientist',
      'salary': '\$150,000/year',
      'location': 'Seattle, USA',
      'jobTags': ['Data', 'Full-Time', 'Senior'],
      'logoPath': 'assets/amazon_logo.png',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> jobCategories = [
    {
      'label': 'Remote Job',
      'count': '44.5k',
      'gradient': LinearGradient(
        colors: [Colors.blue.shade900, Colors.blueAccent.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'icon': Icons.work_outline,
    },
    {
      'label': 'Full Time',
      'count': '66.8k',
      'gradient': LinearGradient(
        colors: [Colors.purple.shade900, Colors.purpleAccent.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'icon': Icons.schedule,
    },
    {
      'label': 'Part Time',
      'count': '38.9k',
      'gradient': LinearGradient(
        colors: [Colors.orange.shade900, Colors.orangeAccent.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
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
            offset: const Offset(0, 16.0),
            child: CustomAppBar(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _jobCategory(),
              const SizedBox(height: 30),
              FeaturedJobsView(featuredJobs: featuredJobs),
              const SizedBox(height: 30),
              RecommendedJobs(),
            ],
          ),
        ),
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
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Find Your Job',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
                gradient: jobCategories[0]['gradient'], 
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
                    gradient: jobCategories[1]['gradient'], 
                    icon: jobCategories[1]['icon'],
                    cardHeight: 120.0,
                  ),
                  const SizedBox(height: 12),
                  JobCategoryCard(
                    label: jobCategories[2]['label'],
                    count: jobCategories[2]['count'],
                    gradient: jobCategories[2]['gradient'], 
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

  // Featured Jobs Section
}
