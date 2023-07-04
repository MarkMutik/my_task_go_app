// This will be the gridlist for the app.
import'widgets.dart';
class ProfileList extends StatelessWidget {
  final List<String> items;
  final List<IconData> icons;
  final Function(int) onTap;
  final List<String> routes;
  ProfileList({
    required this.items,
    required this.icons,
    required this.onTap, required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              icons[index],
              color: Colors.black
            ),
            title: Text(
              items[index],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pushNamed(context, routes[index],),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

// This will be the gridlist for the app settings.

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.showTrailingSwitch, required this.label, required this.thickness
  }) : super(key: key);

  final bool showTrailingSwitch ;
  final String label;
  final int thickness;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: showTrailingSwitch ? CustomSwitch(value: true) : CustomBox(),
        ),
        Divider(
          color: Colors.grey,
          thickness: thickness.toDouble(),
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomSwitch({Key? key, required this.value, this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          if (widget.onChanged != null) {
            widget.onChanged!(_value);
          }
          // Update the isDark variable based on the switch value
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 46,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black,
          ),
          color: _value ? Colors.white: Colors.black,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: _value ? 20 : 0,
              right: _value ? 0 : 20,
              child: Container(
                width: 30,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomBox extends StatefulWidget {
  const CustomBox({Key? key}) : super(key: key);

  @override
  State<CustomBox> createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  bool _acceptance = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          // FILL in the box
          _acceptance = !_acceptance;
        });
      },
      child:Icon(
        _acceptance?
        LineIcons.square : LineIcons.checkSquare,
        size: 40,
      color: _acceptance? Colors.black: Colors.black)
    );
  }
}

