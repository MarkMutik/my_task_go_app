import 'package:flutter/material.dart';

class IconContent extends StatefulWidget {
  IconContent({required this.imageIcon});
  final IconData imageIcon;

  @override
  State<IconContent> createState() => _IconContentState();
}

class _IconContentState extends State<IconContent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ,
      child: CircleAvatar(
        backgroundColor: Colors.cyanAccent,
        child: Icon(
          widget.imageIcon
        ),
      ),
    );
  }
}
