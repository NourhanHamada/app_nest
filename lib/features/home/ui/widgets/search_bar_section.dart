import 'package:app_nest_task/core/theming/assets_manager.dart';
import 'package:app_nest_task/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarSection extends StatefulWidget {
  const SearchBarSection({super.key});

  @override
  State<SearchBarSection> createState() => _SearchBarSectionState();
}

class _SearchBarSectionState extends State<SearchBarSection> {
  final TextEditingController controller = TextEditingController();
  String query = '';

  List<String> data = [
    'اللغة العربية',
    'الرياضيات',
    'العلوم',
    'التاريخ',
    'الجغرافيا',
    'الكيمياء'
    'الاحياء',
    'التربية الدينية',
  ];

  List<String> searchResults = [];

  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
      searchResults = data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          // onChanged: onQueryChanged,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(8.sp),
              child: SvgPicture.asset(
                AssetsManager.searchIcon,
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(8.sp),
              child: SvgPicture.asset(
                AssetsManager.burgerMenuIcon,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.w,
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.w,
              ),
              borderSide: BorderSide.none,
            ),
            hintStyle:
                TextStyle(color: ColorsManager.grayColor5, fontSize: 16.sp),
            hintText: 'ابحث عن ما تريد',
          ),
          cursorColor: ColorsManager.primaryColor,
          autofocus: false,
          autocorrect: false,
        ),
        Visibility(
          visible: controller.text.isEmpty ? false : true,
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    searchResults[index],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
