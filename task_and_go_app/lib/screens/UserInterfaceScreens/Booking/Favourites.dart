//

import 'package:task_and_go_app/Widgets/widgets.dart';

class Favourites extends StatelessWidget {
  static const String routeName = 'fav-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => Favourites(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favourites 😻',
          icon: LineIcons.arrowCircleLeft, onPressed: () => Navigator.pop(context)
      ),
      body: Center(child: Container(
        color: Colors.red,
        height: 30,
        width: 30,
      )),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}
 //This is the screen that shows the user's favourite bookings