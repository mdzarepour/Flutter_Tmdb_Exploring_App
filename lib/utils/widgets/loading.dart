import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/core/constants/colors.dart';

loadingWidget() {
  return const SpinKitFadingFour(
    color: SolidColors.materialSecondGrey,
    size: 25,
  );
}
