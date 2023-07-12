import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/status/checkstatus.dart';
import 'package:irrish_driving/services/auth_service.dart';
import 'package:irrish_driving/widgets/buttons.dart';
import 'package:irrish_driving/widgets/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset("assets/logo.png"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Login",
              style: TextStyle(
                color: mainColor,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Please select below option to continue.",
              style: TextStyle(
                color: colorDark,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AuthButton(
                onPressed: () async {
                  await AuthServices().signInWithGoogle().then((value) => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => CheckStatus()))
                      });
                },
                title: "Log In With Google",
                image: "assets/googl.png",
              ),
            ),
          ),
          AuthButton(
            onPressed: () async {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (builder) => const ContinuePhone()));
            },
            title: "Log In With Phone Number",
            image: "assets/imgGgphone.png",
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff246A73).withOpacity(.10),
            ),
            margin: const EdgeInsets.only(left: 10, top: 24, right: 10),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "By registering or creating an account, you agree to our Terms of Use. Read our Privacy Policy to learn more about how we process your data.",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff246A73),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ProximaNova"),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
