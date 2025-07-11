import 'package:movie_app/core/imports/import_core.dart';

AppBar detailsScreenAppbarWidget(BuildContext context) {
  return AppBar(
    leading: InkWell(
      onTap: () => Navigator.pop(context),
      child: const Icon(
        size: 30,
        HugeIcons.strokeRoundedArrowLeft01,
        color: ConstantColors.materialWhite,
      ),
    ),
    title: const Text('Details', style: AppWidgetTheme.titleLarge),
  );
}
