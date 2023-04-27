import 'package:custom_top_navigator/custom_top_navigator.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'constraints.dart';
import 'package:line_icons/line_icons.dart';
import 'search.dart';
import 'profile.dart';
import 'My_Container.dart';
import 'bottom_navigation_bar.dart';


// this enum shows the occupations that user can select from.
enum Professions { plumber, electrician, carpenter, painter,gardener }

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 1,
          children: [
            ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                MyCard(label: 'Plumber'),
                SizedBox(width: listViewGap),
                MyCard(label: 'Electrician'),
                SizedBox(width: listViewGap),
                MyCard(label: 'Gardener'),
                SizedBox(width: listViewGap),
                MyCard(label: 'Carpenter'),
              ],
            ),
            const MyContainer(),
          ],
        ),
      ),
      bottomNavigationBar:BottomNavBar(),
    );
  }

}

