import 'package:flutter/material.dart';

class ConstantColors {
  static const Color scaffoldDarkBackGround = Color(0xff242A32);
  static const Color scaffoldLisghtBackGround = Color.fromARGB(255, 54, 54, 54);
  static const Color materialWhite = Color(0xffFFFFFF);
  static const Color materialSecondGrey = Color(0xff67686D);
  static const Color materialFirstGrey = Color(0xff3A3F47);
  static const Color materialBlue = Color(0xff0296E5);
  static const Color materialRed = Colors.red;
  static const Color materialYellow = Color(0xffFF8700);
}

class ConstantGradientColors {
  static const LinearGradient ratingGradientColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xff252836), Color.fromARGB(111, 0, 0, 0)],
  );
}
