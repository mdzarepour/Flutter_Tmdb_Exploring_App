import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  final List<Movie> popularMovies;
  final List<Movie> ratedMovies;
  final List<Movie> upcomingMovies;
  const MainScreen({
    super.key,
    required this.popularMovies,
    required this.ratedMovies,
    required this.upcomingMovies,
  });

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: SafeArea(
          child: Center(
            child: IndexedStack(
              index: _selectedIndex,
              children: [HomeScreen(), SearchScreen()],
            ),
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
