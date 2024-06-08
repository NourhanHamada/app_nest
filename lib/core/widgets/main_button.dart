import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors_manager.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final double? height;
  final double? radius;
  final Widget? child;

  const MainButton({
    super.key,
    this.text,
    required this.onTap,
    this.backgroundColor,
    this.height,
    this.radius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 39.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsManager.lightBlueColor,
          borderRadius: BorderRadius.circular(radius ?? 12.w),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: child ?? Center(
          child: Text(
            text ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
