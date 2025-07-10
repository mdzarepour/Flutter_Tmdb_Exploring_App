import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constant_colors.dart';

class AppWidgetTheme {
  //outlined button theme ->
  static ButtonStyle outlinedButtonTheme = OutlinedButton.styleFrom(
    iconColor: ConstantColors.materialWhite,
    iconSize: 27,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    fixedSize: const Size(200, 50),
  );
  // bottom navigation theme ->
  static const BottomNavigationBarThemeData bottomNavigatorThemeData =
      BottomNavigationBarThemeData(
        selectedItemColor: ConstantColors.materialRed,
        unselectedItemColor: ConstantColors.materialWhite,
        backgroundColor: ConstantColors.scaffoldDarkBackGround,
      );
  // icon theme ->
  static const IconThemeData iconTheme = IconThemeData(
    color: ConstantColors.materialSecondGrey,
    size: 30,
  );
  //text fiels theme ->
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    border: InputBorder.none,
    prefixIconColor: ConstantColors.materialSecondGrey,
    hintStyle: TextStyle(
      color: ConstantColors.materialSecondGrey,
      fontSize: 16,
      fontFamily: 'Poppins_Medium',
      fontWeight: FontWeight.w400,
    ),
  );
  // appbar theme  ->
  static const AppBarTheme appBarTheme = AppBarTheme(
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: ConstantColors.scaffoldDarkBackGround,
    titleTextStyle: TextStyle(
      color: ConstantColors.materialRed,
      fontSize: 30,
      fontFamily: 'Poppins_SemiBold',
      fontWeight: FontWeight.w700,
      letterSpacing: 2.5,
    ),
  );
  // text themes ->
  static const TextStyle bodyMedium = TextStyle(
    color: ConstantColors.materialWhite,
  );
  static const TextStyle titleLarge = TextStyle(
    color: ConstantColors.materialWhite,
    fontSize: 18,
    fontFamily: 'Poppins_SemiBold',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle titleMedium = TextStyle(
    color: ConstantColors.materialWhite,
    fontSize: 14,
    fontFamily: 'Poppins_Medium',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle titleSmall = TextStyle(
    color: ConstantColors.materialSecondGrey,
    fontSize: 16,
    fontFamily: 'Poppins_Medium',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle headlineSmall = TextStyle(
    color: ConstantColors.materialSecondGrey,
    fontSize: 12,
    fontFamily: 'Poppins_Medium',
    fontWeight: FontWeight.w400,
  );
}
