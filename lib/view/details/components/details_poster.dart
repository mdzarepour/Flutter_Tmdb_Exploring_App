import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/widgets/image_error.dart';
import 'package:movie_app/utils/widgets/loading.dart';
//TODO data error fetching logic not works possibly --->

class DetailsPoster extends StatelessWidget {
  const DetailsPoster({super.key, required this.movieDetails});
  final Movie movieDetails;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(width: size.width, height: size.height / 2.1),
        _buildMovieBackdrop(size),
        _buildMoviePoster(size),
        _buildMovieVotes(),
        _buildMovieTitle(size),
      ],
    );
  }

  ClipRRect _buildMovieBackdrop(Size size) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
      child: SizedBox(
        width: size.width,
        height: 265,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          imageUrl: movieDetails.backDropPath,
          errorWidget: (context, url, error) => imageErrorWidget(),
          placeholder: (context, url) => loadingWidget(),
        ),
      ),
    );
  }

  Positioned _buildMoviePoster(Size size) {
    return Positioned(
      bottom: 0,
      left: 30,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: SizedBox(
          width: size.width / 3.3,
          height: 160,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: movieDetails.posterPath,
          ),
        ),
      ),
    );
  }

  Positioned _buildMovieVotes() {
    return Positioned(
      bottom: 100,
      right: 10,
      child: Container(
        decoration: const BoxDecoration(
          gradient: GradientColors.ratingGradientColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        width: 75,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.star_outlined,
              size: 25,
              color: SolidColors.materialYellow,
            ),
            Text(
              style: AppTheme.titleMedium,
              movieDetails.voteAverage.toString().substring(0, 3),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildMovieTitle(Size size) {
    return Positioned(
      bottom: 0,
      left: size.width / 2.4,
      child: SizedBox(
        width: 200,
        height: 65,
        child: Text(
          style: AppTheme.titleLarge.copyWith(height: 1.8),
          movieDetails.originalTitle,
          softWrap: true,
          overflow: TextOverflow.fade,
          maxLines: 2,
        ),
      ),
    );
  }
}
