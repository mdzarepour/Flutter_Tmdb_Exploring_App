import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/core/theme/widget_theme.dart';

class DataErrorWidget extends StatelessWidget {
  const DataErrorWidget({super.key, required this.fetchAgain});
  final void Function() fetchAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40,
      children: [
        const SizedBox(width: double.infinity),
        const Text(
          UiString.connectionProplem,
          style: ComponentsTheme.titleLarge,
        ),
        OutlinedButton(
          style: ComponentsTheme.outlinedButtonTheme,
          onPressed: fetchAgain,
          child: const Text(
            style: ComponentsTheme.bodyMedium,
            UiString.tryAgain,
          ),
        ),
      ],
    );
  }
}
