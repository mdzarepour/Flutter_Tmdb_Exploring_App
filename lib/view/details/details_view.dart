import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/view/details/components/connection_error_message.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/view/details/components/detail_appbar.dart';
import 'package:movie_app/view/details/components/divider.dart';

class DetailsView extends StatefulWidget {
  final int movieId;
  const DetailsView({super.key, required this.movieId});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late Future<Movie> movieDetails;

  @override
  void initState() {
    super.initState();
    _getMovieDetails();
  }

  _getMovieDetails() async {
    movieDetails = MovieService().getMovieDetails(widget.movieId);
    await movieDetails;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: RefreshIndicator(
          color: SolidColors.materialRed,
          onRefresh: () async => await _getMovieDetails(),
          child: FutureBuilder(
            future: movieDetails,
            builder: (context, snapshot) {
              // eror condition --->
              if (snapshot.hasError) {
                return const ConnectionErrorMessage(
                  message: 'Oops please refresh the page',
                );
                // loading condition --->
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              } else {
                // accurate condition --->
                return SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        _buildPosterStack(size, snapshot),
                        const SizedBox(height: 30),
                        _buildDetailsRow(snapshot),
                        _buildOverView(snapshot),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  // overview text in main column --->
  Padding _buildOverView(AsyncSnapshot<Movie> snapshot) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
      child: Text(
        snapshot.data!.overview,
        style: AppTheme.titleMedium.copyWith(height: 1.9),
      ),
    );
  }

  // the row contains date,popularity,language --->
  Row _buildDetailsRow(AsyncSnapshot<Movie> snapshot) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // release date --->
        Row(
          spacing: 10,
          children: [
            const Icon(HugeIcons.strokeRoundedCalendar03),
            Text(snapshot.data!.releaseDate, style: AppTheme.headlineSmall),
          ],
        ),
        buildDivider(),
        // popularity --->
        Row(
          spacing: 10,
          children: [
            const Icon(HugeIcons.strokeRoundedTicket01),
            Text(
              snapshot.data!.popularity.toString().substring(0, 6),
              style: AppTheme.headlineSmall,
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
              snapshot.data!.originalLanguage,
              style: AppTheme.headlineSmall,
            ),
          ],
        ),
      ],
    );
  }

  // the stack contains backdrop image,rating,poster,title --->
  Stack _buildPosterStack(Size size, AsyncSnapshot<Movie> snapshot) {
    return Stack(
      children: [
        // all stack container --->
        SizedBox(width: size.width, height: 350),
        // backdrop image --->
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
          child: SizedBox(
            width: size.width,
            height: 265,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              imageUrl: snapshot.data!.backDropPath,
              errorWidget:
                  (context, url, error) =>
                      const ConnectionErrorMessage(message: 'image not found'),
              placeholder: (context, url) => const Loading(),
            ),
          ),
        ),
        // pooster image --->
        Positioned(
          bottom: 0,
          left: 30,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: SizedBox(
              width: size.width / 3.3,
              height: 160,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: snapshot.data!.posterPath,
              ),
            ),
          ),
        ),
        // rating row --->
        Positioned(
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
                  snapshot.data!.voteAverage.toString().substring(0, 3),
                ),
              ],
            ),
          ),
        ),
        // movie title --->
        Positioned(
          bottom: 0,
          left: size.width / 2.4,
          child: SizedBox(
            width: 200,
            height: 65,
            child: Text(
              style: AppTheme.titleLarge.copyWith(height: 1.8),
              snapshot.data!.originalTitle,
              softWrap: true,
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
