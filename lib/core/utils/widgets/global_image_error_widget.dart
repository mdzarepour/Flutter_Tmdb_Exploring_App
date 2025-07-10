import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/constant_colors.dart';
import 'package:movie_app/core/theme/app_widget_theme.dart';

class GlobalImageErrorWidget extends StatelessWidget {
  const GlobalImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 10,
      children: [
        SizedBox(height: 40),
        Icon(
          HugeIcons.strokeRoundedNoInternet,
          color: ConstantColors.materialSecondGrey,
        ),
        Text('image not found!', style: AppWidgetTheme.titleSmall),
      ],
    );
  }
}
