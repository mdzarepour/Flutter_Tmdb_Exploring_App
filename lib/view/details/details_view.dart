import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/widget_theme.dart';
import 'package:movie_app/core/utils/widgets/data_error.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/core/utils/widgets/loading.dart';
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

  @override
  void initState() => [super.initState(), _fetchMovieDetails()];

  _fetchMovieDetails() async {
    _futureMovieDetails = MovieService().getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: _futureMovieDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return loadingWidget();
              } else if (snapshot.hasError) {
                return DataErrorWidget(fetchAgain: _fetchMovieDetails);
              } else {
                Movie movieDetail = snapshot.data!;
                return Column(
                  children: [
                    DetailsPoster(movieDetails: movieDetail),
                    const SizedBox(height: 30),
                    DetailsInformation(movieDetails: movieDetail),
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

  Padding _buildOverView(Movie movieDetails) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
      child: Text(
        movieDetails.overview,
        style: ComponentsTheme.titleMedium.copyWith(height: 1.9),
      ),
    );
  }
}
