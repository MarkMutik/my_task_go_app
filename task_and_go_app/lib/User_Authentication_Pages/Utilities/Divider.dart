import 'package:flutter/material.dart';


class divider extends StatelessWidget {
  const divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(child:
          Divider(
            thickness: 0.5,
            color: Colors.grey[600],
          )),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child:Text('Or Continue With',
          style: Theme.of(context).textTheme.displayMedium,)
          ),
          Expanded(child:
          Divider(
            thickness: 0.5,
            color: Colors.grey[600],
          )),
        ],
      ),
    );

  }
}
