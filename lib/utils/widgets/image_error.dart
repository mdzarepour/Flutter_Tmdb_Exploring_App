import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/theme/widget_theme.dart';

Column imageErrorWidget() {
  return const Column(
    spacing: 10,
    children: [
      SizedBox(height: 40),
      Icon(
        HugeIcons.strokeRoundedNoInternet,
        color: SolidColors.materialSecondGrey,
      ),
      Text('image not found!', style: ComponentsTheme.titleSmall),
    ],
  );
}
