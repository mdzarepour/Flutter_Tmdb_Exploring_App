import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/widgets/categori_title.dart';
import 'package:movie_app/components/widgets/connection_error_message.dart';
import 'package:movie_app/components/widgets/list_view_item.dart';
import 'package:movie_app/components/widgets/loading.dart';
import 'package:movie_app/components/widgets/slider_item.dart';
import 'package:movie_app/models/movie.dart';

//TODO delete the futurebuilder from lists and add on entirely for screen
class HomeScreen extends StatefulWidget {
  final List<Movie> popularMoveis;
  final List<Movie> ratedMovies;
  final List<Movie> upcomingMovies;
  const HomeScreen({
    super.key,
    required this.popularMoveis,
    required this.ratedMovies,
    required this.upcomingMovies,
  });
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CategoriTitle(text: 'Popular Movies'),
                    SizedBox(height: 20),
                    _buildCarouselSlider(textTheme, size),
                    SizedBox(height: 40),
                    CategoriTitle(text: 'Top Rated Movies'),
                    SizedBox(height: 20),
                    _buildCategoryListView(size, widget.ratedMovies),
                    SizedBox(height: 30),
                    CategoriTitle(text: 'Upcoming Movies'),
                    SizedBox(height: 20),
                    _buildCategoryListView(size, widget.upcomingMovies),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // popular videos slider --->
  SizedBox _buildCarouselSlider(TextTheme textTheme, Size size) {
    return SizedBox(
      height: size.height / 2.95,
      child: CarouselSlider.builder(
        itemCount: widget.popularMoveis.length,
        options: CarouselOptions(
          height: size.height / 2.95,
          autoPlay: true,
          autoPlayCurve: Curves.easeInOut,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return SliderItem(
            index: index,
            list: widget.popularMoveis,
            size: size,
          );
        },
      ),
    );
  }

  // top rated & upcoming videos ListView --->
  SizedBox _buildCategoryListView(Size size, List<Movie> list) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : 20),
            child: ListViewItem(index: index, list: list),
          );
        },
      ),
    );
  }
}



                    // Container(
                    //   width: size.width * 0.8,
                    //   height: 45,
                    //   decoration: BoxDecoration(
                    //     color: SolidColors.primaryGrayColor,
                    //     borderRadius: BorderRadius.circular(16),
                    //   ),
                    //   child: TextField(
                    //     controller: _searchController,
                    //     style: textTheme.titleSmall,
                    //     textAlignVertical: TextAlignVertical.center,
                    //     cursorColor: SolidColors.whiteColor,
                    //     decoration: InputDecoration(
                    //       hintText: 'Search',
                    //       hintStyle: textTheme.titleSmall,
                    //       prefixIcon: HugeIcon(
                    //         icon: HugeIcons.strokeRoundedSearch01,
                    //         color: SolidColors.secondaryGrayColor,
                    //       ),
                    //     ),
                    //   ),
                    // ),