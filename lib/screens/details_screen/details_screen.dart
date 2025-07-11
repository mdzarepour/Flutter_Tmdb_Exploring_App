import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/core/imports/import_details_screen.dart';
import 'package:movie_app/core/imports/import_internet_essentials.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<MovieModel> _futureMovieDetails;

  @override
  void initState() {
    super.initState();
    _fetchMovieDetails();
  }

  _fetchMovieDetails() async {
    setState(() {
      _futureMovieDetails = MovieService().getMovieDetails(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsScreenAppbarWidget(context),
      body: SafeArea(
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
                  DetailsScreenOverviewWidget(
                    overViewText: movieDetail.overview,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
