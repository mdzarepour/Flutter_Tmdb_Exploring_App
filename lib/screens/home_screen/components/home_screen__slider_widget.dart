import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/models/movie_model.dart';

import 'home_screen__slider_widget_card.dart';

class HomeScreenSliderWidget extends StatelessWidget {
  const HomeScreenSliderWidget({super.key, required this.list});
  final List<MovieModel> list;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: list.length,
      options: CarouselOptions(
        height: size.height / 2.95,
        autoPlay: true,
        autoPlayCurve: Curves.easeInOut,
        viewportFraction: 0.55,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIndex) {
        return HomeScreenSliderWidgetCard(list: list, index: index);
      },
    );
  }
}
