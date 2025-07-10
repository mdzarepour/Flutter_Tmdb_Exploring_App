import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/methods/global_show_snackbar.dart';
import 'package:movie_app/core/utils/widgets/global_data_error_widget.dart';
import 'package:movie_app/screens/home_screen/components/home_screen_listview_widget.dart';
import 'package:movie_app/screens/home_screen/components/home_screen_listview_widget_title.dart';
import 'package:movie_app/screens/home_screen/components/home_screen__slider_widget.dart';
import 'package:movie_app/core/constants/constant_strings.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/core/utils/widgets/global_loading_widget.dart';
import 'package:movie_app/models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<List<MovieModel>>> _futureMovieLists;

  @override
  void initState() {
    super.initState();
    _fetchMovieLists();
  }

  void _fetchMovieLists() {
    setState(() {
      _futureMovieLists = Future.wait([
        MovieService().getMovieList(
          url: CopnstantServiceStrings.popularVideosUrl,
        ),
        MovieService().getMovieList(
          url: CopnstantServiceStrings.ratedVideosUrl,
        ),
        MovieService().getMovieList(
          url: CopnstantServiceStrings.upcomingVideosUrl,
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _futureMovieLists,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return globalLoadingWidget();
          } else if (snapshot.hasError) {
            return GlobalDataErrorWidget(fetchAgain: _fetchMovieLists);
          } else {
            List<List<MovieModel>> moviesLists = snapshot.data!;
            return RefreshIndicator(
              onRefresh: () async {
                _fetchMovieLists();
                globalShowSnackbar(context);
              },
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const HomeScreenListViewWidgetTitle(
                    text: ConstantUiStrings.catTitleIndex0,
                  ),
                  HomeScreenSliderWidget(list: moviesLists[0]),
                  const HomeScreenListViewWidgetTitle(
                    text: ConstantUiStrings.catTitleIndex1,
                  ),
                  HomeScreenListViewWidget(list: moviesLists[1]),
                  const HomeScreenListViewWidgetTitle(
                    text: ConstantUiStrings.catTitleIndex2,
                  ),
                  HomeScreenListViewWidget(list: moviesLists[2]),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
