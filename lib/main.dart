import 'package:flutter/material.dart';
import 'package:movie_app/components/constants/colors.dart';
import 'package:movie_app/screens/main_screen.dart';

void main(List<String> args) {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movie app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: SolidColors.backGroundColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        iconTheme: _getIconTheme(),
        appBarTheme: _getAppbarTheme(),
        textTheme: _getTextTheme(),
        inputDecorationTheme: _getTextFieldTheme(),
        bottomNavigationBarTheme: _getBottumNavigationTheme(),
        outlinedButtonTheme: _getOutlinedButtonTheme(),
      ),
      home: const MainScreen(),
    );
  }

  OutlinedButtonThemeData _getOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        iconColor: SolidColors.whiteColor,
        iconSize: 27,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        fixedSize: const Size(200, 50),
      ),
    );
  }

  BottomNavigationBarThemeData _getBottumNavigationTheme() {
    return const BottomNavigationBarThemeData(
      selectedItemColor: SolidColors.redColor,
      unselectedItemColor: SolidColors.whiteColor,
      backgroundColor: SolidColors.backGroundColor,
    );
  }

  IconThemeData _getIconTheme() =>
      const IconThemeData(color: SolidColors.secondaryGrayColor, size: 30);

  InputDecorationTheme _getTextFieldTheme() {
    return const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      border: InputBorder.none,
      prefixIconColor: SolidColors.secondaryGrayColor,
      hintStyle: TextStyle(
        color: SolidColors.secondaryGrayColor,
        fontSize: 16,
        fontFamily: 'Poppins_Medium',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  AppBarTheme _getAppbarTheme() {
    return const AppBarTheme(
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: SolidColors.backGroundColor,
      titleTextStyle: TextStyle(
        color: SolidColors.redColor,
        fontSize: 30,
        fontFamily: 'Poppins_SemiBold',
        fontWeight: FontWeight.w700,
        letterSpacing: 2.5,
      ),
    );
  }

  TextTheme _getTextTheme() {
    return const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      // header bold title theme --->
      titleLarge: TextStyle(
        color: SolidColors.whiteColor,
        fontSize: 18,
        fontFamily: 'Poppins_SemiBold',
        fontWeight: FontWeight.w700,
      ),
      // body texts theme --->
      titleMedium: TextStyle(
        color: SolidColors.whiteColor,
        fontSize: 14,
        fontFamily: 'Poppins_Medium',
        fontWeight: FontWeight.w400,
      ),
      // search textField theme --->
      titleSmall: TextStyle(
        color: SolidColors.secondaryGrayColor,
        fontSize: 16,
        fontFamily: 'Poppins_Medium',
        fontWeight: FontWeight.w400,
      ),
      // icons title theme --->
      headlineSmall: TextStyle(
        color: SolidColors.secondaryGrayColor,
        fontSize: 12,
        fontFamily: 'Poppins_Medium',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
