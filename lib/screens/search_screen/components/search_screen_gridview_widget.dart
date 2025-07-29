import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/core/imports/import_internet_essentials.dart';
import 'package:movie_app/screens/search_screen/components/search_screen_gridview_widget_card.dart';

class SearchScreenGridviewWidget extends StatelessWidget {
  const SearchScreenGridviewWidget({super.key, required this.list});
  final List<MovieModel> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1 / 2,
      ),
      itemBuilder: (context, index) {
        return SearchScreenGridviewWidgetCard(list: list, index: index);
      },
    );
  }
}
