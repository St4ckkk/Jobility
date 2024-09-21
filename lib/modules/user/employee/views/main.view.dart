import 'package:flutter/material.dart';
import 'package:jobility_app/core/config/functions.dart';
import 'package:jobility_app/core/config/imports.dart'; 

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), 
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0), 
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _avatar(),
            ),
            title: _searchBar(),
            actions: [
              IconButton(
                icon: Image.asset(
                  AssetPaths.getImagePath('filter.png'), 
                  width: 30.0,
                  height: 30.0,
                ),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Stack(
                  children: [
                    Image.asset(
                      AssetPaths.getImagePath('speech-bubble.png'),
                      width: 30.0,
                      height: 30.0,
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0, 
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(),
      ),
    );
  }

  Widget _avatar() {
    return CircleAvatar(
      backgroundImage: AssetImage(AssetPaths.getImagePath('profile.png')),  
    );
  }

  Widget _searchBar() {
    return Container(
      height: 45.0,
      width: 1000.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentColor,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search a Job',
          border: InputBorder.none,
        ),
        
      ),
      
    );
  }
}
