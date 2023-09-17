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
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;
        if (lightDynamic != null && darkDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = defaultLightScheme;
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: primaryLight,
            brightness: Brightness.dark,
          );
        }
        return MaterialApp.router(
          title: 'Ambush',
          routerConfig: _appRouter.config(),
          theme: getLightTheme(defaultLightScheme, context),
          darkTheme: getDarkTheme(darkColorScheme, context),
        );
      },
    );
  }
}
