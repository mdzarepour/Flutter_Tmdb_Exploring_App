import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';
import 'package:movie_app/components/widgets/connection_error_message.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_service.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(textTheme),
      body: SafeArea(
        child: RefreshIndicator(
          color: SolidColors.redColor,
          onRefresh: () async => await _getMovieDetails(),
          child: FutureBuilder(
            future: movieDetails,
            builder: (context, snapshot) {
              // eror condition --->
              if (snapshot.hasError) {
                return ConnectionErrorMessage(
                  message: 'Oops please refresh the page',
                );
                // loading condition --->
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              } else {
                // accurate condition --->
                return SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        _buildPosterStack(size, snapshot, textTheme),
                        SizedBox(height: 30),
                        _buildDetailsRow(snapshot, textTheme),
                        _buildOverView(snapshot, textTheme),
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
  Padding _buildOverView(AsyncSnapshot<Movie> snapshot, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 40, 15, 30),
      child: Text(
        snapshot.data!.overview,
        style: textTheme.titleMedium!.copyWith(height: 1.9),
      ),
    );
  }

  // the row contains date,popularity,language --->
  Row _buildDetailsRow(AsyncSnapshot<Movie> snapshot, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // release date --->
        Row(
          spacing: 10,
          children: [
            Icon(HugeIcons.strokeRoundedCalendar03),
            Text(snapshot.data!.releaseDate, style: textTheme.headlineSmall),
          ],
        ),
        _buildDivider(),
        // popularity --->
        Row(
          spacing: 10,
          children: [
            Icon(HugeIcons.strokeRoundedTicket01),
            Text(
              snapshot.data!.popularity.toString().substring(0, 6),
              style: textTheme.headlineSmall,
            ),
          ],
        ),
        _buildDivider(),
        // language --->
        Row(
          spacing: 10,
          children: [
            Icon(HugeIcons.strokeRoundedLanguageCircle),
            Text(
              snapshot.data!.originalLanguage,
              style: textTheme.headlineSmall,
            ),
          ],
        ),
      ],
    );
  }

  // the stack contains backdrop image,rating,poster,title --->
  Stack _buildPosterStack(
    Size size,
    AsyncSnapshot<Movie> snapshot,
    TextTheme textTheme,
  ) {
    return Stack(
      children: [
        // all stack container --->
        SizedBox(width: size.width, height: 350),
        // backdrop image --->
        ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          child: SizedBox(
            width: size.width,
            height: 265,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              imageUrl: snapshot.data!.backDropPath,
              errorWidget:
                  (context, url, error) =>
                      ConnectionErrorMessage(message: 'image not found'),
              placeholder: (context, url) => Loading(),
            ),
          ),
        ),
        // pooster image --->
        Positioned(
          bottom: 0,
          left: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
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
            decoration: BoxDecoration(
              gradient: GradientColors.ratingGradientColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: 75,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.star_outlined,
                  size: 25,
                  color: SolidColors.yellowColor,
                ),
                Text(
                  style: textTheme.titleMedium,
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
              style: textTheme.titleLarge!.copyWith(height: 1.8),
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

  // appbar contains title,backButton --->
  AppBar _buildAppBar(TextTheme textTheme) {
    return AppBar(
      // beck button =>
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          size: 30,
          HugeIcons.strokeRoundedArrowLeft01,
          color: SolidColors.whiteColor,
        ),
      ),
      title: Text('Details', style: textTheme.titleLarge),
    );
  }

  // the divider used in _buildDetailsRow --->
  Container _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: SolidColors.secondaryGrayColor,
    );
  }
}
