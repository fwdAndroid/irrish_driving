import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/test_routes/routes.dart';
import 'package:irrish_driving/widgets/mywidget.dart';
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => TestRoutes()));
            },
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => MyWidget(
                            url:
                                "https://www.pinnacledrivingschool.ie/irish-road-signs-new/",
                            title: "Road Signs",
                          )));
            },
            title: "Road Signs",
          ),
          const SizedBox(
            height: 15,
          ),
          CtButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => MyWidget(
                            url:
                                "https://www.pinnacledrivingschool.ie/driving-test-questions/",
                            title: "Driving Test Questions",
                          )));
            },
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
