import 'package:flutter/material.dart';
import 'package:jobility_app/core/config/imports.dart';

class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final double height;

  const CustomBottomBar(
      {Key? key,
      required this.currentIndex,
      required this.onTap,
      this.height = 70.0})
      : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: AppColors.lightColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3), // Shadow position
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'My Network',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Jobs',
            ),
          ],
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grayAccentColor,
          showUnselectedLabels: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
