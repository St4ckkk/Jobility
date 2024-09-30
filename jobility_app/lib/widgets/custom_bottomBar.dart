import 'package:flutter/material.dart';
import 'package:jobility_app/core/imports.dart';

class CustomBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final double height;
  final double iconHeight;
  final double iconWidth;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.height = 70.0,
    this.iconHeight = 30.0,
    this.iconWidth = 30.0,
  });

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
            offset: const Offset(0, -3), 
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
          items: [
            _createItem(Icons.home, 'Home'),
            _createItem(Icons.group, 'My Network'),
            _createItem(Icons.add_box, 'Post'),
            _createItem(Icons.notifications, 'Notifications'),
            _createItem(Icons.work, 'Jobs'),
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

  BottomNavigationBarItem _createItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: widget.iconWidth,
        height: widget.iconHeight,
        child: Icon(icon, size: widget.iconHeight),
      ),
      label: label,
    );
  }
}