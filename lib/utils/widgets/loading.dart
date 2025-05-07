import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/core/constants/colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingFour(
      color: SolidColors.materialSecondGrey,
      size: 25,
    );
  }
}
