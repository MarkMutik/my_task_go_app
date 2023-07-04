// This is a the chat screen where users can chat with each other.

import 'package:task_and_go_app/User_Authentication_Pages/authModel.dart';
import 'package:task_and_go_app/Widgets/widgets.dart';
import 'package:task_and_go_app/screens/screens.dart';
class chatScreen extends StatefulWidget {
  static const String routeName = 'chat-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => chatScreen(),
    );
  }

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  late final User? _user;
  String _userName = '';

  void _loadUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _userName = userData['firstName'];
      });
    } else {
      setState(() {
        _userName = 'Guest';
      });
    }
  }

  List<String> _chatList = [];

  @override
  void initState() {
  super.initState();
  _user = FirebaseAuth.instance.currentUser;
  _loadUserName();
  _loadChatList();
  }

  Future<void> _loadChatList() async {
  final chatRoomsRef = FirebaseFirestore.instance.collection('chatRooms');
  final chatRoomsSnap = await chatRoomsRef.get();
  final chatRooms = chatRoomsSnap.docs;

  final userChatList = <String>[];

  chatRooms.forEach((chatRoom) {
  final participants = chatRoom.data()['participants'] as List<dynamic>;
  if (participants.contains(_user!.uid)) {
  userChatList.add(chatRoom.id);
  }
  });

  setState(() {
  _chatList = userChatList;
  });
  }

  Future<void> _sendMessage(String message) async {
  if (_user != null) {
  final partnerId = 'TODO: Replace with the ID of the chat partner';
  final chatRoomId = _getChatRoomId(_user!.uid, partnerId);
  final chatRoomRef =
  FirebaseFirestore.instance.collection('chatRooms').doc(chatRoomId);
  final chatRoomDoc = await chatRoomRef.get();
  if (!chatRoomDoc.exists) {
  await createChatRoom(_user!.uid, partnerId);
  await _loadChatList();
  }
  final newMessage = Message(
  senderId: _user!.uid,
  receiverId: partnerId,
  message: message,
  timestamp: DateTime.now(),
  );
  await chatRoomRef.collection('messages').add(newMessage.toMap());
  await _loadChatList();
  }
  }

  Future<void> createChatRoom(String userId1, String userId2) async {
  final chatRoomId = _getChatRoomId(userId1, userId2);
  final participants = [userId1, userId2];
  final chatRoomData = {'participants': participants};
  await FirebaseFirestore.instance
      .collection('chatRooms')
      .doc(chatRoomId)
      .set(chatRoomData);
  }

  String _getChatRoomId(String userId1, String userId2) {
  final sortedIds = [userId1, userId2]..sort();
  return '${sortedIds[0]}-${sortedIds[1]}';
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: CustomAppBar(
  title: 'Chats',
  icon: LineIcons.arrowCircleLeft,
  onPressed: () =>
  Navigator.pushNamedAndRemoveUntil(context, 'dashboard-screen', (route) => false),
  ),
  body: ListView.builder(
  itemCount: _chatList.length,
  itemBuilder: (context, index) {
  final chatRoomId = _chatList[index];
  return
    chartTile(OpenChatRoom: () {  },
    userImage: 'images/Hannah.png',
    lastMessage: 'Really?',
    lastMessageTime: '12:30',
    unreadMessages: 'hello',
    userName: '${_userName}',
    unreadMessagesCount: 2,

  );
  },
  ),
  );
  }
}

class Message {
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      message: map['message'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}



