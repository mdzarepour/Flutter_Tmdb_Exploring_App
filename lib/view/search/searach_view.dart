import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/utils/methods/show_snackbar.dart';
import 'package:movie_app/utils/widgets/data_error.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/view/search/components/search_gridview.dart';

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
    _futureTrendingMovies = MovieService().getMovieList(
      url: ApiStrings.trendingMoviesUrl,
    );
    trendingMovies = await _futureTrendingMovies;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => [_fetchTrendingMovies(), showSnackbar(context)],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: FutureBuilder(
                future: _futureTrendingMovies,
                builder:
                    (context, snapshot) =>
                        snapshot.hasData
                            ? Column(
                              children: [
                                searchtextfield(size),
                                SizedBox(height: size.height * 0.04),
                                SearchGridview(list: trendingMovies),
                              ],
                            )
                            : snapshot.connectionState ==
                                ConnectionState.waiting
                            ? loadingWidget()
                            : dataErrorWidget(_fetchTrendingMovies),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container searchtextfield(Size size) {
    return Container(
      width: size.width / 1.3,
      height: size.height / 18.5,
      decoration: const BoxDecoration(
        color: SolidColors.materialFirstGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: TextField(
        //  style: textTheme.titleSmall,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: SolidColors.materialWhite,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(HugeIcons.strokeRoundedSearch01),
        ),
        onChanged: searchMovie,
      ),
    );
  }

  searchMovie(String input) async {
    final searchList = await _futureTrendingMovies;
    setState(() {
      trendingMovies =
          searchList
              .where(
                (element) => element.originalTitle.toLowerCase().contains(
                  input.toLowerCase(),
                ),
              )
              .toList();
    });
  }
}
