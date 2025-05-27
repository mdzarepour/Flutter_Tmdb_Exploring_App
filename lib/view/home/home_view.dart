import 'package:flutter/material.dart';
import 'package:movie_app/utils/methods/show_snackbar.dart';
import 'package:movie_app/utils/widgets/data_error.dart';
import 'package:movie_app/view/home/components/home_listview.dart';
import 'package:movie_app/view/home/components/home_listview_title.dart';
import 'package:movie_app/view/home/components/home_slider.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<List<Movie>>> _futureMovieLists;

  @override
  void initState() {
    super.initState();
    _fetchMovieLists();
  }

  void _fetchMovieLists() {
    setState(() {
      _futureMovieLists = Future.wait([
        MovieService().getMovieList(url: ApiStrings.popularVideosUrl),
        MovieService().getMovieList(url: ApiStrings.ratedVideosUrl),
        MovieService().getMovieList(url: ApiStrings.upcomingVideosUrl),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            _fetchMovieLists();
            await _futureMovieLists;
            showSnackbar(context);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FutureBuilder<List<List<Movie>>>(
                  future: _futureMovieLists,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return loadingWidget();
                    } else if (snapshot.hasError) {
                      return dataErrorWidget(_fetchMovieLists);
                    } else if (snapshot.hasData) {
                      final List<List<Movie>> movieLists = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const HomeListViewTitle(text: UiString.catTitle1),
                          HomeSlider(list: movieLists[0]),
                          const SizedBox(height: 35),
                          const HomeListViewTitle(text: UiString.catTitle2),
                          HomeListView(list: movieLists[1]),
                          const SizedBox(height: 35),
                          const HomeListViewTitle(text: UiString.catTitle3),
                          HomeListView(list: movieLists[2]),
                        ],
                      );
                    } else {
                      return const Text("No data to display.");
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
