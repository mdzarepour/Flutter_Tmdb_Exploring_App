import 'package:movie_app/core/imports/import_core.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppWidgetTheme.appBarTheme,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    iconTheme: AppWidgetTheme.iconTheme,
    inputDecorationTheme: AppWidgetTheme.inputDecorationTheme,
    bottomNavigationBarTheme: AppWidgetTheme.bottomNavigatorThemeData,
    colorScheme: const ColorScheme.dark(
      surface: ConstantColors.scaffoldDarkBackGround,
      brightness: Brightness.dark,
    ),
  );
}
