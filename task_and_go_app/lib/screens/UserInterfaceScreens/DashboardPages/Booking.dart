import 'package:task_and_go_app/screens/screens.dart';
import '../../../Widgets/Custom_App_Bar.dart';
import '../../../Widgets/ProfileTile.dart';
class Booking extends StatefulWidget {
  static const String routeName = 'booking-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => Booking(),
    );
  }

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  String _userName = '';
  final List<String> tools = ['Tasks', 'Favourites',
    'Appointments', 'Settings',  ];

  final List<String> routes = ['tasks-screen', 'fav-screen',
    'appointment-screen',  'user-settings-screen', ];
  final List<IconData> icons = [LineIcons.tasks, LineIcons.heartAlt,
    LineIcons.calendarCheck, LineIcons.tools,];
  void _loadUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _userName = userData['firstName'];
      });
    }
    else {
      setState(() {
        _userName = 'Guest';
      });
    }
  }
  final Function(int) onPressed = (int index) {
    print('tapped $index');
  };  @override
  void initState() {
    super.initState();
    _loadUserName();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${ _userName}\'s List',
        actionIcon: LineIcons.arrowCircleRight,
        onActionPressed: () => Navigator.pushNamedAndRemoveUntil(context,'dashboard-screen', (route) => false),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileList(items: tools, icons: icons, onTap: onPressed, routes:routes,)
            ],
          ),
        ),
      ),
    );
  }
}