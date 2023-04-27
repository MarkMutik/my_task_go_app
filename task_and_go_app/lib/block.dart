import 'package:flutter/material.dart';
class Block extends StatelessWidget {
  final String imagePath;
  const Block({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Image.asset(imagePath,
      height: 50,),
    );
  }
}
