import 'widgets.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? icon;
  final IconData? actionIcon;
  final Function? onPressed;
  final Function? onActionPressed;
  CustomAppBar({
    required this.title,
     this.icon,
    this.actionIcon,
     this.onPressed, this.onActionPressed,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      leading: IconButton(
        icon: Icon(icon),
        onPressed: onPressed as void Function()?,
      ),
      actions: [
        IconButton(
          onPressed: onActionPressed as void Function()?,
          icon: Icon(actionIcon),
        ),
      ],
      backgroundColor:Color(0xffFAF5EF),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
