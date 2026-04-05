import 'package:flixzone/Screens/login.dart';
import 'package:flixzone/Screens/register.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashAndHomeState();
}

class _SplashAndHomeState extends State<Splash> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return Scaffold(
        //backgroundColor: Color(0xff1F1F29),
        backgroundColor: Color(0xff1A2232),
        body: Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Flix',
                  style: TextStyle(color: Colors.redAccent),
                ),
                TextSpan(
                  text: 'Zone',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
            ),
          ),
        ),
      );
    } else {

      return Login();
    }
  }
}