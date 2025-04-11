import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';

class ConnectionErrorMessage extends StatelessWidget {
  final String message;

  const ConnectionErrorMessage({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 30,
        children: [
          SizedBox(height: 20),
          Icon(
            HugeIcons.strokeRoundedNoInternet,
            color: SolidColors.secondaryGrayColor,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
