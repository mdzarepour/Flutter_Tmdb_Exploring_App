import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';
import 'package:movie_app/components/constants/strings.dart';
import 'package:movie_app/components/widgets/categori_title.dart';
import 'package:movie_app/components/widgets/connection_error_message.dart';
import 'package:movie_app/components/widgets/list_view_item.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/components/widgets/slider_item.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/movie_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> ratedMovies;
  late Future<List<Movie>> upcominMovies;
  @override
  void initState() {
    super.initState();
    _fetchMovieData();
  }

  _fetchMovieData() async {
    MovieService movieService = MovieService();
    setState(() {
      popularMovies = movieService.getMovieList(
        errorMessage: 'popular message error',
        url: ApiStrings.popularVideosUrl,
      );
      ratedMovies = movieService.getMovieList(
        errorMessage: 'rated message error',
        url: ApiStrings.ratedVideosUrl,
      );
      upcominMovies = movieService.getMovieList(
        errorMessage: 'upcoming message error',
        url: ApiStrings.upcomingVideosUrl,
      );
    });
    await Future.wait([
      popularMovies,
      ratedMovies,
      upcominMovies,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          color: SolidColors.redColor,
          onRefresh: () async => await _fetchMovieData(),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    _buildSearchTextField(size, textTheme),
                    SizedBox(height: 40),
                    CategoriTitle(text: 'Popular Movies'),
                    SizedBox(height: 20),
                    _buildCarouselSlider(textTheme, size),
                    SizedBox(height: 40),
                    CategoriTitle(text: 'Top Rated Movies'),
                    SizedBox(height: 20),
                    _buildCategoryListView(size, ratedMovies),
                    SizedBox(height: 30),
                    CategoriTitle(text: 'Upcoming Movies'),
                    SizedBox(height: 20),
                    _buildCategoryListView(size, upcominMovies),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// popular videos slider =>
  SizedBox _buildCarouselSlider(TextTheme textTheme, Size size) {
    return SizedBox(
      height: size.height / 2.95,
      child: FutureBuilder(
        future: popularMovies,
        builder: (context, snapshot) {
          //error condition ----------------->
          if (snapshot.hasError) {
            return ConnectionErrorMessage(
                message: 'Oops we have error on popular movies');
            // accurate condition ----------------->
          } else if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: snapshot.data!.length,
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
                  snapshot: snapshot,
                  size: size,
                );
              },
            );
            // waiting condition ----------------->
          } else {
            return Loading();
          }
        },
      ),
    );
  }

// top rated & upcoming videos ListView =>
  SizedBox _buildCategoryListView(Size size, Future<List<Movie>> futureList) {
    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: futureList,
        builder: (context, snapshot) {
          // error condition =>
          if (snapshot.hasError) {
            return ConnectionErrorMessage(
              message: 'Check Your Connection ,Refresh The Page',
            );
            // accurate condition =>
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 20),
                  child: ListViewItem(
                    index: index,
                    snapshot: snapshot,
                  ),
                );
              },
            );
          } else {
            // waiting condition =>
            return Loading();
          }
        },
      ),
    );
  }

// textField just for Ui =>
  Center _buildSearchTextField(Size size, TextTheme texttheme) {
    return Center(
      child: Container(
        width: size.width / 1.25,
        height: 45,
        decoration: BoxDecoration(
          color: SolidColors.primaryGrayColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: TextField(
          style: texttheme.titleSmall,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: SolidColors.whiteColor,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: texttheme.titleSmall,
            prefixIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                color: SolidColors.secondaryGrayColor),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Movie App'),
    );
  }
}
