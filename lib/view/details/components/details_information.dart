import 'package:flutter/cupertino.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/theme/widget_theme.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/core/utils/widgets/divider.dart';

class DetailsInformation extends StatelessWidget {
  const DetailsInformation({super.key, required this.movieDetails});
  final Movie movieDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // release date --->
        Row(
          spacing: 10,
          children: [
            const Icon(HugeIcons.strokeRoundedCalendar03),
            Text(
              movieDetails.releaseDate,
              style: ComponentsTheme.headlineSmall,
            ),
          ],
        ),
        buildDivider(),
        // popularity --->
        Row(
          spacing: 10,
          children: [
            const Icon(HugeIcons.strokeRoundedTicket01),
            Text(
              movieDetails.popularity.toString().substring(0, 6),
              style: ComponentsTheme.headlineSmall,
            ),
          ],
        ),
        buildDivider(),
        // language --->
        Row(
          spacing: 10,
          children: [
            const Icon(HugeIcons.strokeRoundedLanguageCircle),
            Text(
              movieDetails.originalLanguage,
              style: ComponentsTheme.headlineSmall,
            ),
          ],
        ),
      ],
    );
  }
}
