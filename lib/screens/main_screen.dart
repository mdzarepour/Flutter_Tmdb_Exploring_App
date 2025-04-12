import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text('main screen'),
              Text(widget.popularMovies[0].originalTitle),
            ],
          ),
        ),
      ),
    );
  }
}
