import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/widgets/global_image_error_widget.dart';
import '../../../core/utils/widgets/global_loading_widget.dart';
import '../../../models/movie_model.dart';
import '../../details_screen/details_screen.dart';

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
