import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/view/splash/splash_view.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppTheme.appBarTheme,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        iconTheme: AppTheme.iconTheme,
        inputDecorationTheme: AppTheme.inputDecorationTheme,
        bottomNavigationBarTheme: AppTheme.bottomNavigatorThemeData,
        scaffoldBackgroundColor: SolidColors.materialBackgroundColor,
      ),
      home: const SplashView(),
    );
  }
}
