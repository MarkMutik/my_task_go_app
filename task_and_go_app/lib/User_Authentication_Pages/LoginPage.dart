import 'package:task_and_go_app/Widgets/constraints.dart';
import 'authModel.dart';
class Login_Page extends StatefulWidget{
  static const String routeName = 'login-screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => Login_Page()
    );
  }
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final UserEmailController = TextEditingController();
  final PasswordController = TextEditingController();

  // String? _errorText;
  // This function will sign users in the app
  Future<void> signInWithEmail() async {
    final email = UserEmailController.text.trim();
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

  @override
    // This saves space by clearing the data from the controllers.
    void dispose() {
      PasswordController.dispose();
      UserEmailController.dispose();
      super.dispose();
    }

    // This function will sign up users using the api they choose.
    void signUpWithGoogle() {}

    void signUpWithFacebook() {}

    // Sign up users manually using this function
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  space,
                  // TODO: Add the logo here
                  Text('Hey There 😃👋🏾.',
                    style: Theme.of(context).textTheme.titleLarge,),
                  Text('LET\'S SIGN YOU IN',
                    style: Theme.of(context).textTheme.titleLarge,),
                  space,
                  EntryTextField(textController: UserEmailController, hintText: 'Enter a Username / Email / Phone Number', obscureText: false, validationFunction: (value) {
                    if (value == null || value.isEmpty) {
                      // This will be displayed if the user does not enter anything.
                      return 'Please enter a username / email / phone number';
                    }
                    else if (value.length < 6) {
                      // This will be displayed if the user enters less than 6 characters.
                      return 'Please enter a valid username / email / phone number';
                    }
                    return null;
                  },)
                  ,SizedBox(height: 10,),
                  EntryTextField(textController: PasswordController, hintText: 'Enter a Password', obscureText: true,icon: Icons.visibility_outlined, validationFunction: (value) {
                    if (value == null || value.isEmpty) {
                      // This will be displayed if the user does not enter anything.
                      return 'Please enter a password';
                    }
                    else if (value.length < 6) {
                      // This will be displayed if the user enters less than 6 characters.
                      return 'Please enter a valid password';
                    }
                    return null;
                  },)
                  // Forgot Password
                  ,SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'forgot-password');
                    },
                    child: Text('Forgot Password?',
                      style: Theme.of(context).textTheme.displayMedium,),
                  ),
                  SizedBox(height: 40,),
                  // Users will sign in with this button.
                  Authentication_Button(
                      onTap: signInWithEmail, label: 'Sign In'),
                  // other options of signing in
                  SizedBox(height: 40,),
                  divider(),
                  SizedBox(height: 10,),
                  // User can sign in with google, facebook
                  Login_Extras(onPushGoogle: signUpWithGoogle),
                  SizedBox(height: 40),
                  // New members can also sign up manually.
                  nonMember(label_1: 'Not a member? 👀', label_2: 'Sign Up Now',
                    routeName: 'Registration_Page',),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

class Dialogue extends StatelessWidget {
  const Dialogue({
    super.key,
    required this.e,
  });

  final Object e;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        // Customize the theme here
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          onPrimary: Colors.black,
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: AlertDialog(
        title: Text('Oops!😳 ${e}', style: Theme.of(context).textTheme.labelMedium),
        content: Text('Please try again.🥺', style: Theme.of(context).textTheme.labelMedium),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

