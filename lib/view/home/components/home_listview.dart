import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/widget_theme.dart';
import 'package:movie_app/utils/widgets/image_error.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/view/details/details_view.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key, required this.list});
  final List<Movie> list;

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
            child: _listViewItem(context, index),
          );
        },
      ),
    );
  }

  _listViewItem(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      // navigate to DetailsView --->
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(movieId: list[index].id),
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
                  errorWidget: (context, url, error) => imageErrorWidget(),
                  placeholder: (context, url) => loadingWidget(),
                ),
              ),
            ),
            // movie name --->
            Text(
              textAlign: TextAlign.center,
              style: ComponentsTheme.titleMedium,
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
