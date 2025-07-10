import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constant_colors.dart';
import 'package:movie_app/core/constants/constant_strings.dart';
import 'package:movie_app/core/theme/app_widget_theme.dart';

void globalShowSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: ConstantColors.materialSecondGrey,
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 10),
      content: Text(
        textAlign: TextAlign.center,
        style: AppWidgetTheme.titleMedium,
        ConstantUiStrings.snackBarMessage,
      ),
    ),
  );
}
