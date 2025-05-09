import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/theme/widget_theme.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        size: 30,
        HugeIcons.strokeRoundedArrowLeft01,
        color: SolidColors.materialWhite,
      ),
    ),
    title: const Text('Details', style: ComponentsTheme.titleLarge),
  );
}
