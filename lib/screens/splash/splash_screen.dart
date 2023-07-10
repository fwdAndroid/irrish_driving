import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/account/account_page.dart';
import 'package:irrish_driving/widgets/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AccountPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 40),
            child: Image.asset(
              "assets/logo.png",
              height: 300,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
