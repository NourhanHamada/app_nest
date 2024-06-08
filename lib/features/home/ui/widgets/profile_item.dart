import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/assets_manager.dart';

class ProfileItem extends StatelessWidget {
  final double? radius;
  final Color? backgroundColor;
  final String? image;

  const ProfileItem({
    super.key,
    this.radius,
    this.backgroundColor,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      radius: radius ?? 30.sp,
      child: Image.asset(
        image ??
        AssetsManager.profile,
      ),
    );
  }
}
