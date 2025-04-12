import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';
import 'package:movie_app/components/constants/strings.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/main_screen.dart';
import 'package:movie_app/services/movie_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<List<List<Movie>>> allMoviesList;
  @override
  void initState() {
    super.initState();
    _fetchMovieData();
  }

  _fetchMovieData() async {
    // fetch all three movie lists --->
    MovieService movieService = MovieService();
    allMoviesList = Future.wait([
      movieService.getMovieList(
        url: ApiStrings.popularVideosUrl,
        errorMessage: 'error while fetching popular movies',
      ),
      movieService.getMovieList(
        url: ApiStrings.ratedVideosUrl,
        errorMessage: 'error while fetching top rated movies',
      ),
      movieService.getMovieList(
        url: ApiStrings.upcomingVideosUrl,
        errorMessage: 'error while fetching upcoming movies',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: allMoviesList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // accurate condition --->
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder:
                        (context) => MainScreen(
                          popularMovies: snapshot.data![0],
                          ratedMovies: snapshot.data![1],
                          upcomingMovies: snapshot.data![2],
                        ),
                  ),
                );
              });
              // error condition --->
            } else if (snapshot.hasError) {
              OutlinedButton.icon(
                onPressed: () => _fetchMovieData(),
                label: Text('Oops Try Again'),
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedRefresh,
                  color: SolidColors.secondaryGrayColor,
                ),
              );
            } else {
              // waiting condition --->
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text(
                      'Movie App',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Loading(),
                  ],
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
