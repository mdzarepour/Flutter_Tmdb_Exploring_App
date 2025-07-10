import 'package:flutter/material.dart';

class NavigatorScreenAppbarWidget extends StatelessWidget {
  const NavigatorScreenAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: const Text('Movie App'),
    );
  }
}
