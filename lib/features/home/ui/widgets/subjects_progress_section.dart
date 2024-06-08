import 'package:app_nest_task/core/theming/assets_manager.dart';
import 'package:app_nest_task/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/main_button.dart';

class SubjectsProgress extends StatelessWidget {
  const SubjectsProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 181.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.lighterBlueColor,
        borderRadius: BorderRadius.circular(30.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 12.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحبا،',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.darkBlueColor,
                  ),
                ),
                verticalSpace(12),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3.3,
                  child: Text(
                    'تابع تقدمك في المواد',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.darkBlueColor,
                    ),
                  ),
                ),
                verticalSpace(10),
                MainButton(
                  text: 'موادك الدراسية',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 26.h,
              bottom: 13.h,
              left: 8.w,
            ),
            child: Image.asset(
              AssetsManager.subjectProgress,
            ),
          ),
        ],
      ),
    );
  }
}
