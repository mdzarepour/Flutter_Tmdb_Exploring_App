import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/core/imports/import_internet_essentials.dart';

class DetailsScreenPosterWidget extends StatelessWidget {
  const DetailsScreenPosterWidget({super.key, required this.movieDetails});
  final MovieModel movieDetails;

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

  Widget _buildMovieBackdrop(Size size) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
      child: SizedBox(
        width: size.width,
        height: 265,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          imageUrl: movieDetails.backDropPath,
          errorWidget: (context, url, error) => const GlobalImageErrorWidget(),
          placeholder: (context, url) => globalLoadingWidget(),
        ),
      ),
    );
  }

  Widget _buildMoviePoster(Size size) {
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
            errorWidget:
                (context, url, error) => const GlobalImageErrorWidget(),
            placeholder: (context, url) => globalLoadingWidget(),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieVotes() {
    return Positioned(
      bottom: 100,
      right: 10,
      child: Container(
        decoration: const BoxDecoration(
          gradient: ConstantGradientColors.ratingGradientColor,
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
              color: ConstantColors.materialYellow,
            ),
            Text(
              style: AppWidgetTheme.titleMedium,
              movieDetails.voteAverage.toString().substring(0, 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieTitle(Size size) {
    return Positioned(
      bottom: 0,
      left: size.width / 2.4,
      child: SizedBox(
        width: 200,
        height: 65,
        child: Text(
          style: AppWidgetTheme.titleLarge.copyWith(height: 1.8),
          movieDetails.originalTitle,
          softWrap: true,
          overflow: TextOverflow.fade,
          maxLines: 2,
        ),
      ),
    );
  }
}
