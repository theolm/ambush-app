import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_route.dart';
import 'core/settings/theme/app_theme.dart';
import 'core/settings/theme/colors.dart';
import 'core/settings/theme/default_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {


    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ColorScheme darkColorScheme;
        if (lightDynamic != null && darkDynamic != null) {
          darkColorScheme = darkDynamic.harmonized();
        } else {
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: primaryLight,
            brightness: Brightness.dark,
          );
        }
        return MaterialApp.router(
          title: 'Ambush',
          routerConfig: _appRouter.config(),
          theme: getLightTheme(defaultLightScheme, context),
          themeMode: ThemeMode.dark,
          darkTheme: getDarkTheme(darkColorScheme, context),
        );
      },
    );
  }
}
