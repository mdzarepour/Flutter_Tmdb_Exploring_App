import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_widget_theme.dart';
import 'package:movie_app/screens/navigator_screen/navigator_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() => [super.initState(), _navigator()];

  void _navigator() => Future.delayed(const Duration(seconds: 2)).then((value) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return const NavigatorScreen();
        },
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(style: AppWidgetTheme.titleLarge, 'Movie App'),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Image.asset(height: 100, 'assets/images/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
