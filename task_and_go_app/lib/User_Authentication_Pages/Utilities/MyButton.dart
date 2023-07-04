import 'package:flutter/material.dart';
import 'package:task_and_go_app/Widgets/constraints.dart';
class Authentication_Button extends StatelessWidget {
  Authentication_Button({ super.key, required this.onTap, required this.label, this.icon,});
  final Function() onTap;
  final String label;
  final IconData? icon;
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      // This is an argument that will
      // be used in the sign in page to log users in.
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color:loginButtonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(label,
                  style:Theme.of(context).textTheme.displayMedium),
              SizedBox(width: 10),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
