import'package:task_and_go_app/Widgets/widgets.dart';

class SearchHomeScreen extends StatefulWidget {
  const SearchHomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'search_home-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SearchHomeScreen(),
    );
  }
  @override
  _SearchHomeScreenState createState() => _SearchHomeScreenState();
}

class _SearchHomeScreenState extends State<SearchHomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyCustomSilverAppBar(
              showLeading: false,
              pinned: false, snap: false, floating: true,
              icon: Icons.search,
              title: 'I\'m looking for a...', onPressed: () {
                Navigator.pushNamed(context, 'search-page');
              }),
          // Add additional slivers as needed
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}



