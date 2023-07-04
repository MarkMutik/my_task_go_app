//This will be the screen that shows the user's tasks

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:task_and_go_app/Widgets/Custom_App_Bar.dart';

import '../../../Widgets/bottom_navigation_bar.dart';

class Tasks extends StatelessWidget {
  static const String routeName = 'tasks-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => Tasks(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tasks 🛠️',
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
