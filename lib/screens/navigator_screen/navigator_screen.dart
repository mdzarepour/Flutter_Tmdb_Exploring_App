import 'package:flutter/material.dart';
import 'package:movie_app/screens/navigator_screen/components/navigator_screen_bottom_navigator_widget.dart';
import 'package:movie_app/screens/navigator_screen/components/navigator_screen_appbar_widget.dart';
import 'package:movie_app/screens/home_screen/home_screen.dart';
import 'package:movie_app/screens/search_screen/searach_screen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});
  @override
  State<StatefulWidget> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: NavigatorScreenAppbarWidget(),
      ),
      body: Center(
        child: SafeArea(
          child: IndexedStack(
            index: selectedIndex,
            children: const [HomeScreen(), SearchScreen()],
          ),
        ),
      ),

      bottomNavigationBar: NavigatorScreenBottomNavigatorWidget(
        changeView: changeView,
        selectedIndex: selectedIndex,
      ),
    );
  }

  void changeView(int index) => setState(() => selectedIndex = index);
}
