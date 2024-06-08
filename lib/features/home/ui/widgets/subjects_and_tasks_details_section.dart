import 'package:app_nest_task/core/strings_manager.dart';
import 'package:app_nest_task/core/theming/colors_manager.dart';
import 'package:app_nest_task/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/assets_manager.dart';

class SubjectsAndTasksDetailsSection extends StatelessWidget {
  const SubjectsAndTasksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: ColorsManager.subjectsAndTasksColors[index],
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                  color: ColorsManager.shadowColor.withOpacity(.1),
                  offset: const Offset(5, 3),
                  blurRadius: 8),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsManager.subjectsAndTasksIcons[index],
              ),
              verticalSpace(8),
              Text(
                StringsManager.subjectsAndTasksTitles[index],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: ColorsManager.blackColor,
                ),
              ),
              verticalSpace(10),
              Text(
                StringsManager.subjectsAndTasksSubtitles[index],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: ColorsManager.lightGrayColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
