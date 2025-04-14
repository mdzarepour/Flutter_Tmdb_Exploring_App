import 'package:flutter/material.dart';
import 'package:movie_app/components/constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: size.width * 0.8,
                height: 45,
                decoration: BoxDecoration(
                  color: SolidColors.primaryGrayColor,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TextField(
//                   controller: _searchController,
//                   style: textTheme.titleSmall,
//                   textAlignVertical: TextAlignVertical.center,
//                   cursorColor: SolidColors.whiteColor,
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     hintStyle: textTheme.titleSmall,
//                     prefixIcon: HugeIcon(
//                       icon: HugeIcons.strokeRoundedSearch01,
//                       color: SolidColors.secondaryGrayColor,
//                     ),
//                   ),
//                 ),
