import 'package:flutter/material.dart';
import 'package:irrish_driving/widgets/buttons.dart';
import 'package:irrish_driving/widgets/colors.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contact Us",
          style: TextStyle(color: colorBlack, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logo.png",
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          JoinButton(
            title: "Contact us Instagram",
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          JoinButton(
            title: "Contact Via Facebook",
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          JoinButton(
            title: "Contact Via Gmail",
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
