import 'package:flutter/material.dart';


class Login_Extras extends StatelessWidget {
  const Login_Extras({super.key , required this.onPushGoogle,
   }) ;
  final Function() onPushGoogle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPushGoogle,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent)
              ),
              child: Image.asset('images/logos/googleicon.png',height: 40,),
            ),
          ),
        ],
      ),
    );
  }
}

class nonMember extends StatelessWidget {
  const nonMember({super.key, required this.label_1,
    required this.label_2,
    required this.routeName, }) ;
  final String label_1;
  final String label_2;
  // TODO CREATE A FUNCTION THAT WILL TAKE USER TO THE CORRECT PAGE
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label_1,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(width:10,),
        GestureDetector(
          onTap:(){
            Navigator.pushReplacementNamed(context,routeName);
          },
          child: Text(label_2,
            style:Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

