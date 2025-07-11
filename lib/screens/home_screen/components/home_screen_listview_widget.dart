import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/models/movie_model.dart';

import 'home_screen_listview_widget_card.dart';

class HomeScreenListViewWidget extends StatelessWidget {
  const HomeScreenListViewWidget({super.key, required this.list});
  final List<MovieModel> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      width: double.infinity,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 20),
            child: HomeScreenListviewWidgetCard(index: index, list: list),
          );
        },
      ),
    );
  }
}
