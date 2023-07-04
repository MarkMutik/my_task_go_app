
import 'package:flutter/material.dart';
import 'constraints.dart';
// Simplified version of the card widget.

class MyCard extends StatelessWidget {
  const MyCard({super.key,  required this.label,});

  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Card(
        elevation:5,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height:cardHeight,
          width:cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color:kCardColor,
          ),
          child: Center(
            child: Text(label,
              style: divider_textstyle,
            ),
          ),
        ),
      ),
    );
  }
}




