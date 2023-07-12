import 'package:flutter/material.dart';
import 'package:irrish_driving/widgets/buttons.dart';
import 'package:irrish_driving/widgets/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        children: [
          Image.asset(
            "assets/logo.png",
            height: 250,
            fit: BoxFit.fill,
          ),
          CtButton(
            onPressed: () {},
            title: "Test Routes",
          ),
          const SizedBox(
            height: 15,
          ),
          CtButton(
            onPressed: () {},
            title: "Video Tutorials",
          ),
          const SizedBox(
            height: 15,
          ),
          CtButton(
            onPressed: () {},
            title: "Road Signs",
          ),
          const SizedBox(
            height: 15,
          ),
          CtButton(
            onPressed: () {},
            title: "Driving Test Questions",
          ),
          const SizedBox(
            height: 15,
          ),
          CtButton(
            onPressed: () {},
            title: "Contact Us",
          ),
        ],
      ),
    );
  }
}
