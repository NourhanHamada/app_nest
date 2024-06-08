import 'package:app_nest_task/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../theming/colors_manager.dart';
import '../../domain/entities/custom_bottom_nav_item.dart';

class CustomBottomNavBarItemWidget extends StatelessWidget {
  const CustomBottomNavBarItemWidget({
    super.key,
    required this.navBarItem,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final CustomBottomNavBarItem navBarItem;
  final String title;
  final VoidCallback onTap;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          isSelected ? navBarItem.iconName : navBarItem.disableIconName,
        ),
        verticalSpace(6),
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: isSelected ? ColorsManager.primaryColor : ColorsManager.grayColor,
          ),
        ),
      ],
    );
  }
}
