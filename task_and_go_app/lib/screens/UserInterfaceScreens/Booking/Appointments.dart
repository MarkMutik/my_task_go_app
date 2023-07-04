//
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../../Widgets/Custom_App_Bar.dart';
import '../../../Widgets/bottom_navigation_bar.dart';

class Appointments extends StatelessWidget {
  static const String routeName = 'appointment-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => Appointments(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Appointments 📅',
        icon: LineIcons.arrowCircleLeft, onPressed: () => Navigator.pop(context) ),
      body: Center(child: Container(
        color: Colors.blue,
        height: 30,
        width: 30,
      )),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}