import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/core/constants/constant_colors.dart';

SpinKitFadingFour globalLoadingWidget() {
  return const SpinKitFadingFour(
    color: ConstantColors.materialSecondGrey,
    size: 25,
  );
}
