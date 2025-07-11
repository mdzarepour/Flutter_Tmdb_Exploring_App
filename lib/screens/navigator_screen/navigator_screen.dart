import 'package:movie_app/core/imports/import_core.dart';
import 'package:movie_app/core/imports/import_navigator_screen.dart';
import '../home_screen/home_screen.dart';
import '../search_screen/searach_screen.dart';

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
