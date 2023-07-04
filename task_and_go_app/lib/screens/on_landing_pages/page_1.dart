import 'package:flutter/material.dart';
class Page_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child:
    Center(child: Text('Welcome: Page1 🤔?',
      style: Theme.of(context).textTheme.displayLarge,)),
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
