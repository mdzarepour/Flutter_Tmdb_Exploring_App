import 'package:movie_app/core/imports/import_core.dart';

import 'screens/splash_screen/splash_screen.dart';

void main(List<String> args) {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}

//TODO data error fetching logic not works possibly --->
//TODO ==< delete scafoold from home nad search becuase its get it from navigatr scaffold
//TODO home and search screens scaffold deleted bt not tested
//TODO manage imports in core/imports
