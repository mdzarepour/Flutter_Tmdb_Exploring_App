import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/widgets/image_error.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/view/details/details_view.dart';

class SearchGridview extends StatelessWidget {
  const SearchGridview({super.key, required this.list});
  final List<Movie> list;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 240,
      width: size.width,
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          return _buildGridvewItem(context, index);
        },
      ),
    );
  }

  GestureDetector _buildGridvewItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(movieId: list[index].id),
          ),
        );
      },
      // movie image --->
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: list[index].posterPath,
          placeholder: (context, url) => loadingWidget(),
          errorWidget: (context, url, error) => imageErrorWidget(),
        ),
      ),
    );
  }
}
