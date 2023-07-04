import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

// This will generate a customised sliver app bar for each screen.

class MyCustomSilverAppBar extends StatelessWidget {
  MyCustomSilverAppBar({Key? key, required this.pinned, this.icon,
    required this.snap, required this.floating,
     required this.title,  this.onPressed, required this.showLeading,
  }) : super(key: key);
  final bool pinned;
  final bool snap ;
  final bool floating ;
  final IconData? icon;
  final String title;
  final Function()? onPressed;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Visibility(
        visible: showLeading,
          child: IconButton(
            icon:Icon(LineIcons.locationArrow,
              size:20.0,
            color: Colors.black,),
            onPressed: () {},
          )),
      pinned: pinned,
      snap: snap,
      floating: floating,
      centerTitle: true,
      title: Row(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[SizedBox(width: 10,),
                    Icon(icon, color: Colors.black,),
                    SizedBox(width: 10,),
                    Text(title,
                      style:Theme.of(context).textTheme.titleMedium),],
                ),
              ),
            ),
          ),
        ],
      ),

    );

  }
}

// TODO: Add a function that will ask user to allow location access using the
