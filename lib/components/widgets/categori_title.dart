import 'package:flutter/material.dart';

class CategoriTitle extends StatelessWidget {
  final String text;
  const CategoriTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            style: Theme.of(context).textTheme.titleLarge,
            text,
          ),
        ],
      ),
    );
  }
}
