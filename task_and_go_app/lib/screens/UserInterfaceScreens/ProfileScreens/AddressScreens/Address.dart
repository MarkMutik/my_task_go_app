import 'package:task_and_go_app/User_Authentication_Pages/authModel.dart';
import '../../../../Widgets/ChatTile.dart';
import '../../../../Widgets/Custom_App_Bar.dart';
class AddressScreen extends StatefulWidget {
  static const String routeName = 'address-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => AddressScreen(),
    );
  }
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String _userName = '';
  void _loadUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        _userName = userData['firstName'];
      });
    }
    else {
      setState(() {
        _userName = 'Guest';
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _loadUserName();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '${ _userName}\'s Address Book',
      icon: LineIcons.arrowCircleLeft,
      onPressed: () => Navigator.pop(context),),
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Authentication_Button(onTap: (){
            Navigator.pushNamed(context, 'delivery-screen');
          }, label: 'Add Address',icon: LineIcons.plusCircle,),
          SizedBox(height: 20.0,),
          AppText(label: 'Swipe Left to Delete', style: 'Other'),
          SizedBox(height: 20.0,),
          Expanded(child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('Address').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot address = snapshot.data!.docs[index];
                      return Column(
                        children: [
                          Dismissible(
                            key: Key(address.id),
                            onDismissed: (direction) {
                              FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('Address').doc(address.id).delete();
                            },
                            background: Container(
                              color: Colors.red,
                              child: Icon(LineIcons.trash, color: Colors.white),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 20.0),
                            ),
                            child: ListTile(
                              title: AppText(label: '${address['FirstName']} ${address['LastName']}', style: 'title'),
                              subtitle: AppText(
                                  label: '${address['Address_Details1']},\n${address['City']},\n${address['Specifics']},\n${address['PO_BOX']},\n${address['PhoneNumber']}',
                                  style: 'Other'
                              ),
                              trailing: IconButton(
                                icon: Icon(LineIcons.edit),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'edit-address-screen', arguments: address);
                                },
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                          ),
                        ],
                      );

                    },
                  );
                }
                else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}