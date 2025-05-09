import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/theme/widget_theme.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: ComponentsTheme.appBarTheme,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  iconTheme: ComponentsTheme.iconTheme,
  inputDecorationTheme: ComponentsTheme.inputDecorationTheme,
  bottomNavigationBarTheme: ComponentsTheme.bottomNavigatorThemeData,
  colorScheme: const ColorScheme.dark(
    surface: SolidColors.scaffoldDarkBackGround,
    brightness: Brightness.dark,
  ),
);
