// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobility_app/core/assets/functions.dart';

class FeaturedJobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String salary;
  final String location;
  final List<String> jobTags;
  final String logoPath;

  const FeaturedJobCard({super.key, 
    required this.companyName,
    required this.jobTitle,
    required this.salary,
    required this.location,
    required this.jobTags,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    final randomColor = Color.fromARGB(255, 19, 52, 109).withOpacity(0.8);
    return Container(
      width: 300.0,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(AssetPaths.getImagePath('group.png')),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(randomColor, BlendMode.colorBurn),
          opacity: 0.1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.0,
                backgroundImage: AssetImage(logoPath),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  jobTitle,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                Icons.bookmark_add,
                size: 24.0,
                color: Colors.white.withOpacity(0.5),
              )
            ],
          ),
          SizedBox(height: 12),
          Text(
            companyName,
            style: TextStyle(color: Colors.white70, fontSize: 16.0),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: jobTags.map((tag) => _buildTag(tag)).toList(),
          ),
          SizedBox(height: 16),
          Text(
            salary,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            location,
            style: TextStyle(color: Colors.white70, fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      margin: EdgeInsets.only(right: 6.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
