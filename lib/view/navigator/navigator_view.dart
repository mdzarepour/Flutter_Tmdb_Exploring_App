import 'package:flutter/material.dart';
import 'package:movie_app/view/navigator/components/bottom_navigator.dart';
import 'package:movie_app/view/navigator/components/navigator_appbar.dart';
import 'package:movie_app/view/home/home_view.dart';
import 'package:movie_app/view/search/searach_view.dart';

class NavigatorView extends StatefulWidget {
  const NavigatorView({super.key});
  @override
  State<StatefulWidget> createState() => _NavigatorViewState();
}

class _NavigatorViewState extends State<NavigatorView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navigatorAppBar(context),
      body: Center(
        child: SafeArea(
          child: IndexedStack(
            index: selectedIndex,
            children: const [HomeView(), SearchScreen()],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigator(
        changeView: changeView,
        selectedIndex: selectedIndex,
      ),
    );
  }

  void changeView(int index) => setState(() => selectedIndex = index);
}
