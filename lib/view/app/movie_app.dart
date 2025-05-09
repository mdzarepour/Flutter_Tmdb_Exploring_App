import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/view/splash/splash_view.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const SplashView(),
    );
  }
}
