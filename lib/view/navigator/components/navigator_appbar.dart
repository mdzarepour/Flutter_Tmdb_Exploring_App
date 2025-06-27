import 'package:flutter/material.dart';

class NavigatorAppbar extends StatelessWidget {
  const NavigatorAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: const Text('Movie App'),
    );
  }
}
