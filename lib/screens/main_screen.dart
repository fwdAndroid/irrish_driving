import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/dashboard/booking_page.dart';
import 'package:irrish_driving/screens/dashboard/home_page.dart';
import 'package:irrish_driving/screens/dashboard/my_profile.dart';

class MainScreen extends StatefulWidget {
  // MainScreen ({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    const HomePage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Welcome
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        const HomePage(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      currentTab == 0
                          ? 'assets/locationcolor.png'
                          : 'assets/location.png',
                      height: 20,
                    )
                  ],
                ),
              ),

              //Calender
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        BookingPage(); // if user taps on this dashboard tab will be active

                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      currentTab == 1
                          ? 'assets/colors.png'
                          : 'assets/calender.png',
                      height: 20,
                    )
                  ],
                ),
              ),

              //Profile
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const MyProfile();
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      currentTab == 2
                          ? 'assets/profilecolor.png'
                          : 'assets/person.png',
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
