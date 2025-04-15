import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';

class ConnectionErrorMessage extends StatelessWidget {
  final String message;

  const ConnectionErrorMessage({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        const SizedBox(height: 40),
        const Icon(
          HugeIcons.strokeRoundedNoInternet,
          color: SolidColors.secondaryGrayColor,
        ),
        Text(message, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
