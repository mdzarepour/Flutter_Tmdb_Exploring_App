import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/widgets/categori_title.dart';
import 'package:movie_app/components/widgets/list_view_item.dart';
import 'package:movie_app/components/widgets/slider_item.dart';
import 'package:movie_app/models/movie.dart';

class HomeScreen extends StatefulWidget {
  final List<Movie> popularMoveis;
  final List<Movie> ratedMovies;
  final List<Movie> upcomingMovies;
  const HomeScreen({
    super.key,
    required this.popularMoveis,
    required this.ratedMovies,
    required this.upcomingMovies,
  });
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CategoriTitle(text: 'Popular Movies'),
                  const SizedBox(height: 20),
                  _buildCarouselSlider(textTheme, size),
                  const SizedBox(height: 40),
                  const CategoriTitle(text: 'Top Rated Movies'),
                  const SizedBox(height: 20),
                  _buildCategoryListView(size, widget.ratedMovies),
                  const SizedBox(height: 30),
                  const CategoriTitle(text: 'Upcoming Movies'),
                  const SizedBox(height: 20),
                  _buildCategoryListView(size, widget.upcomingMovies),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // popular videos slider --->
  SizedBox _buildCarouselSlider(TextTheme textTheme, Size size) {
    return SizedBox(
      height: size.height / 2.95,
      child: CarouselSlider.builder(
        itemCount: widget.popularMoveis.length,
        options: CarouselOptions(
          height: size.height / 2.95,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOut,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return SliderItem(
            index: index,
            list: widget.popularMoveis,
            size: size,
          );
        },
      ),
    );
  }

  // top rated & upcoming videos ListView --->
  SizedBox _buildCategoryListView(Size size, List<Movie> list) {
    return SizedBox(
      height: 310,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 20),
            child: ListViewItem(index: index, list: list),
          );
        },
      ),
    );
  }
}
