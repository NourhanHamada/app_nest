import 'package:app_nest_task/core/theming/colors_manager.dart';
import 'package:app_nest_task/core/widgets/space.dart';
import 'package:app_nest_task/features/home/ui/widgets/app_bar_custom.dart';
import 'package:app_nest_task/features/home/ui/widgets/teachers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/subjects_and_tasks_details_section.dart';
import '../widgets/user_subjects_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String code = '#098765';

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => isAppBarExpanded);
  }

  bool get isAppBarExpanded {
    return
      scrollController.hasClients &&
        scrollController.offset >= scrollController.position.maxScrollExtent;
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          appBarCustom(
            context,
            code,
            scrollController,
            isAppBarExpanded
                ? ColorsManager.primaryColor
                : Colors.transparent,
          ),
        ];
      },
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16),
              const SubjectsAndTasksDetailsSection(),
              verticalSpace(16),
              const UserSubjectsSection(),
              verticalSpace(16),
              const TeachersSection(),
            ],
          ),
        ),
      ),
    );
  }
}
