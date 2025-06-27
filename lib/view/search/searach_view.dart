import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/core/utils/methods/show_snackbar.dart';
import 'package:movie_app/core/utils/widgets/data_error.dart';
import 'package:movie_app/core/utils/widgets/loading.dart';
import 'package:movie_app/view/search/components/search_gridview.dart';
import 'package:movie_app/view/search/components/search_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Movie>> _futureTrendingMovies;
  late List<Movie> trendingMovies;

  @override
  void initState() => [super.initState(), _fetchTrendingMovies()];

  _fetchTrendingMovies() async {
    setState(() {
      _futureTrendingMovies = MovieService().getMovieList(
        url: ApiStrings.trendingMoviesUrl,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: FutureBuilder(
              future: _futureTrendingMovies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loadingWidget();
                } else if (snapshot.hasError) {
                  return DataErrorWidget(fetchAgain: _fetchTrendingMovies);
                } else {
                  trendingMovies = snapshot.data!;
                  return RefreshIndicator(
                    onRefresh: () async {
                      _fetchTrendingMovies();
                      showSnackbar(context);
                    },
                    child: Column(
                      children: [
                        SearchTextfield(searchMovie: searchMovie),
                        SizedBox(height: size.height * 0.04),
                        SearchGridview(list: trendingMovies),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  searchMovie(String input) async {
    final searchList = await _futureTrendingMovies;
    setState(() {
      trendingMovies =
          searchList.where((element) {
            return element.originalTitle.toLowerCase().contains(
              input.toLowerCase(),
            );
          }).toList();
    });
  }
}
