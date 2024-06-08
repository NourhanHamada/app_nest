import 'package:app_nest_task/features/home/ui/widgets/profile_item.dart';
import 'package:app_nest_task/features/home/ui/widgets/search_bar_section.dart';
import 'package:app_nest_task/features/home/ui/widgets/subjects_progress_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/assets_manager.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/space.dart';

Widget appBarCustom(
  context,
  String code,
  ScrollController scrollController,
  Color backgroundColor,
) =>
    SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 2.6,
      collapsedHeight: 70.h,
      floating: true,
      pinned: true,
      backgroundColor: backgroundColor,
      stretchTriggerOffset: .5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.w),
      ),
      leading: const ProfileItem(
        image: AssetsManager.memoji,
        backgroundColor: ColorsManager.lightBlueColor,
      ),
      leadingWidth: 80.w,
      titleSpacing: 4.w,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الاء احمد محمد',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          verticalSpace(8),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: code)).then((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: ColorsManager.grayColor5,
                    content: Center(
                      child: Text(
                        'تم نسخ الكود',
                      ),
                    ),
                  ),
                );
              });
            },
            child: Row(
              children: [
                Text(
                  'نسخ الكود',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                  ),
                  child: SvgPicture.asset(
                    AssetsManager.copyIcon,
                  ),
                ),
                Text(
                  code,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.lighterBlueColor.withOpacity(.2),
            ),
            padding: EdgeInsets.all(8.h),
            child: SvgPicture.asset(
              AssetsManager.notificationIcon,
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.w),
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    ColorsManager.blueColor,
                    ColorsManager.primaryColor
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SearchBarSection(),
                  verticalSpace(12),
                  const SubjectsProgress(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
