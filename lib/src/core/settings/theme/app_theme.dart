import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'custom_color.dart';

const Color whitePrimary = Color(0xFF944a02);
const Color whiteOnPrimary = Color(0xFFffffff);
const Color whitePrimaryContainer = Color(0xFF944a02);
const Color whiteOnPrimaryContainer = Color(0xFF301400);
const Color whiteSecondary = Color(0xFF755845);
const Color whiteOnSecondary = Color(0xFFffffff);
const Color whiteSecondaryContainer = Color(0xFF755845);
const Color whiteOnSecondaryContainer = Color(0xFF2b1708);
const Color whiteTertiary = Color(0xFF5f6135);
const Color whiteOnTertiary = Color(0xFFffffff);
const Color whiteTertiaryContainer = Color(0xFF5f6135);
const Color whiteOnTertiaryContainer = Color(0xFF1b1d00);
const Color whiteError = Color(0xFFba1b1b);
const Color whiteOnError = Color(0xFFffffff);
const Color whiteErrorContainer = Color(0xFFba1b1b);
const Color whiteOnErrorContainer = Color(0xFF410001);
const Color whiteBackground = Color(0xFFfcfcfc);
const Color whiteOnBackground = Color(0xFF201a17);
const Color whiteSurface = Color(0xFFfcfcfc);
const Color whiteOnSurface = Color(0xFF201a17);
const Color whiteOutline = Color(0xFF85746a);
const Color whiteSurfaceVariant = Color(0xFFf4dfd3);
const Color whiteOnSurfaceVariant = Color(0xFF52443b);
const Color whiteInverseSurface = Color(0xFF362f2b);
const Color whiteInverseOnSurface = Color(0xFFfaeee8);

const Color darkPrimary = Color(0xFFffb683);
const Color darkOnPrimary = Color(0xFF502400);
const Color darkPrimaryContainer = Color(0xFFffb683);
const Color darkOnPrimaryContainer = Color(0xFFffdcc4);
const Color darkSecondary = Color(0xFFe4bfa8);
const Color darkOnSecondary = Color(0xFF422b1b);
const Color darkSecondaryContainer = Color(0xFFe4bfa8);
const Color darkOnSecondaryContainer = Color(0xFFffdcc4);
const Color darkTertiary = Color(0xFFc8ca94);
const Color darkOnTertiary = Color(0xFF31320b);
const Color darkTertiaryContainer = Color(0xFFc8ca94);
const Color darkOnTertiaryContainer = Color(0xFFe5e6ae);
const Color darkError = Color(0xFFffb4a9);
const Color darkOnError = Color(0xFF680003);
const Color darkErrorContainer = Color(0xFFffb4a9);
const Color darkOnErrorContainer = Color(0xFFffdad4);
const Color darkBackground = Color(0xFF201a17);
const Color darkOnBackground = Color(0xFFece0da);
const Color darkSurface = Color(0xFF201a17);
const Color darkOnSurface = Color(0xFFece0da);
const Color darkOutline = Color(0xFF9f8d83);
const Color darkSurfaceVariant = Color(0xFF52443b);
const Color darkOnSurfaceVariant = Color(0xFFd7c3b7);
const Color darkInverseSurface = Color(0xFFece0da);
const Color darkInverseOnSurface = Color(0xFF201a17);

const ColorScheme lightTheme = ColorScheme.light(
  primary: whitePrimary,
  onPrimary: whiteOnPrimary,
  primaryContainer: whitePrimaryContainer,
  onPrimaryContainer: whiteOnPrimaryContainer,
  secondary: whiteSecondary,
  onSecondary: whiteOnSecondary,
  secondaryContainer: whiteSecondaryContainer,
  onSecondaryContainer: whiteOnSecondaryContainer,
  tertiary: whiteTertiary,
  onTertiary: whiteOnTertiary,
  tertiaryContainer: whiteTertiaryContainer,
  onTertiaryContainer: whiteOnTertiaryContainer,
  error: whiteError,
  onError: whiteOnError,
  errorContainer: whiteErrorContainer,
  onErrorContainer: whiteOnErrorContainer,
  background: whiteBackground,
  onBackground: whiteOnBackground,
  surface: whiteSurface,
  onSurface: whiteOnSurface,
  surfaceVariant: whiteSurfaceVariant,
  onSurfaceVariant: whiteOnSurfaceVariant,
  outline: whiteOutline,
  inverseSurface: whiteInverseSurface,
  onInverseSurface: whiteInverseOnSurface,
);
const ColorScheme darkTheme = ColorScheme.dark(
  primary: darkPrimary,
  onPrimary: darkOnPrimary,
  primaryContainer: darkPrimaryContainer,
  onPrimaryContainer: darkOnPrimaryContainer,
  secondary: darkSecondary,
  onSecondary: darkOnSecondary,
  secondaryContainer: darkSecondaryContainer,
  onSecondaryContainer: darkOnSecondaryContainer,
  tertiary: darkTertiary,
  onTertiary: darkOnTertiary,
  tertiaryContainer: darkTertiaryContainer,
  onTertiaryContainer: darkOnTertiaryContainer,
  error: darkError,
  onError: darkOnError,
  errorContainer: darkErrorContainer,
  onErrorContainer: darkOnErrorContainer,
  background: darkBackground,
  onBackground: darkOnBackground,
  surface: darkSurface,
  onSurface: darkOnSurface,
  surfaceVariant: darkSurfaceVariant,
  onSurfaceVariant: darkOnSurfaceVariant,
  outline: darkOutline,
  inverseSurface: darkInverseSurface,
  onInverseSurface: darkInverseOnSurface,
);

extension TextStyleMapping on TextStyle {
  TextStyle onPrimary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onPrimary);
  }

  TextStyle onSecondary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onSecondary);
  }

  TextStyle onTertiary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onTertiary);
  }

  TextStyle onPrimaryContainer(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer);
  }

  TextStyle onSecondaryContainer(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer);
  }

  TextStyle onTertiaryContainer(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer);
  }

  TextStyle onSurface(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.onSurface);
  }
}

extension ColorText on BuildContext {
  Color get onPrimary {
    return Theme.of(this).colorScheme.onPrimary;
  }

  Color get onPrimaryContainer {
    return Theme.of(this).colorScheme.onPrimaryContainer;
  }

  Color get onSecondary {
    return Theme.of(this).colorScheme.onSecondary;
  }

  Color get onSecondaryContainer {
    return Theme.of(this).colorScheme.onSecondaryContainer;
  }

  Color get onTertiary {
    return Theme.of(this).colorScheme.onTertiary;
  }

  Color get onTertiaryContainer {
    return Theme.of(this).colorScheme.onTertiaryContainer;
  }
}

extension CorePaletteMapping on CorePalette {
  ColorScheme get colorScheme {
    return ColorScheme.light(
      primary: Color(primary.get(40)),
      onPrimary: Color(primary.get(100)),
      primaryContainer: Color(primary.get(90)),
      onPrimaryContainer: Color(primary.get(10)),
      secondary: Color(secondary.get(40)),
      onSecondary: Color(secondary.get(100)),
      secondaryContainer: Color(secondary.get(90)),
      onSecondaryContainer: Color(secondary.get(10)),
      tertiary: Color(tertiary.get(40)),
      onTertiary: Color(tertiary.get(100)),
      tertiaryContainer: Color(tertiary.get(90)),
      onTertiaryContainer: Color(tertiary.get(10)),
      error: Color(error.get(40)),
      onError: Color(error.get(100)),
      errorContainer: Color(error.get(90)),
      onErrorContainer: Color(error.get(10)),
      background: Color(neutral.get(99)),
      onBackground: Color(neutral.get(10)),
      surface: Color(neutral.get(99)),
      onSurface: Color(neutral.get(10)),
      surfaceVariant: Color(neutralVariant.get(90)),
      onSurfaceVariant: Color(neutralVariant.get(30)),
      outline: Color(neutralVariant.get(50)),
      shadow: Color(neutral.get(0)),
      inverseSurface: Color(neutral.get(20)),
      onInverseSurface: Color(neutral.get(95)),
      inversePrimary: Color(primary.get(80)),
    );
  }

  ColorScheme get darkColorScheme {
    return ColorScheme.dark(
      primary: Color(primary.get(80)),
      onPrimary: Color(primary.get(20)),
      primaryContainer: Color(primary.get(30)),
      onPrimaryContainer: Color(primary.get(90)),
      secondary: Color(secondary.get(80)),
      onSecondary: Color(secondary.get(20)),
      secondaryContainer: Color(secondary.get(30)),
      onSecondaryContainer: Color(secondary.get(90)),
      tertiary: Color(tertiary.get(80)),
      onTertiary: Color(tertiary.get(20)),
      tertiaryContainer: Color(tertiary.get(30)),
      onTertiaryContainer: Color(tertiary.get(90)),
      error: Color(error.get(80)),
      onError: Color(error.get(20)),
      errorContainer: Color(error.get(30)),
      onErrorContainer: Color(error.get(80)),
      background: Color(neutral.get(10)),
      onBackground: Color(neutral.get(90)),
      surface: Color(neutral.get(10)),
      onSurface: Color(neutral.get(90)),
      surfaceVariant: Color(neutralVariant.get(30)),
      onSurfaceVariant: Color(neutralVariant.get(80)),
      outline: Color(neutralVariant.get(60)),
      shadow: Color(neutral.get(0)),
      inverseSurface: Color(neutral.get(90)),
      onInverseSurface: Color(neutral.get(20)),
      inversePrimary: Color(primary.get(40)),
    );
  }
}

ElevatedButtonThemeData elevatedButtonTheme(
  BuildContext context,
  ColorScheme colorScheme,
) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      textStyle: GoogleFonts.outfit(
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: colorScheme.onPrimary,
        ),
      ),
    ),
  );
}

InputDecorationTheme get inputDecorationTheme {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    filled: true,
  );
}

NavigationBarThemeData navigationBarThemeData(ColorScheme colorScheme) {
  return NavigationBarThemeData(
    backgroundColor: colorScheme.surface,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return GoogleFonts.outfit().copyWith(fontWeight: FontWeight.bold);
      } else {
        return GoogleFonts.outfit();
      }
    }),
  );
}

FloatingActionButtonThemeData floatingActionButton(ColorScheme colorScheme) {
  return FloatingActionButtonThemeData(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
  );
}

AppBarTheme appBarThemeLight(ColorScheme colorScheme) {
  return AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
}

AppBarTheme appBarThemeDark(ColorScheme colorScheme) {
  return AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
}

DialogTheme get dialogTheme {
  return DialogTheme(
    titleTextStyle: GoogleFonts.manrope(
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );
}

TimePickerThemeData get timePickerTheme {
  return TimePickerThemeData(
    helpTextStyle: GoogleFonts.manrope(
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    hourMinuteShape: const CircleBorder(),
  );
}

extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(alpha, (red * value).round(), (green * value).round(),
        (blue * value).round());
  }
}

CustomColors lightCustomColor = CustomColors(
  red: Colors.red.shade400,
  green: Colors.green.shade400,
);
CustomColors darkCustomColor = CustomColors(
  red: Colors.red.shade400,
  green: Colors.green.shade400,
);

ThemeData getLightTheme(ColorScheme lightColorScheme, BuildContext context) {
  return ThemeData.from(
    colorScheme: lightColorScheme,
  ).copyWith(
    colorScheme: lightColorScheme,
    dialogTheme: dialogTheme,
    timePickerTheme: timePickerTheme,
    appBarTheme: appBarThemeLight(lightColorScheme),
    useMaterial3: true,
    textTheme: GoogleFonts.outfitTextTheme(
      ThemeData.light().textTheme,
    ),
    scaffoldBackgroundColor: lightColorScheme.background,
    dialogBackgroundColor: lightColorScheme.background,
    navigationBarTheme: navigationBarThemeData(lightColorScheme),
    applyElevationOverlayColor: true,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme(
      context,
      lightColorScheme,
    ),
    extensions: [lightCustomColor],
    dividerTheme: DividerThemeData(
      color: ThemeData.light().dividerColor,
    ),
  );
}

ThemeData getDarkTheme(ColorScheme darkColorScheme, BuildContext context) {
  return ThemeData.from(
    colorScheme: darkColorScheme,
  ).copyWith(
    colorScheme: darkColorScheme,
    dialogTheme: dialogTheme,
    timePickerTheme: timePickerTheme,
    appBarTheme: appBarThemeDark(darkColorScheme),
    useMaterial3: true,
    textTheme: GoogleFonts.outfitTextTheme(
      ThemeData.dark().textTheme,
    ),
    scaffoldBackgroundColor: darkColorScheme.background,
    dialogBackgroundColor: darkColorScheme.background,
    navigationBarTheme: navigationBarThemeData(darkColorScheme),
    applyElevationOverlayColor: true,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme(
      context,
      darkColorScheme,
    ),
    extensions: [darkCustomColor],
    dividerTheme: DividerThemeData(
      color: ThemeData.dark().dividerColor,
    ),
  );
}
