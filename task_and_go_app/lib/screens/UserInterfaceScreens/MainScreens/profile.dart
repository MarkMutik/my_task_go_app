
import 'package:task_and_go_app/User_Authentication_Pages/authModel.dart';
import 'package:task_and_go_app/Widgets/Custom_App_Bar.dart';
import 'package:task_and_go_app/Widgets/ProfileTile.dart';
import 'package:task_and_go_app/Widgets/bottom_navigation_bar.dart';


class ProfilePage extends StatefulWidget {
  static const String routeName = 'profile-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProfilePage(),
    );
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
final List<String> tools = ['Profile', 'Wallet',
  'Change Password', 'Purchases', 'Address Book',
  'App Settings', 'Help & Support', ];

  final List<IconData> icons = [LineIcons.identificationBadge, LineIcons.wallet,
    LineIcons.userLock, LineIcons.luggageCart, LineIcons.addressCard, LineIcons.cogs,
    LineIcons.helpingHands, ];
final List<String> routes = [
  'profile-screen', 'wallet-screen', 'change-password', 'purchases-screen',
  'address-screen', 'user-settings-screen', 'help-support-screen',
];

  final Function(int) onTap = (int index) {
    print('tapped $index');
  };
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
void signOut() async {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black,
    builder: (context) => AlertDialog(
      title: Text('Are you sure you want to log out?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'No',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        TextButton(
          onPressed: ()
          async {
            showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator()));
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(context, 'login-screen', (route) => false);
          },
          child: Text(
            'Yes',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${ _userName}\'s Profile',),
      body: Center(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileList(items: tools, icons: icons, onTap: onTap, routes: routes),
                SizedBox(height: 10,),
                Authentication_Button(onTap: signOut, label: 'LogOut' , icon: LineIcons.alternateSignOut),
                SizedBox(height:10,)
              ],
            )
          ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 3),
      );
  }
}


