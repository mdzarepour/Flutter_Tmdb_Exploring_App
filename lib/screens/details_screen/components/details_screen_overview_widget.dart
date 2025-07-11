import 'package:movie_app/core/imports/import_core.dart';

class DetailsScreenOverviewWidget extends StatelessWidget {
  final String overViewText;
  const DetailsScreenOverviewWidget({super.key, required this.overViewText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
      child: Text(
        textAlign: TextAlign.start,
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        overViewText,
        style: AppWidgetTheme.titleMedium.copyWith(height: 1.9),
      ),
    );
  }
}
