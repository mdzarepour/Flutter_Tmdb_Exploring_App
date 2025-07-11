import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/models/movie_model.dart';

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
