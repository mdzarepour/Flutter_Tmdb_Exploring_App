import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/view/navigator/navigator_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() => [super.initState(), _navigator()];

  void _navigator() => Future.delayed(const Duration(seconds: 2)).then((value) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return const NavigatorView();
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
            const Text(style: AppTheme.titleLarge, 'Movie App'),
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
