import 'package:flutter/material.dart';
import 'icon_button.dart';
import 'package:line_icons/line_icons.dart';
import 'constraints.dart';
import 'search.dart';
import 'profile.dart';
import 'home_interface.dart';


class ProfilePage extends StatefulWidget {
  // TODO Refer to the firebase on udemy to sort this out

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentPage = 2;
  final List <Widget> _screens= [
    const StartScreen(),
    const SearchPage(),
    ProfilePage(),
  ];
  Widget buildBottomNavigatorBar(){
    return BottomNavigationBar(
      currentIndex: _currentPage,
      onTap: (page) {
        setState(() {
          _currentPage = page; // Update the current page when an icon is pressed
        });

        if (page == 0) {
          _currentPage = 0;
          // Navigate to Search page
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => StartScreen()));
        } else if (page == 1) {
          _currentPage = 1;
          // Navigate to Home page
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SearchPage()));
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(LineIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.user),
          label: 'Profile',
        ),
      ],
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                  IconContent(icon:LineIcons.arrowLeft),
                ],
              ),
              const Text('Profile Page',
              style:containerTextstyle),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigatorBar(),
    );
  }
}
