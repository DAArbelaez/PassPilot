import 'package:flutter/material.dart';
import 'package:passpilot/theme/pallette.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
    colorScheme: const ColorScheme.dark(),
  );
}
