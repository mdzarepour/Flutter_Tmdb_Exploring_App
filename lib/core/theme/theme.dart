import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

class AppTheme {
  //outlined button theme -->
  static ButtonStyle outlinedButtonTheme = OutlinedButton.styleFrom(
    iconColor: SolidColors.materialWhite,
    iconSize: 27,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    fixedSize: const Size(200, 50),
  );
  // bottom navigation theme --->
  static const BottomNavigationBarThemeData bottomNavigatorThemeData =
      BottomNavigationBarThemeData(
        selectedItemColor: SolidColors.materialRed,
        unselectedItemColor: SolidColors.materialWhite,
        backgroundColor: SolidColors.materialBackgroundColor,
      );

  // icon theme --->
  static const IconThemeData iconTheme = IconThemeData(
    color: SolidColors.materialSecondGrey,
    size: 30,
  );

  //text fiels theme --->
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    border: InputBorder.none,
    prefixIconColor: SolidColors.materialSecondGrey,
    hintStyle: TextStyle(
      color: SolidColors.materialSecondGrey,
      fontSize: 16,
      fontFamily: 'Poppins_Medium',
      fontWeight: FontWeight.w400,
    ),
  );

  // appbar theme  --->
  static const AppBarTheme appBarTheme = AppBarTheme(
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: SolidColors.materialBackgroundColor,
    titleTextStyle: TextStyle(
      color: SolidColors.materialRed,
      fontSize: 30,
      fontFamily: 'Poppins_SemiBold',
      fontWeight: FontWeight.w700,
      letterSpacing: 2.5,
    ),
  );

  // text themes --->
  static const TextStyle bodyMedium = TextStyle(
    color: SolidColors.materialWhite,
  );
  static const TextStyle titleLarge = TextStyle(
    color: SolidColors.materialWhite,
    fontSize: 18,
    fontFamily: 'Poppins_SemiBold',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle titleMedium = TextStyle(
    color: SolidColors.materialWhite,
    fontSize: 14,
    fontFamily: 'Poppins_Medium',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle titleSmall = TextStyle(
    color: SolidColors.materialSecondGrey,
    fontSize: 16,
    fontFamily: 'Poppins_Medium',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle headlineSmall = TextStyle(
    color: SolidColors.materialSecondGrey,
    fontSize: 12,
    fontFamily: 'Poppins_Medium',
    fontWeight: FontWeight.w400,
  );
}
