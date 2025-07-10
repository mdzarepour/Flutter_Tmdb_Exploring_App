import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constant_strings.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/core/utils/methods/global_show_snackbar.dart';
import 'package:movie_app/core/utils/widgets/global_data_error_widget.dart';
import 'package:movie_app/core/utils/widgets/global_loading_widget.dart';
import 'package:movie_app/screens/search_screen/components/search_screen_gridview_widget.dart';
import 'package:movie_app/screens/search_screen/components/search_screen_textfield_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<MovieModel>> _futureTrendingMovies;
  late List<MovieModel> trendingMovies;

  @override
  void initState() => [super.initState(), _fetchTrendingMovies()];

  _fetchTrendingMovies() async {
    setState(() {
      _futureTrendingMovies = MovieService().getMovieList(
        url: CopnstantServiceStrings.trendingMoviesUrl,
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
                  return globalLoadingWidget();
                } else if (snapshot.hasError) {
                  return GlobalDataErrorWidget(
                    fetchAgain: _fetchTrendingMovies,
                  );
                } else {
                  trendingMovies = snapshot.data!;
                  return RefreshIndicator(
                    onRefresh: () async {
                      _fetchTrendingMovies();
                      globalShowSnackbar(context);
                    },
                    child: Column(
                      children: [
                        SearchScreenTextfieldWidget(searchMovie: searchMovie),
                        SizedBox(height: size.height * 0.04),
                        SearchScreenGridviewWidget(list: trendingMovies),
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
