import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/core/imports/import_search_screen.dart';
import 'package:movie_app/core/imports/import_internet_essentials.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<MovieModel>> _futureTrendingMovies;
  late List<MovieModel> trendingMovies = [];
  late List<MovieModel> constTrendingMovies = [];

  @override
  void initState() => [super.initState(), _fetchTrendingMovies()];

  _fetchTrendingMovies() async {
    _futureTrendingMovies = MovieService().getMovieList(
      url: CopnstantServiceStrings.discoverMoviesPageOne,
    );
    constTrendingMovies = await _futureTrendingMovies;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
          future: _futureTrendingMovies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return globalLoadingWidget();
            } else if (snapshot.hasError) {
              return GlobalDataErrorWidget(fetchAgain: _fetchTrendingMovies);
            } else {
              if (trendingMovies.isEmpty) {
                trendingMovies = snapshot.data!;
              }
              return RefreshIndicator(
                onRefresh: () async {
                  _fetchTrendingMovies();
                  globalShowSnackbar(context);
                },
                child: Column(
                  spacing: 5,
                  children: [
                    const SizedBox(height: 20),
                    SearchScreenTextfieldWidget(searchMovie: searchMovie),
                    SizedBox(height: size.height * 0.02),
                    Expanded(
                      child: SearchScreenGridviewWidget(list: trendingMovies),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  searchMovie(String input) async {
    setState(() {
      trendingMovies =
          constTrendingMovies.where((element) {
            return element.originalTitle.toLowerCase().contains(
              input.toLowerCase(),
            );
          }).toList();
    });
  }
}
