import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/view/details/details_view.dart';

class SliderItem extends StatelessWidget {
  final Size size;
  final int index;
  final List<Movie> list;
  const SliderItem({
    super.key,
    required this.size,
    required this.list,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // send movie id and navigate to DetailsScreen =>
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsView(movieId: list[index].id),
            ),
          ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SizedBox(
          height: double.infinity,
          width: size.width / 1.90,
          // movie image --->
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: list[index].posterPath,
            errorWidget:
                (context, url, error) => const Icon(
                  HugeIcons.strokeRoundedImage02,
                  color: SolidColors.materialSecondGrey,
                ),
            placeholder: (context, url) => const Loading(),
          ),
        ),
      ),
    );
  }
}
