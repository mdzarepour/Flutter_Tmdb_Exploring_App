import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/core/imports/import_internet_essentials.dart';
import '../../details_screen/details_screen.dart';

class SearchScreenGridviewWidgetCard extends StatelessWidget {
  const SearchScreenGridviewWidgetCard({
    super.key,
    required this.list,
    required this.index,
  });
  final List<MovieModel> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movieId: list[index].id),
          ),
        );
      },
      // movie image --->
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: list[index].posterPath,
          placeholder: (context, url) => globalLoadingWidget(),
          errorWidget: (context, url, error) => const GlobalImageErrorWidget(),
        ),
      ),
    );
  }
}
