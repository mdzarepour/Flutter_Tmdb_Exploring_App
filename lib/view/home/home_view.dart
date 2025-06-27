import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/widgets/data_error.dart';
import 'package:movie_app/view/home/components/home_listview.dart';
import 'package:movie_app/view/home/components/home_listview_title.dart';
import 'package:movie_app/view/home/components/home_slider.dart';
import 'package:movie_app/core/constants/strings.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/core/utils/widgets/loading.dart';
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
      body: FutureBuilder(
        future: _futureMovieLists,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingWidget();
          } else if (snapshot.hasError) {
            return DataErrorWidget(fetchAgain: _fetchMovieLists);
          } else {
            List<List<Movie>> moviesLists = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const HomeListViewTitle(text: UiString.catTitle1);
                  case 1:
                    return HomeSlider(list: moviesLists[0]);
                  case 2:
                    return const HomeListViewTitle(text: UiString.catTitle2);
                  case 3:
                    return HomeListView(list: moviesLists[1]);
                  case 4:
                    return const HomeListViewTitle(text: UiString.catTitle3);
                  case 5:
                    return HomeListView(list: moviesLists[2]);
                  default:
                    return const SizedBox.shrink();
                }
              },
            );
          }
        },
      ),
    );
  }
}
