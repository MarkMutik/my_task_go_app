import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

const kIconSize = 32.0;
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  const BottomNavBar({Key? key, required this.selectedIndex}) : super(key: key);
// TODO: Add a logic that doesn't allow the user to navigate to the same screen.
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      height:94,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonData(index: 0, label: 'Home', icon: LineIcons.home, route: 'home_screen', selectedIndex: selectedIndex),
          ButtonData(index: 1, label: 'Search', icon: LineIcons.search, route: 'search_home-screen', selectedIndex: selectedIndex),
          ButtonData(index: 2, label: 'DashBoard', icon: LineIcons.columns, route:'dashboard-screen', selectedIndex: selectedIndex),
          ButtonData(index: 3, label: 'Profile', icon:LineIcons.userCircle, route:'profile-screen', selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}

class ButtonData extends StatefulWidget {
  const ButtonData({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    required this.route,
    required this.selectedIndex,
  }) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final String route;
  final int selectedIndex;

  @override
  _ButtonDataState createState() => _ButtonDataState();
}

class _ButtonDataState extends State<ButtonData> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.index == widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.index == widget.selectedIndex) {
          return; // Do nothing if already on the selected page
        }
        setState(() {
          _selected = true;
        });
        Navigator.pushNamedAndRemoveUntil(context, widget.route, (route) => false);
      },
      child: Column(
        children: [
          Icon(
            widget.icon,
            size: kIconSize,
            color: _selected ? Colors.black: Colors.grey,
          ),
          Text(
            widget.label,
            style: TextStyle(color: _selected ? Colors.black: Colors.grey,
              fontSize: 15,),
          ),
        ],
      ),
    );
  }
}








// THIS IS THE END OF THE BOTTOM NAVIGATION BAR