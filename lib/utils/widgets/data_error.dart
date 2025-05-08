import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/core/theme/theme.dart';

dataErrorWidget(void Function() fetchAgain) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 40,
    children: [
      const Text(UiString.connectionProplem, style: AppTheme.titleLarge),
      OutlinedButton(
        style: AppTheme.outlinedButtonTheme,
        onPressed: () => fetchAgain,
        child: const Text(style: AppTheme.bodyMedium, UiString.tryAgain),
      ),
    ],
  );
}
