import 'package:flutter/material.dart';
import 'package:task_and_go_app/Widgets/constraints.dart';
import 'card.dart';

class MyContainer extends StatefulWidget {
  const MyContainer({Key? key}) : super(key: key);

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('button tapped');
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          elevation:20,
          shadowColor: Colors.black,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            width:500,
            height:5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: kContainerColor,
            ),
            child: Center(
              child: Text('Feature',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
