import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_widget_theme.dart';
import 'package:movie_app/core/utils/widgets/global_image_error_widget.dart';
import 'package:movie_app/core/utils/widgets/global_loading_widget.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/screens/details_screen/details_screen.dart';

class HomeScreenListviewWidgetCard extends StatelessWidget {
  const HomeScreenListviewWidgetCard({
    super.key,
    required this.index,
    required this.list,
  });
  final int index;
  final List<MovieModel> list;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      // navigate to DetailsView --->
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movieId: list[index].id),
          ),
        );
      },
      child: SizedBox(
        width: size.width / 2.65,
        height: size.height,
        child: Column(
          spacing: 10,
          children: [
            // movie image --->
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              child: SizedBox(
                width: size.width,
                height: 260,
                child: CachedNetworkImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  imageUrl: list[index].posterPath,
                  errorWidget:
                      (context, url, error) => const GlobalImageErrorWidget(),
                  placeholder: (context, url) => globalLoadingWidget(),
                ),
              ),
            ),
            // movie name --->
            Text(
              textAlign: TextAlign.center,
              style: AppWidgetTheme.titleMedium,
              list[index].originalTitle,
              maxLines: 1,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
