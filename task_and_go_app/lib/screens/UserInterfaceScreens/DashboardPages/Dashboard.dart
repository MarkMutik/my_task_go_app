import 'package:task_and_go_app/Widgets/widgets.dart';
import 'package:task_and_go_app/screens/UserInterfaceScreens/DashboardPages/dash.dart';
import 'package:task_and_go_app/screens/screens.dart';

// This is where users book in advance for each service.
// It uses the date picker widget.

class DashBoard extends StatefulWidget {
  static const String routeName = 'dashboard-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => DashBoard(),
    );
  }
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  PageController _screenController = PageController(initialPage: 1);
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _screenController,
        onPageChanged: (page) {
          setState(() {
            _selectedPage = page;
          });
        },
            children: [
              Booking(),
              DashPage(),
              chatScreen(),
            ],
          )
            ],
          ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}
