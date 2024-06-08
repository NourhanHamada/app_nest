import 'package:app_nest_task/features/layout/ui/screens/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/theming/colors_manager.dart';
import 'generated/l10n.dart';

class AppNest extends StatelessWidget {
  const AppNest({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        390,
        845,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: ColorsManager.primaryColor,
          ),
          textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
          useMaterial3: true,
        ),
        home: const Layout(),
      ),
    );
  }
}
