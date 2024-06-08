import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/assets_manager.dart';
import '../../../../core/theming/colors_manager.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsManager.primaryColor,
      ),
      child: SvgPicture.asset(
        AssetsManager.menuIcon,
      ),
    );
  }
}
