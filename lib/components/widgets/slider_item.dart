import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/constants/colors.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/screens/details_screen.dart';

class SliderItem extends StatelessWidget {
  final Size size;
  final int index;
  final AsyncSnapshot snapshot;
  const SliderItem({
    super.key,
    required this.size,
    required this.snapshot,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // send movie id and navigate to DetailsScreen =>
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailsScreen(movieId: snapshot.data[index].id),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: SizedBox(
          height: double.infinity,
          width: size.width / 1.90,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: snapshot.data[index].posterPath,
            errorWidget: (context, url, error) => Icon(
              HugeIcons.strokeRoundedImage02,
              color: SolidColors.secondaryGrayColor,
            ),
            placeholder: (context, url) => Loading(),
          ),
        ),
      ),
    );
  }
}
