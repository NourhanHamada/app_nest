import 'package:flutter/material.dart';

class CustomBottomNavBarItem {
  final String title;
  final String iconName;
  final String disableIconName;
  final bool Function(BuildContext context)? condition;
  CustomBottomNavBarItem({
    required this.disableIconName,
    required this.title,
    required this.iconName,
    this.condition,
  });
}
