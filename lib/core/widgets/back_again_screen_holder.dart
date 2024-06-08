import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../features/main_layout/presentation/cubit/main_layout_cubit.dart';
import '../strings_manager.dart';
import '../theming/colors_manager.dart';

// ignore: must_be_immutable
class BackAgainScreenHolder extends StatelessWidget {
  final Widget child;
  DateTime preBackPress = DateTime.now();

  BackAgainScreenHolder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    MainLayoutCubit cubit =
        BlocProvider.of<MainLayoutCubit>(context, listen: true);

    return PopScope(
      onPopInvoked: (canPop) async {
        if (cubit.state == 0) {
          if (Navigator.canPop(context)) {
            canPop = true;
          }
          final timeGap = DateTime.now().difference(preBackPress);
          final canExit = timeGap < const Duration(seconds: 2);
          preBackPress = DateTime.now();
          if (canExit) {
            canPop = true; // true will exit the app
          } else {
            showToast(StringsManager.pressBackButtonAgainToExit, time: 2);
            canPop = false; // false will do nothing when back press
          }
        } else {
          cubit.changeCurrentPageIndex(0);
        }
        canPop = false; // false will do nothing when back press
      },
      child: child,
    );
  }
}


void showToast(String msg,
    {int time = 5,
      Toast toastLength = Toast.LENGTH_SHORT,
      ToastGravity toastGravity = ToastGravity.BOTTOM,
      Color backGroundColor = ColorsManager.grayColor,
      Color textColor = ColorsManager.whiteColor,
      double fontSize = 16}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    gravity: toastGravity,
    backgroundColor: backGroundColor,
    timeInSecForIosWeb: time,
    webPosition: 'center',
    textColor: textColor,
    fontSize: fontSize.sp,
  );
}