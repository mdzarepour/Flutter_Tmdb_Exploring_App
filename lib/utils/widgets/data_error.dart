import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/core/theme/widget_theme.dart';

dataErrorWidget(void Function() fetchAgain) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 40,
    children: [
      const Text(UiString.connectionProplem, style: ComponentsTheme.titleLarge),
      OutlinedButton(
        style: ComponentsTheme.outlinedButtonTheme,
        onPressed: () => fetchAgain,
        child: const Text(style: ComponentsTheme.bodyMedium, UiString.tryAgain),
      ),
    ],
  );
}
