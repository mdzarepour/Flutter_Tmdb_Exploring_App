import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/core/constants/colors.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key, required this.searchMovie});
  final void Function(String input) searchMovie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.3,
      decoration: const BoxDecoration(
        color: SolidColors.materialFirstGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: SolidColors.materialWhite,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          hintText: 'Search',
          prefixIcon: Icon(HugeIcons.strokeRoundedSearch01),
          border: InputBorder.none,
        ),
        onChanged: searchMovie,
      ),
    );
  }
}
