import 'package:movie_app/core/imports/import_core.dart';

void globalShowSnackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: ConstantColors.materialSecondGrey,
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: 10),
      content: Text(
        textAlign: TextAlign.center,
        style: AppWidgetTheme.titleMedium,
        ConstantUiStrings.snackBarMessage,
      ),
    ),
  );
}
