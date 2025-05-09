import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/core/theme/widget_theme.dart';

void showSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: SolidColors.materialSecondGrey,
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 10),
      content: Text(
        textAlign: TextAlign.center,
        style: ComponentsTheme.titleMedium,
        UiString.snackBarMessage,
      ),
    ),
  );
}
