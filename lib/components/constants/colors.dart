import 'package:flutter/material.dart';

class SolidColors {
  static const Color backGroundColor = Color(0xff242A32);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color secondaryGrayColor = Color(0xff67686D);
  static const Color primaryGrayColor = Color(0xff3A3F47);
  static const Color blueColor = Color(0xff0296E5);
  static const Color redColor = Colors.red;
  static const Color yellowColor = Color(0xffFF8700);
}

class GradientColors {
  static const LinearGradient ratingGradientColor = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xff252836),
        Color.fromARGB(111, 0, 0, 0),
      ]);
}
