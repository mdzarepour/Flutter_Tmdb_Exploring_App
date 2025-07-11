import 'package:movie_app/core/imports/import_core.dart';

class GlobalDataErrorWidget extends StatelessWidget {
  const GlobalDataErrorWidget({super.key, required this.fetchAgain});
  final void Function() fetchAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40,
      children: [
        const SizedBox(width: double.infinity),
        const Text(
          ConstantUiStrings.connectionProplem,
          style: AppWidgetTheme.titleLarge,
        ),
        OutlinedButton(
          style: AppWidgetTheme.outlinedButtonTheme,
          onPressed: fetchAgain,
          child: const Text(
            style: AppWidgetTheme.bodyMedium,
            ConstantUiStrings.tryAgain,
          ),
        ),
      ],
    );
  }
}
