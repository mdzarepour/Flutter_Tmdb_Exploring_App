import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';
import 'package:movie_app/components/constants/strings.dart';
import 'package:movie_app/components/widgets/grid_view_item.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Movie>> trendingMovies;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchTrendingMovies();
  }

  _fetchTrendingMovies() async {
    setState(() {
      trendingMovies = MovieService().getMovieList(
        url: ApiStrings.trendingMoviesUrl,
        errorMessage: 'search screen',
      );
    });
    await trendingMovies;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _fetchTrendingMovies(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FutureBuilder(
              future: trendingMovies,
              builder: (context, snapshot) {
                // accurate condition --->
                if (snapshot.hasData) {
                  return _futureHasData(size, textTheme, snapshot);
                  // error condition --->
                } else if (snapshot.hasError) {
                  return _futureHasError(textTheme);
                  // waiting condition --->
                } else {
                  return Loading();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Column _futureHasError(TextTheme textTheme) {
    return Column(
      spacing: 30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Oop Connection problem!', style: textTheme.titleLarge),
        OutlinedButton(
          onPressed: () => _fetchTrendingMovies(),
          child: Text('Try Again'),
        ),
      ],
    );
  }

  Column _futureHasData(
    Size size,
    TextTheme textTheme,
    AsyncSnapshot<List<Movie>> snapshot,
  ) {
    return Column(
      children: [
        SizedBox(height: 40),
        _buildSearchTextfield(size, textTheme),
        SizedBox(height: 20),
        SizedBox(
          height: size.height - 300,
          width: size.width,
          child: GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              return GridViewItem(index: index, snapshot: snapshot);
            },
          ),
        ),
      ],
    );
  }

  Container _buildSearchTextfield(Size size, TextTheme textTheme) {
    return Container(
      width: size.width / 1.3,
      height: size.height / 18.5,
      decoration: BoxDecoration(
        color: SolidColors.primaryGrayColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: TextField(
        controller: _searchController,
        focusNode: _focusNode,
        style: textTheme.titleSmall,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: SolidColors.whiteColor,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: textTheme.titleSmall,
          prefixIcon: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: SolidColors.secondaryGrayColor,
          ),
        ),
      ),
    );
  }
}
