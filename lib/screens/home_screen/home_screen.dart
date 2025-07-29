import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/core/imports/import_internet_essentials.dart';
import 'package:movie_app/core/imports/import_home_screen.dart';

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
    _futureMovieLists = Future.wait([
      MovieService().getMovieList(
        url: CopnstantServiceStrings.popularVideosUrl,
      ),
      MovieService().getMovieList(
        url: CopnstantServiceStrings.topRatedVideosUrl,
      ),
      MovieService().getMovieList(
        url: CopnstantServiceStrings.upcomingVideosUrl,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
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
    );
  }
}
