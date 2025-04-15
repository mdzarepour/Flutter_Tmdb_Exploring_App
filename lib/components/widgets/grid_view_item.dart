import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/details_screen.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.movieList, required this.index});
  final List<Movie> movieList;
  final int index;

  @override
  Widget build(BuildContext context) {
    // navigate to DetailsScreen --->
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movieId: movieList[index].id),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        // movie image --->
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: movieList[index].posterPath,
          placeholder: (context, url) => const Loading(),
          errorWidget:
              (context, url, error) =>
                  const Icon(size: 40, HugeIcons.strokeRoundedImage01),
        ),
      ),
    );
  }
}
