import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_widget_theme.dart';
import 'package:movie_app/core/utils/widgets/global_data_error_widget.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/core/utils/widgets/global_loading_widget.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/screens/details_screen/components/details_screen_appbar_widget.dart';
import 'package:movie_app/screens/details_screen/components/details_screen_information_widget.dart';
import 'package:movie_app/screens/details_screen/components/details_screen_poster_widget.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<MovieModel> _futureMovieDetails;

  @override
  void initState() => [super.initState(), _fetchMovieDetails()];

  _fetchMovieDetails() async {
    _futureMovieDetails = MovieService().getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsScreenAppbarWidget(context),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: _futureMovieDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return globalLoadingWidget();
              } else if (snapshot.hasError) {
                return GlobalDataErrorWidget(fetchAgain: _fetchMovieDetails);
              } else {
                MovieModel movieDetail = snapshot.data!;
                return Column(
                  children: [
                    DetailsScreenPosterWidget(movieDetails: movieDetail),
                    const SizedBox(height: 30),
                    DetailsScreenInformationWidget(movieDetails: movieDetail),
                    _buildOverView(movieDetail),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _buildOverView(MovieModel movieDetails) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
      child: Text(
        movieDetails.overview,
        style: AppWidgetTheme.titleMedium.copyWith(height: 1.9),
      ),
    );
  }
}
