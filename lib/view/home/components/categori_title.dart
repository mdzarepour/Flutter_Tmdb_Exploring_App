import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/theme.dart';

class CategoriTitle extends StatelessWidget {
  final String text;
  const CategoriTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(style: AppTheme.titleLarge, text)],
      ),
    );
  }
}
