import 'package:app_nest_task/core/widgets/space.dart';
import 'package:app_nest_task/features/layout/ui/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../theming/colors_manager.dart';
import '../../../../widgets/main_button.dart';
import '../../domain/entities/custom_bottom_nav_item.dart';
import '../../domain/entities/custom_notched_shape.dart';
import '../cubit/main_layout_cubit.dart';
import '../widgets/custom_bottom_nav_bar_item_widget.dart';

class MainLayoutNotch extends StatefulWidget {
  const MainLayoutNotch({
    super.key,
    required this.bottomNavigationBarItems,
    required this.bottomNavigationBarTitles,
    required this.pages,
    required this.notchWidget,
    required this.onNotchPress,
    this.drawer,
  });

  final List<CustomBottomNavBarItem> bottomNavigationBarItems;
  final List<String> bottomNavigationBarTitles;
  final List<Widget> pages;
  final Widget notchWidget;
  final VoidCallback onNotchPress;
  final Widget? drawer;

  @override
  State<MainLayoutNotch> createState() => _MainLayoutNotchState();
}

class _MainLayoutNotchState extends State<MainLayoutNotch> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, int>(
      builder: (context, state) {
        MainLayoutCubit cubit = BlocProvider.of<MainLayoutCubit>(context);

        return Scaffold(
          body: widget.pages[state],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const FloatingButton(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorsManager.transparentColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff656565).withOpacity(.10),
                  spreadRadius: 0,
                  blurRadius: 16,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomAppBar(
              height: 75.h,
              padding: EdgeInsets.zero,
              surfaceTintColor: ColorsManager.grayColor,
              color: ColorsManager.whiteColor,
              shape: const CustomNotchedShape(),
              notchMargin: 8,
              child: AnimationLimiter(
                child: Row(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 150),
                    childAnimationBuilder: (p0) {
                      return p0 is MainButton
                          ? SlideAnimation(
                              verticalOffset: 150,
                              child: FadeInAnimation(child: p0),
                      )
                          : Expanded(
                              child: SlideAnimation(
                                verticalOffset: 150,
                                child: FadeInAnimation(child: p0),
                              ),
                            );
                    },
                    children: List.generate(
                      widget.bottomNavigationBarItems.length,
                      (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(index == 2) horizontalSpace(30),
                            CustomBottomNavBarItemWidget(
                              title: widget.bottomNavigationBarTitles[index],
                              isSelected: state == index,
                              navBarItem: widget.bottomNavigationBarItems[index],
                              onTap: () {
                                if (widget.bottomNavigationBarItems[index].condition
                                        ?.call(context) ??
                                    true) {
                                  cubit.changeCurrentPageIndex(index);
                                }
                              },
                            ),
                            if(index == 1) horizontalSpace(30),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


