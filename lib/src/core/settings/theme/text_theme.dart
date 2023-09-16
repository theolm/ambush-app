import 'package:flutter/material.dart';

final poppinsTheme = ThemeData(fontFamily: 'Poppins').textTheme;
final mundialTheme = ThemeData(fontFamily: 'Mundial').textTheme;

TextTheme getTextTheme(bool isDarkTheme) {
  final theme = _baseTheme(isDarkTheme);

  return theme.copyWith(
    displayLarge: theme.displayLarge!.copyWith(
      fontSize: 57,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    displayMedium: theme.displayMedium!.copyWith(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    displaySmall: theme.displaySmall!.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    headlineLarge: theme.headlineLarge!.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    headlineMedium: theme.headlineMedium!.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    headlineSmall: theme.headlineSmall!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    titleLarge: theme.titleLarge!.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    titleMedium: theme.titleMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      fontFamily: 'Poppins',
    ),
    titleSmall: theme.titleSmall!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      fontFamily: 'Poppins',
    ),
    labelLarge: theme.labelLarge!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      fontFamily: 'Poppins',
    ),
    labelMedium: theme.labelMedium!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      fontFamily: 'Poppins',
    ),
    labelSmall: theme.labelSmall!.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
      fontFamily: 'Poppins',
    ),
    bodyLarge: theme.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      fontFamily: 'Poppins',
    ),
    bodyMedium: theme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      fontFamily: 'Poppins',
    ),
    bodySmall: theme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.24,
      fontFamily: 'Poppins',
    ),
  );
}

TextTheme _baseTheme(bool isDarkTheme) {
  if (isDarkTheme) {
    return ThemeData.dark(useMaterial3: true).textTheme;
  } else {
    return ThemeData.light(useMaterial3: true).textTheme;
  }
}
