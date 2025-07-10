import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class NavigatorScreenBottomNavigatorWidget extends StatelessWidget {
  const NavigatorScreenBottomNavigatorWidget({
    super.key,
    required this.changeView,
    required this.selectedIndex,
  });
  final Function(int index) changeView;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: changeView,
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
}
