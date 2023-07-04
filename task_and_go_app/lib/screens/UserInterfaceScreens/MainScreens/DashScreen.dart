// The page where the user is navigated to when they click on dashboard category.
import 'package:task_and_go_app/screens/screens.dart';

import '../../../Widgets/Custom_App_Bar.dart';
class DashPage extends StatefulWidget {
  static const String routeName = 'dash-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => DashPage(),
    );
  }
  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {

  String _userName = '';
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
  @override
  void initState() {
    super.initState();
    _loadUserName();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${ _userName}\'s Dashboard',
        icon: LineIcons.tasks,
        onPressed: () => Navigator.pushReplacementNamed(context, 'booking-screen'),
        actionIcon: LineIcons.commentDots,
        onActionPressed: () => Navigator.pushReplacementNamed(context,'chat-screen'),
      ),
      body: Center(
        child: Text(
          'Swipe left and right',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
