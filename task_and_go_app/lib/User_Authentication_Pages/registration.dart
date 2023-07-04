// Purpose: This page allows users to register for the app.

import 'authModel.dart';
class Registration_Page extends StatefulWidget {
  static const String routeName = 'Registration_Page';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => Registration_Page()
    );
  }
  @override
  _Registration_PageState createState() => _Registration_PageState();
}

class _Registration_PageState extends State<Registration_Page> {
  final _formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final confirmPassword = TextEditingController();
  Future<void> register({
    required String email,
    required String password,
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String userName,
  }) async {
    // Register the user with Firebase Authentication
    final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user!;

    // Save the user details to Firestore
    final userData = {
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'displayName': firstName + ' ' + lastName, // Add the display name
      'registrationDate': FieldValue.serverTimestamp(),
    };
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set(userData);
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    phoneNumber.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return
      Form(
        key: _formKey,
        child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EntryTextField(textController: firstName, hintText: 'Enter First Name', obscureText: false, validationFunction: (value){
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

              },),
                  // TODO ADD WELCOME TEXT
                  SizedBox(height: 24),
                  EntryTextField(textController: lastName, hintText: 'Enter Last Name', obscureText: false, validationFunction: (value){
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
                  SizedBox(height: 24),
                  EntryTextField(textController: email, hintText: 'Enter an Email', obscureText: false, validationFunction: (value){
                    if(value == null || value.isEmpty){
                      // This will be displayed if the user does not enter anything.
                      return 'Please enter an email';
                    }
                    else if (value.length < 6){
                      // This will be displayed if the user enters less than 6 characters.
                      return 'Please enter a valid email';
                    }
                    else if (!value.contains('@')){
                      // This will be displayed if the user does not enter an @ sign.
                      return 'Please enter a valid email';
                    }
                    else {
                      return null;
                    }
                  })
                  ,SizedBox(height: 24),
                  EntryTextField(textController: phoneNumber, hintText: 'Enter Phone Number', obscureText: false, validationFunction: (value){
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
                  },)
                  ,SizedBox(height: 24),
                  EntryTextField(textController: password, hintText: 'Enter Password', obscureText:  true, icon:LineIcons.lock, validationFunction: (value){
                    if (value?.isEmpty ?? true) {
                      // if entry is empty
                      // display to user to enter a password
                      return 'Please enter a password';
                    }
                    else if (value!.length < 8) {
                      // if entry is less than 8 characters
                      return 'Please enter a valid password';
                    }
                    else if (!value.contains(RegExp(r'\d'))) {
                      // if entry does not contain letters
                      return 'Please enter a valid password';
                    }
                    else if (!value.contains(RegExp(r'[a-z]'))) {
                      // if entry does not contain lowercase letters
                      return 'Please enter a valid password';
                    }
                    else if (!value.contains(RegExp(r'[A-Z]'))) {
                      // if entry does not contain uppercase letters
                      return 'Please enter a valid password';
                    }
                    else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      // if entry does not contain special characters
                      return 'Please enter a valid password';
                    }
                    else {
                      return null;
                    }
                  },)
                  ,SizedBox(height: 24),
                  EntryTextField(textController: confirmPassword, hintText:'Confirm Password', obscureText: true, icon:LineIcons.lock, validationFunction: (value){
                    if (value?.isEmpty ?? true) {
                      // if entry is empty
                      return 'Please confirm your password';
                    }
                    else if (value != password.text) {
                      // if entry does not match password
                      return 'Passwords do not match';
                    }
                    else {
                      return null;
                    }
                  },),
                  SizedBox(height: 24),
              Authentication_Button(
                onTap: () {
                  // CHECK IF FORM IS VALID
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
                      register(
                        email: email.text,
                        password: password.text,
                        phoneNumber: phoneNumber.text,
                        firstName: firstName.text,
                        lastName: lastName.text,
                        userName: userName.text,
                      ).then((_) {
                        // Navigate to home screen.
                        Navigator.pushNamedAndRemoveUntil(context, 'Authentication',(route) => false);
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
                },
                label: 'Register Now',
                icon: LineIcons.arrowDown,
              ),
                  // TODO Marketing box for user to agree to receive marketing emails
                  // TODO Add privacy policy box for user to agree before joining
                  // TODO: Add a button to skip the registration process
                  SizedBox(height: 24),
                  nonMember(label_1: 'Already a member? 😃', label_2: 'Login.',
                    routeName: 'login-screen',
                  ),
                ],
              ),
            ),
          ),
        ),
    ),
      );
  }
}



