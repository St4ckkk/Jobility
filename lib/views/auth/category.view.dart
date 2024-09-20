import 'package:flutter/material.dart';
import 'package:jobility_app/core/config/functions.dart';

import 'package:jobility_app/core/config/imports.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildCenteredLogo(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        AssetPaths.getImagePath('registration-cover.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildCenteredLogo(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.1,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(45.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Image.asset(
              AssetPaths.getImagePath('logo-big.png'),
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
