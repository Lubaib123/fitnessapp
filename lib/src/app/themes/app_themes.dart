import 'package:fitapp/src/app/themes/app_palette.dart';

import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,

    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );

  static ThemeData light = ThemeData(
    brightness: Brightness.light,

    useMaterial3: false,
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );
}
