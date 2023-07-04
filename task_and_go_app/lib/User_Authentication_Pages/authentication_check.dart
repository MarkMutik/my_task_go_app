//This will check if the user is logged in or not.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  static const String routeName = 'Authentication';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => Authentication(),
    );
  }

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void navigateToScreen() {
    final User? user = _auth.currentUser;
    if (user != null) {
      Navigator.pushReplacementNamed(context, 'home_screen');
    } else {
      Navigator.pushReplacementNamed(context, 'landing-page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              print('Authentication: ${snapshot.data}');
              navigateToScreen();
            });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
