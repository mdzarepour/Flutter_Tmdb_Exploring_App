import 'package:movie_app/core/imports/import_core.dart';

import 'package:movie_app/core/imports/import_internet_essentials.dart';

import '../../details_screen/details_screen.dart';

class HomeScreenListviewWidgetCard extends StatelessWidget {
  const HomeScreenListviewWidgetCard({
    super.key,
    required this.index,
    required this.list,
  });
  final int index;
  final List<MovieModel> list;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      // navigate to DetailsView --->
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movieId: list[index].id),
          ),
        );
      },
      child: SizedBox(
        width: size.width / 2.65,
        height: size.height,
        child: Column(
          spacing: 10,
          children: [
            // movie image --->
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              child: SizedBox(
                width: size.width,
                height: 260,
                child: CachedNetworkImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  imageUrl: list[index].posterPath,
                  errorWidget:
                      (context, url, error) => const GlobalImageErrorWidget(),
                  placeholder: (context, url) => globalLoadingWidget(),
                ),
              ),
            ),
            // movie name --->
            Text(
              textAlign: TextAlign.center,
              style: AppWidgetTheme.titleMedium,
              list[index].originalTitle,
              maxLines: 1,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
