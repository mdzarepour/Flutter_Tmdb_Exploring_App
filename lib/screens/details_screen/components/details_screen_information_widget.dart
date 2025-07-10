import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/theme/app_widget_theme.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/core/utils/widgets/global_divider_widget.dart';

class DetailsScreenInformationWidget extends StatelessWidget {
  const DetailsScreenInformationWidget({super.key, required this.movieDetails});
  final MovieModel movieDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // release date ->
        Row(
          spacing: 10,
          children: [
            const Icon(HugeIcons.strokeRoundedCalendar03),
            Text(movieDetails.releaseDate, style: AppWidgetTheme.headlineSmall),
          ],
        ),
        globalDividerWidget(),
        // popularity ->
        Row(
          spacing: 10,
          children: [
            const Icon(HugeIcons.strokeRoundedTicket01),
            Text(
              movieDetails.popularity.toString().substring(0, 6),
              style: AppWidgetTheme.headlineSmall,
            ),
          ],
        ),
        globalDividerWidget(),
        // language ->
        Row(
          spacing: 10,
          children: [
            const Icon(HugeIcons.strokeRoundedLanguageCircle),
            Text(
              movieDetails.originalLanguage,
              style: AppWidgetTheme.headlineSmall,
            ),
          ],
        ),
      ],
    );
  }
}
