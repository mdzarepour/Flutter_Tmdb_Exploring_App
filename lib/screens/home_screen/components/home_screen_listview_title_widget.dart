import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_widget_theme.dart';

class HomeScreenListViewTitleWidget extends StatelessWidget {
  final String text;
  const HomeScreenListViewTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(style: AppWidgetTheme.titleLarge, text)],
      ),
    );
  }
}
