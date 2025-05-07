import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/view/details/details_view.dart';

class ListViewItem extends StatelessWidget {
  final List<Movie> list;
  final int index;
  const ListViewItem({super.key, required this.list, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      //send movie id and navigate to Detail screen --->
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(movieId: list[index].id),
          ),
        );
      },
      // popular and upcoming movies list item --->
      child: SizedBox(
        width: size.width / 2.65,
        height: size.height,
        child: Column(
          spacing: 10,
          children: [
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
                      (context, url, error) => const Icon(
                        HugeIcons.strokeRoundedImage02,
                        color: SolidColors.materialSecondGrey,
                      ),
                  placeholder: (context, url) => const Loading(),
                ),
              ),
            ),
            // movie name --->
            Text(
              textAlign: TextAlign.center,
              style: AppTheme.titleMedium,
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
