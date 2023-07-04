import 'package:flutter/material.dart';

class Page_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'This is Page2.🤗',
        style: Theme.of(context).textTheme.displayLarge,
      )),
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
