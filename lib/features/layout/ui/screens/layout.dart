import 'package:app_nest_task/core/features/main_layout/presentation/cubit/main_layout_cubit.dart';
import 'package:app_nest_task/core/theming/assets_manager.dart';
import 'package:app_nest_task/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/features/main_layout/domain/entities/custom_bottom_nav_item.dart';
import '../../../../core/features/main_layout/presentation/screen/main_layout_notch.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/widgets/back_again_screen_holder.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      StringsManager.home,
      StringsManager.mySubjects,
      StringsManager.quiz,
      StringsManager.profile,
    ];
    List<String> icons = [
      AssetsManager.homeEnabled,
      AssetsManager.mySubjectsEnabled,
      AssetsManager.quizEnabled,
      AssetsManager.profileEnabled,
    ];
    List<String> disabledIcons = [
      AssetsManager.homeDisabled,
      AssetsManager.mySubjectsDisabled,
      AssetsManager.quizDisabled,
      AssetsManager.profileDisabled,
    ];

    return BlocProvider(
      create: (context) => MainLayoutCubit(),
      child: BlocBuilder<MainLayoutCubit, int>(
        builder: (context, state) {
          return BackAgainScreenHolder(
            child: MainLayoutNotch(
              bottomNavigationBarItems: List.generate(
                titles.length,
                (index) => CustomBottomNavBarItem(
                  title: titles[index],
                  condition: (context) {
                    return true;
                  },
                  iconName: icons[index],
                  disableIconName: disabledIcons[index],
                ),
              ),
              bottomNavigationBarTitles: List.generate(
                titles.length,
                (index) => titles[index],
              ),
              pages: const [
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
              ],
              notchWidget: const Icon(
                Icons.add,
                color: ColorsManager.whiteColor,
              ),
              onNotchPress: () => notchClick(context),
            ),
          );
        },
      ),
    );
  }

  void notchClick(context) {}
}
