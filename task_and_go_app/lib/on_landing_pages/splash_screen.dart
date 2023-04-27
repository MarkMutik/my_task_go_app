import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final  colorise_colors = [Colors.white,
    Colors.greenAccent,
  Colors.green];
  final  color_textstyle = TextStyle(
    fontSize: 50,
    fontFamily: 'Horizon',
  );

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, 'landing-page');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:AnimatedTextKit(animatedTexts:[
          ColorizeAnimatedText('TASK & GO',
          textStyle:color_textstyle,
            colors: colorise_colors,
            speed: Duration(milliseconds: 300),
          )
        ],
        isRepeatingAnimation: false,
        ),
      ),
    );
  }
}
