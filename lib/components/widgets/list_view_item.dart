import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/details_screen.dart';

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
            builder: (context) => DetailsScreen(movieId: list[index].id),
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
              borderRadius: BorderRadius.all(Radius.circular(9)),
              child: SizedBox(
                width: size.width,
                height: 260,
                child: CachedNetworkImage(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  imageUrl: list[index].posterPath,
                  errorWidget:
                      (context, url, error) => Icon(
                        HugeIcons.strokeRoundedImage02,
                        color: SolidColors.secondaryGrayColor,
                      ),
                  placeholder: (context, url) => Loading(),
                ),
              ),
            ),
            // movie name --->
            Text(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
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
