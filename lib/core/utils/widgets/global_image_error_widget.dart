import 'package:movie_app/core/imports/import_core.dart';

class GlobalImageErrorWidget extends StatelessWidget {
  const GlobalImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        SizedBox(height: 40),
        Icon(
          HugeIcons.strokeRoundedNoInternet,
          color: ConstantColors.materialSecondGrey,
        ),
        Text(
          textAlign: TextAlign.center,
          'image not found!',
          style: AppWidgetTheme.titleSmall,
        ),
      ],
    );
  }
}
