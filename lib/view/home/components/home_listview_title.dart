import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/widget_theme.dart';

class HomeListViewTitle extends StatelessWidget {
  final String text;
  const HomeListViewTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(style: ComponentsTheme.titleLarge, text)],
      ),
    );
  }
}
