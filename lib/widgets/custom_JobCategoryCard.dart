import 'package:flutter/material.dart';

class JobCategoryCard extends StatelessWidget {
  final String label;
  final String count;
  final LinearGradient gradient;
  final IconData icon;
  final double cardHeight; // Add cardHeight parameter

  const JobCategoryCard({
    super.key,
    required this.label,
    required this.count,
    required this.gradient,
    required this.icon,
    this.cardHeight = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: cardHeight,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(height: 5),
          Text(
            count,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
