import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/widgets/data_error.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/view/details/components/details_appbar.dart';
import 'package:movie_app/view/details/components/details_information.dart';
import 'package:movie_app/view/details/components/details_poster.dart';

class DetailsView extends StatefulWidget {
  final int movieId;
  const DetailsView({super.key, required this.movieId});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late Future<Movie> _futureMovieDetails;
  late Movie movieDetails;

  @override
  void initState() => [super.initState(), _fetchMovieDetails()];

  _fetchMovieDetails() async {
    _futureMovieDetails = MovieService().getMovieDetails(widget.movieId);
    movieDetails = await _futureMovieDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: _futureMovieDetails,
              builder:
                  (context, snapshot) =>
                      snapshot.hasData
                          ? SafeArea(
                            child: Center(
                              child: Column(
                                children: [
                                  DetailsPoster(movieDetails: movieDetails),
                                  const SizedBox(height: 30),
                                  DetailsInformation(
                                    movieDetails: movieDetails,
                                  ),
                                  _buildOverView(movieDetails),
                                ],
                              ),
                            ),
                          )
                          : snapshot.connectionState == ConnectionState.waiting
                          ? loadingWidget()
                          : dataErrorWidget(_fetchMovieDetails),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildOverView(Movie movieDetails) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
      child: Text(
        movieDetails.overview,
        style: AppTheme.titleMedium.copyWith(height: 1.9),
      ),
    );
  }
}
