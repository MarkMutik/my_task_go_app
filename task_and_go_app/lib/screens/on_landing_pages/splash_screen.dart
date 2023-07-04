import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash-screen';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final colorise_colors = [
    Colors.black,
    Colors.greenAccent,
    Colors.green
  ];
  final color_textstyle = TextStyle(
    fontSize: 50,
    fontFamily: 'Horizon',
  );
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, 'Authentication'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'TASK & GO',
              textStyle: color_textstyle,
              colors: colorise_colors,
              speed: Duration(milliseconds: 300),
            ),
          ],
          isRepeatingAnimation: false,
        ),
      ),
    );
  }
}



