import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/view/details/components/connection_error_message.dart';
import 'package:movie_app/view/home/components/categori_title.dart';
import 'package:movie_app/view/home/components/list_view_item.dart';
import 'package:movie_app/view/home/components/slider_item.dart';
import 'package:movie_app/models/movie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<List<Movie>>> futureMovieLists;
  late List<List<Movie>> moviewsList;
  @override
  void initState() {
    super.initState();
    fetchMovieLists();
  }

  void fetchMovieLists() async {
    futureMovieLists = Future.wait([
      MovieService().getMovieList(
        url: ApiStrings.popularVideosUrl,
        errorMessage: 'error while fetching popular movies',
      ),
      MovieService().getMovieList(
        url: ApiStrings.ratedVideosUrl,
        errorMessage: 'error while fetching top rated movies',
      ),
      MovieService().getMovieList(
        url: ApiStrings.upcomingVideosUrl,
        errorMessage: 'error while fetching up comming movies',
      ),
    ]);
    moviewsList = await futureMovieLists;
  }

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
              child: FutureBuilder(
                future: futureMovieLists,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        const CategoriTitle(text: 'Popular Movies'),
                        const SizedBox(height: 20),
                        _buildCarouselSlider(textTheme, size),
                        const SizedBox(height: 40),
                        const CategoriTitle(text: 'Top Rated Movies'),
                        const SizedBox(height: 20),
                        _buildCategoryListView(size, moviewsList[1]),
                        const SizedBox(height: 30),
                        const CategoriTitle(text: 'Upcoming Movies'),
                        const SizedBox(height: 20),
                        _buildCategoryListView(size, moviewsList[2]),
                        const SizedBox(height: 30),
                      ],
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Loading();
                  } else {
                    return const ConnectionErrorMessage(message: 'error');
                  }
                },
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
        itemCount: moviewsList[0].length,
        options: CarouselOptions(
          height: size.height / 2.95,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOut,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return SliderItem(index: index, list: moviewsList[0], size: size);
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
