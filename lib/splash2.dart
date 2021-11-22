import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:schedular/main.dart';
import 'package:schedular/mainhome/welcome.dart';

class SplashScreen1 extends StatefulWidget {
  var user;
  SplashScreen1({required this.user});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1500,
      splash: 'assets/Schedular.jpeg',
      nextScreen: Welcome(user: widget.user),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}
