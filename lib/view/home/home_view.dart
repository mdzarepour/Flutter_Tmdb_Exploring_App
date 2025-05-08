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
  late List<List<Movie>> moviewsList;
  @override
  void initState() {
    super.initState();
    _fetchMovieLists();
  }

  void _fetchMovieLists() async {
    _futureMovieLists = Future.wait([
      MovieService().getMovieList(url: ApiStrings.popularVideosUrl),
      MovieService().getMovieList(url: ApiStrings.ratedVideosUrl),
      MovieService().getMovieList(url: ApiStrings.upcomingVideosUrl),
    ]);
    moviewsList = await _futureMovieLists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async => [_fetchMovieLists(), showSnackbar(context)],
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: FutureBuilder(
                  future: _futureMovieLists,
                  builder:
                      (context, snapshot) =>
                          snapshot.hasData
                              ? Column(
                                spacing: 35,
                                children: [
                                  const HomeListViewTitle(
                                    text: UiString.catTitle1,
                                  ),
                                  HomeSlider(list: moviewsList[0]),
                                  const HomeListViewTitle(
                                    text: UiString.catTitle3,
                                  ),
                                  HomeListView(list: moviewsList[1]),
                                  const HomeListViewTitle(
                                    text: UiString.catTitle3,
                                  ),
                                  HomeListView(list: moviewsList[2]),
                                ],
                              )
                              : snapshot.connectionState ==
                                  ConnectionState.waiting
                              ? loadingWidget()
                              : dataErrorWidget(_fetchMovieLists),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
