import 'widgets.dart';

class chartTile extends StatelessWidget {
  const chartTile({
    Key? key,
    required void Function() OpenChatRoom, // change the type to 'void Function()'
    required String userName,
    required String userImage,
    required String lastMessage,
    required String lastMessageTime,
    required String unreadMessages,
    required int unreadMessagesCount,
  }) :
        OpenChatRoom = OpenChatRoom,
        userName = userName,
        userImage = userImage,
        lastMessage = lastMessage,
        lastMessageTime = lastMessageTime,
        unreadMessages = unreadMessages,
        unreadMessagesCount = unreadMessagesCount,
        super(key: key);

  final void Function() OpenChatRoom; // explicitly define the type
  final String userName ;
  final String userImage ;
  final String lastMessage ;
  final String lastMessageTime ;
  final String unreadMessages ;
  final int unreadMessagesCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OpenChatRoom,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage:Image.asset('images/Hannah.png',).image,
        ),
        title: Text(userName,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        subtitle: Text(lastMessage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(lastMessageTime,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  unreadMessagesCount.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class SettingsContainer extends StatelessWidget {
  const SettingsContainer({
    super.key, required this.showTrailingSwitch,  required this.thickness, required this.items, required this.decisions,
  });
  final bool showTrailingSwitch ;

  final int thickness;
  final List<String> items;
  final List <String> decisions;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: items.length * 70.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index],
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: decisions[index] == 'true' ? CustomSwitch(value: true) : CustomBox(),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey,
            thickness: thickness.toDouble(),
            indent: 16,
            endIndent: 16,
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText({Key? key, required this.label, required this.style}) : super(key: key);
  final String label;
  final String style;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: style == 'title' ? Theme.of(context).textTheme.displayMedium : Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

