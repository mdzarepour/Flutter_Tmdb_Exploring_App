import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/components/widgets/loading.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.snapshot, required this.index});
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: snapshot.data![index].posterPath,
        placeholder: (context, url) => Loading(),
        errorWidget:
            (context, url, error) =>
                Icon(size: 40, HugeIcons.strokeRoundedImage01),
      ),
    );
  }
}
