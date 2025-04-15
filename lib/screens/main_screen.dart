import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
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

  Future<void> _fetchMovieData() async {
    // fetch all three movie lists --->
    setState(() {
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
    });
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
              // accurate condition --->
              if (snapshot.hasData) {
                return IndexedStack(
                  index: _selectedIndex,
                  children: [
                    HomeScreen(
                      popularMoveis: snapshot.data![0],
                      ratedMovies: snapshot.data![1],
                      upcomingMovies: snapshot.data![2],
                    ),
                    const SearchScreen(),
                  ],
                );
                // error condition --->
              } else if (snapshot.hasError) {
                return OutlinedButton.icon(
                  onPressed: () => _fetchMovieData(),
                  label: Text(
                    style: Theme.of(context).textTheme.titleMedium,
                    'Oops Try Again',
                  ),
                  icon: const Icon(HugeIcons.strokeRoundedPenConnectWifi),
                );
              } else {
                // waiting condition --->
                return const Center(child: Loading());
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // bottomNavigation widget --->
  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() => _selectedIndex = index);
      },
      items: const [
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

  // appBar widget --->
  AppBar _buildAppBar() {
    return AppBar(title: const Text('Movie App'));
  }
}
