// Date: 09-08-2021
import '../../../Widgets/widgets.dart';

class User_Settings extends StatelessWidget {
  static const String routeName = 'user-settings-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => User_Settings(),
    );
  }
  final List<String> tools = ['Push Notifications', 'Location'];
  final List <String> decisions = ['true', 'false'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings ⚙️',
        icon: LineIcons.arrowCircleLeft, onPressed: () => Navigator.pop(context) ,),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
            children: [
              SizedBox(height: 10,),
              AppText(label: 'App Permissions', style: 'title',),
              AppText(label: 'Turn on push notifications and user '
                  'location to get the latest news, events, and offers, '
                  'and to receive personalized recommendations.', style: 'Other',),
              SettingsContainer(decisions:decisions,showTrailingSwitch: true,thickness: 1, items: tools,),
              SizedBox(height: 10,),
            ])
      ),
    );
  }
}



