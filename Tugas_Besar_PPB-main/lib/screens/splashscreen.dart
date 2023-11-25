import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tugas_besar/screens/nav.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'hallowen.gif',
      ),
      nextScreen: Navigation(),
      splashTransition: SplashTransition.decoratedBoxTransition,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      duration: 3000,
    );
  }
}
