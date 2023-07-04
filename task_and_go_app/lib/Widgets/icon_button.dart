import 'package:flutter/material.dart';
import 'constraints.dart';
class AppBarIcon extends StatelessWidget {
  const AppBarIcon({Key? key, required this.icon, }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Card(
        elevation: 4,
color: Colors.white,
        // shadowColor: kCircleColor,
        shape: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          // THE TRANSPARENT COLOR IS USED FOR UNIFORMITY.
          child: Icon(icon, color: Colors.black, size: 35),
        ),
      ),
    );
  }
}

