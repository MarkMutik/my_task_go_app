
import 'package:task_and_go_app/configurations/app_router.dart';
import 'package:task_and_go_app/screens/screens.dart';
import 'Widgets/Themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug logo.
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}



