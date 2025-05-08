import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/widgets/image_error.dart';
import 'package:movie_app/utils/widgets/loading.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/view/details/details_view.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key, required this.list});
  final List<Movie> list;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 2.95,
      child: CarouselSlider.builder(
        itemCount: list.length,
        options: CarouselOptions(
          height: size.height / 2.95,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOut,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return _listViewItem(index, list, context);
        },
      ),
    );
  }

  _listViewItem(int index, List<Movie> list, BuildContext context) {
    return GestureDetector(
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
          width: MediaQuery.of(context).size.width / 1.90,
          // movie image --->
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: list[index].posterPath,
            errorWidget: (context, url, error) => imageErrorWidget(),
            placeholder: (context, url) => loadingWidget(),
          ),
        ),
      ),
    );
  }
}
