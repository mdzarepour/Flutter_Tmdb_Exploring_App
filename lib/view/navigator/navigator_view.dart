import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movie_app/view/home/home_view.dart';
import 'package:movie_app/view/search/searach_view.dart';

class NavigatorView extends StatefulWidget {
  const NavigatorView({super.key});
  @override
  State<StatefulWidget> createState() => _NavigatorViewState();
}

class _NavigatorViewState extends State<NavigatorView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: const [HomeView(), SearchScreen()],
          ),
        ),
      ),

      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  // bottomNavigation widget --->
  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() => _selectedIndex = index);
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(HugeIcons.strokeRoundedHome01),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(HugeIcons.strokeRoundedSearch01),
        ),
      ],
    );
  }

  // appBar widget --->
  AppBar _buildAppBar() {
    return AppBar(title: const Text('Movie App'));
  }
}
