import 'package:app_nest_task/core/theming/assets_manager.dart';
import 'package:app_nest_task/core/theming/colors_manager.dart';
import 'package:app_nest_task/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'home_screen_title.dart';

class UserSubjectsSection extends StatelessWidget {
  const UserSubjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeScreenTitle(
          text: 'المواد الدراسية الخاصة بك',
          onTap: () {},
        ),
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
                left: 12.w,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Image.asset(
                          AssetsManager.subjectBackground,
                        ),
                      ),
                      Positioned(
                        top: 12.h,
                        right: 12.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                              horizontalSpace(6),
                              SvgPicture.asset(
                                AssetsManager.starIcon,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: const BoxDecoration(
                      color: ColorsManager.lighterGrayColor,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'رؤية الكل',
                              style: TextStyle(
                                color: ColorsManager.primaryColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SvgPicture.asset(
                              AssetsManager.saveItemIcon,
                              width: 18.w,
                              height: 18.h,
                            ),
                          ],
                        ),
                        verticalSpace(6),
                        Text(
                          'اسم الدورة التعليمية',
                          style: TextStyle(
                            color: ColorsManager.darkBlueColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        verticalSpace(6),
                        Text(
                          'تفاصيل الدورة التعليمية',
                          style: TextStyle(
                            color: ColorsManager.grayColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        verticalSpace(6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsManager.clockIcon,
                                  width: 18.w,
                                  height: 18.h,
                                ),
                                horizontalSpace(4),
                                Text(
                                  '3 ساعات',
                                  style: TextStyle(
                                    color: ColorsManager.grayColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetsManager.videoIcon,
                                  width: 18.w,
                                  height: 18.h,
                                ),
                                horizontalSpace(4),
                                Text(
                                  '12 دروس',
                                  style: TextStyle(
                                    color: ColorsManager.grayColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          ),
        ),
      ],
    );
  }
}
