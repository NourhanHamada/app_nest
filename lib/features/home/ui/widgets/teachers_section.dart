import 'package:app_nest_task/core/theming/colors_manager.dart';
import 'package:app_nest_task/core/widgets/main_button.dart';
import 'package:app_nest_task/core/widgets/space.dart';
import 'package:app_nest_task/features/home/ui/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_screen_title.dart';

class TeachersSection extends StatelessWidget {
  const TeachersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeScreenTitle(
          text: 'المعلمين',
          onTap: () {},
        ),
        SizedBox(
          height: 400,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: .74,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  border: Border.all(
                    color: ColorsManager.darkBlueColor.withOpacity(.2),
                  ),
                  color: ColorsManager.lighterGrayColor,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                child: Column(
                  children: [
                    const ProfileItem(),
                    verticalSpace(8),
                    Text(
                      'احمد مجدي',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorsManager.darkBlueColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpace(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: MainButton(
                        text: 'متابعة',
                        onTap: () {},
                        backgroundColor: ColorsManager.primaryColor,
                        height: 30.h,
                        radius: 8.w,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
