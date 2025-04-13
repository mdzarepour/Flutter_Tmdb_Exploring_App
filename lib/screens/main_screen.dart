import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';
import 'package:movie_app/components/constants/strings.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/services/movie_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<List<Movie>>> allMoviesList;
  int _selectedIndex = 0;
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
      appBar: _buildAppBar(),
      body: Center(
        child: SafeArea(
          child: FutureBuilder(
            future: allMoviesList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // accurate condition --->
                return IndexedStack(
                  index: _selectedIndex,
                  children: [
                    HomeScreen(
                      popularMoveis: snapshot.data![0],
                      ratedMovies: snapshot.data![1],
                      upcomingMovies: snapshot.data![2],
                    ),
                    SearchScreen(),
                  ],
                );
                // error condition --->
              } else if (snapshot.hasError) {
                return OutlinedButton.icon(
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
            },
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() => _selectedIndex = index);
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(HugeIcons.strokeRoundedHome01),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(HugeIcons.strokeRoundedSearch01),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text('Movie App'));
  }
}
