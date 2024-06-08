import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/assets_manager.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/space.dart';

class HomeScreenTitle extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const HomeScreenTitle({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 16.h,
                  width: 2.w,
                  decoration: const BoxDecoration(
                    color: ColorsManager.primaryColor,
                  ),
                ),
                horizontalSpace(6),
                Text(
                  text,
                  style: TextStyle(
                    color: ColorsManager.darkBlueColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    'رؤية الكل',
                    style: TextStyle(
                      color: ColorsManager.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  horizontalSpace(8),
                  SvgPicture.asset(
                    AssetsManager.arrowLeftIcon,
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(12),
      ],
    );
  }
}
