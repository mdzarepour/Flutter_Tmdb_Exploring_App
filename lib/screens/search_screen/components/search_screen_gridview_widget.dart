import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/core/utils/widgets/global_image_error_widget.dart';
import 'package:movie_app/core/utils/widgets/global_loading_widget.dart';
import 'package:movie_app/screens/details_screen/details_screen.dart';

class SearchScreenGridviewWidget extends StatelessWidget {
  const SearchScreenGridviewWidget({super.key, required this.list});
  final List<MovieModel> list;

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
          return GridViewItem(list: list, index: index);
        },
      ),
    );
  }
}

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.list, required this.index});
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
