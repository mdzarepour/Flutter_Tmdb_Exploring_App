import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/constant_colors.dart';
import 'package:movie_app/core/theme/app_widget_theme.dart';

AppBar detailsScreenAppbarWidget(BuildContext context) {
  return AppBar(
    leading: InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        size: 30,
        HugeIcons.strokeRoundedArrowLeft01,
        color: ConstantColors.materialWhite,
      ),
    ),
    title: const Text('Details', style: AppWidgetTheme.titleLarge),
  );
}
