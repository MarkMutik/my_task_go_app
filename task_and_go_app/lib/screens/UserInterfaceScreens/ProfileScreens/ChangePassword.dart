import 'package:task_and_go_app/User_Authentication_Pages/authModel.dart';

import '../../../Widgets/Custom_App_Bar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  static const String routeName = 'change-password';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ChangePassword()
    );
  }
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future <void> resetPassword() async {
    print('Reset Password button pressed');
    if (_formKey.currentState?.validate() ?? false) {
      try {
        _formKey.currentState!.save();
        await FirebaseAuth.instance.sendPasswordResetEmail(
            email: emailController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reset Password link has been sent to your email'),
          ),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? "An error occurred"),
          ),
        );
      }
      final email = emailController.text.trim();
      final password = PasswordController.text.trim();

      // Show a circular progress indicator while the user is being signed in.
      showDialog(
          context: context,
          builder: (BuildContext context){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password);

        // If sign-in is successful, navigate the user to the home page.
        Navigator.popAndPushNamed(context, 'home_screen');
      } catch (e) {
        // If sign-in fails, hide the progress indicator and show an error message.
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialogue(e: e);
          },
        );

      }
    }
  }
  bool _isLoading = false;
  @override
  // This saves space by clearing the data from the controllers.
  void dispose() {
    PasswordController.dispose();
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Change Password',
        icon: LineIcons.arrowCircleLeft, onPressed:() {
          Navigator.pop(context);
        },),
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              EntryTextField(textController: emailController, hintText: 'Enter your email', obscureText: false, validationFunction:
                  (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              }
              ),
              SizedBox(height: 20,),
              EntryTextField(textController: PasswordController, hintText: 'Choose a new Password', obscureText: true,
                  validationFunction: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  }),
              SizedBox(height: 20,),
              EntryTextField(textController: confirmPasswordController, hintText: 'Re-enter Password', obscureText: true, validationFunction: (value){
                if (value?.isEmpty ?? true) {
                  // if entry is empty
                  return 'Please confirm your password';
                }
                else if (value != confirmPasswordController.text) {
                  // if entry does not match password
                  return 'Passwords do not match';
                }
                else {
                  return null;
                }
              }),
              SizedBox(height: 20,),
              Authentication_Button(
                onTap: resetPassword,
                label: 'Reset Password',),
            ],
          ),
        ),
      ),
    );
  }
}
