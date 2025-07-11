import 'package:movie_app/core/imports/import_core.dart';

class HomeScreenListViewWidgetTitle extends StatelessWidget {
  final String text;
  const HomeScreenListViewWidgetTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(style: AppWidgetTheme.titleLarge, text)],
      ),
    );
  }
}
