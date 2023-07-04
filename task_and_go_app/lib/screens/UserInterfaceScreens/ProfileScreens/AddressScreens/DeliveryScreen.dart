
import 'package:task_and_go_app/User_Authentication_Pages/authModel.dart';
import 'package:task_and_go_app/Widgets/Custom_App_Bar.dart';

class AddDelivery extends StatefulWidget {
  const AddDelivery({Key? key}) : super(key: key);
  static const String routeName = 'delivery-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => AddDelivery(),
    );
  }
  @override
  State<AddDelivery> createState() => _AddDeliveryState();
}

class _AddDeliveryState extends State<AddDelivery> {
  final _formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final PO_BOX = TextEditingController();
  final City = TextEditingController();
  final Address_Details1 = TextEditingController();
  final Address_Details2 = TextEditingController();
  final Specifics = TextEditingController();
  final Number = TextEditingController();
  Future <void> register({
    required String firstName,
    required String lastName,
    required String PO_BOX,
    required String City,
    required String address1,
    required String address2,
    required String specifics,
    required  int Number ,

})
    async {
      User user = FirebaseAuth.instance.currentUser!;
     final AddressData = {
       'PhoneNumber': Number,
        'FirstName': firstName,
        'LastName': lastName,
        'PO_BOX': PO_BOX,
        'City': City,
        'Address_Details1': address1,
        'Address_Details2': address2,
        'Specifics': specifics,
     };
      await FirebaseFirestore.instance.collection('users').doc(user.uid).collection('Address').add(AddressData);
}
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Add Delivery Address', icon: LineIcons.arrowCircleLeft, onPressed: () => Navigator.pop(context)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              EntryTextField(textController: firstName, hintText: 'First Name', obscureText: false, validationFunction: (value){
                if (value?.isEmpty ?? true) {
                  // if username is empty
                  return 'Please enter your first name';
                }
                else if (value!.length < 3) {
                  // if username is less than 3 characters
                  return 'Please enter a valid first name';
                }
                else if (value.contains(RegExp(r'\d'))) {
                  // if first name contains numbers
                  return 'Please enter a valid first name';
                }
                else if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  // if first name contains special characters
                  return 'Please enter a valid first name';
                }
                else if (value.contains(RegExp(r'\s'))) {
                  // if first name contains spaces
                  return 'Please enter a valid first name';
                }
                else {
                  return null;
                }

              }),
              SizedBox(
                height: 20.0,
              ),
              EntryTextField(textController: lastName, hintText: 'Last Name', obscureText: false, validationFunction: (value){
                if (value?.isEmpty ?? true) {
                  // if username is empty
                  return 'Please enter your last name';
                }
                else if (value!.length < 3) {
                  // if username is less than 3 characters
                  return 'Please enter a valid last name';
                }
                else if (value.contains(RegExp(r'\d'))) {
                  // if first name contains numbers
                  return 'Please enter a valid last name';
                }
                else if (
                value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  // if first name contains special characters
                  return 'Please enter a valid last name';
                }
                else if (value.contains(RegExp(r'\s'))) {
                  // if first name contains spaces
                  return 'Please enter a valid last name';
                }
                else {
                  return null;
                }
              }),
              SizedBox(
                height: 20.0,
              ),
              EntryTextField(textController: Number, hintText: 'Phone Number', obscureText: false, validationFunction: (value){
                if (value?.isEmpty ?? true) {
                  // if entry is empty
                  return 'Please enter your phone number';
                }
                else if (value!.length < 8) {
                  // if entry is less than 10 digits
                  return 'Please enter a valid phone number';
                }
                else if (value.contains(RegExp(r'[a-zA-Z]'))) {
                  // if entry contains letters
                  return 'Please enter a valid phone number';
                }
                else {
                  return null;
                }
              },),
              SizedBox(
                height: 20.0,
              ),
              EntryTextField(textController: City, hintText: 'City Name', obscureText: false, validationFunction: (value){
                if (value?.isEmpty ?? true) {
                  // if entry is empty
                  return 'Please enter your City';
                }
                else if (value!.length < 5) {
                  // if entry is less than 10 digits
                  return 'Please enter a valid city name';
                }
                else if (value.contains(RegExp(r'[0-9]'))) {
                  // if entry contains numbers
                  return 'Please enter a valid city name';
                }
                else {
                  return null;
                }
              },),
              SizedBox(
                height: 20.0,
              ),
              EntryTextField(textController: Address_Details1, hintText: 'House Number Or Street Address', obscureText: false, validationFunction: (value){
                if (value?.isEmpty ?? true) {
                  // if entry is empty
                  return 'Please enter an Address Details ';
                }
                else if (value!.length < 8) {
                  // if entry is less than 10 digits
                  return 'Please enter a valid Address Details 1';
                }
                else {
                  return null;
                }
              },),
              SizedBox(
                height: 20.0,
              ),
              EntryTextField(textController: Address_Details2, hintText: 'Address Line 2 (Optional)', obscureText: false, validationFunction: (value){},),
              SizedBox(
                height: 20.0,
              ),
              EntryTextField(textController: PO_BOX, hintText: 'P.O BOX', obscureText: false, validationFunction: (value){},),
              SizedBox(
                height: 20.0,
              ),
              EntryTextField(textController: Specifics, hintText: 'Add Extra Directions', obscureText: false, validationFunction: (value){},),
              SizedBox(
                height: 20.0,
              ),
              Authentication_Button(onTap: (){
                if (_formKey.currentState?.validate() == true) {
                  // Show a circular progress indicator while registering the user
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ).then((_) {
                    // Store user inputs into cloud firebase.
                    register(firstName: firstName.text,
                        lastName: lastName.text, PO_BOX: PO_BOX.text,
                        City: City.text, address1: Address_Details1.text, address2: Address_Details1.text,
                        specifics: Specifics.text, Number: int.parse(Number.text)).then((_) {
                      // Navigate to home screen.
                      Navigator.pushNamedAndRemoveUntil(context, 'address-screen',(route) => false);
                    }).catchError((error) {
                      // Display error message if registration fails
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())),
                      );
                    });
                  });
                } else {
                  // If form is not valid, display error message.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter valid information')),
                  );
                }
              }, label: 'Add Address'),
              SizedBox(height: 30.0,)
            ],
          ),
        ),
      ),
    );
  }
}

