import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/widgets/global_image_error_widget.dart';
import 'package:movie_app/core/utils/widgets/global_loading_widget.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/screens/details_screen/details_screen.dart';

class HomeScreenSliderWidgetCard extends StatelessWidget {
  const HomeScreenSliderWidgetCard({
    super.key,
    required this.list,
    required this.index,
  });
  final int index;
  final List<MovieModel> list;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsScreen(movieId: list[index].id),
            ),
          ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width / 1.90,
          // movie image --->
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: list[index].posterPath,
            errorWidget:
                (context, url, error) => const GlobalImageErrorWidget(),
            placeholder: (context, url) => globalLoadingWidget(),
          ),
        ),
      ),
    );
  }
}
