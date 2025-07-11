import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/core/utils/widgets/global_image_error_widget.dart';
import 'package:movie_app/core/utils/widgets/global_loading_widget.dart';
import 'package:movie_app/screens/details_screen/details_screen.dart';
import 'package:movie_app/screens/search_screen/components/search_screen_gridview_widget_card.dart';

class SearchScreenGridviewWidget extends StatelessWidget {
  const SearchScreenGridviewWidget({super.key, required this.list});
  final List<MovieModel> list;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: list.length,
      //shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1 / 2,
      ),
      itemBuilder: (context, index) {
        return GridViewItem(list: list, index: index);
      },
    );
  }
}
