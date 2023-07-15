import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/account/account_page.dart';
import 'package:irrish_driving/widgets/buttons.dart';
import 'package:irrish_driving/widgets/colors.dart';
import 'package:irrish_driving/widgets/dialog.dart';
import 'package:irrish_driving/widgets/utils.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/logo.png",
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CtButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (builder) => TestRoutes()));
            },
            title: "Edit Profile",
          ),
          const SizedBox(
            height: 10,
          ),
          CtButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (builder) => TestRoutes()));
            },
            title: "Notifications",
          ),
          const SizedBox(
            height: 10,
          ),
          CtButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (builder) => TestRoutes()));
            },
            title: "Contact Us",
          ),
          const SizedBox(
            height: 10,
          ),
          CtButton(
            onPressed: _logOut,
            title: "Logout",
          ),
        ],
      ),
    );
  }

  Future<void> _logOut() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialogs(
          title: "Logout\n\nAre you sure you want to logout ?",
          fl: [
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut().then((value) {
                    showSnakBar("Logout Successfully", context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (builder) => AccountPage()));
                  });
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        );
      },
    );
  }
}
