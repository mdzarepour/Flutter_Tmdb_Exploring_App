import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/view/search/components/grid_view_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Movie>> _futureTrendingMovies;
  late List<Movie> trendingMovies;

  @override
  void initState() {
    super.initState();
    _fetchTrendingMovies();
  }

  _fetchTrendingMovies() async {
    // fetch list then initialize _trendingMovies --->
    _futureTrendingMovies = MovieService().getMovieList(
      url: ApiStrings.trendingMoviesUrl,
      errorMessage: 'search screen',
    );
    // wait _trendingMovies then set value --->
    await _futureTrendingMovies.then((value) {
      setState(() async {
        trendingMovies = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () => _fetchTrendingMovies(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder(
                future: _futureTrendingMovies,
                builder: (context, snapshot) {
                  // accurate condition --->
                  if (snapshot.hasData) {
                    return _futureHasData(size, textTheme, trendingMovies);
                    // error condition --->
                  } else if (snapshot.hasError) {
                    return _futureHasError(textTheme);
                    // waiting condition --->
                  } else {
                    return const Loading();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // error condition --->
  Column _futureHasError(TextTheme textTheme) {
    return Column(
      spacing: 40,
      children: [
        const Text('Oop Connection problem!', style: AppTheme.titleLarge),
        OutlinedButton(
          style: AppTheme.outlinedButtonTheme,
          onPressed: () => _fetchTrendingMovies(),
          child: const Text(style: AppTheme.bodyMedium, 'Try Again'),
        ),
      ],
    );
  }

  // accurate condition widget --->
  Column _futureHasData(Size size, TextTheme textTheme, List<Movie> movieList) {
    return Column(
      children: [
        const SizedBox(height: 15),
        // search textfield --->
        _buildSearchTextfield(size, textTheme),
        const SizedBox(height: 20),
        // movies gridView --->
        SizedBox(
          height: size.height,
          width: size.width,
          child: GridView.builder(
            itemCount: trendingMovies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              return GridViewItem(index: index, movieList: trendingMovies);
            },
          ),
        ),
      ],
    );
  }

  // used in futureHasData --->
  Container _buildSearchTextfield(Size size, TextTheme textTheme) {
    return Container(
      width: size.width / 1.3,
      height: size.height / 18.5,
      decoration: const BoxDecoration(
        color: SolidColors.materialFirstGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: TextField(
        style: textTheme.titleSmall,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: SolidColors.materialWhite,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(HugeIcons.strokeRoundedSearch01),
        ),
        // styles end --->
        onChanged: (value) => _searchMovie(value),
      ),
    );
  }

  //used in searchTextfield --->
  _searchMovie(String input) async {
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
