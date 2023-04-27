import 'package:flutter/material.dart';
import 'constraints.dart';


class My_Container extends StatelessWidget {
  const My_Container({required this.color1,
    required this.color2, required this.label,});
  final Color color1;
  final Color color2;
  final String label;
  // final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('button tapped');
      },
      child: Card(
        child: Center(
          child: Column(
            children: [
              Text(label,
                style: containerTextstyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

