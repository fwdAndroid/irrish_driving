import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irrish_driving/widgets/colors.dart';
import 'package:irrish_driving/widgets/mywidget.dart';

class ConfirmBookingPage extends StatefulWidget {
  final centerName;
  final locationName;
  final uid;
  final weburl;
  final bookingdate;
  const ConfirmBookingPage(
      {super.key,
      required this.centerName,
      required this.locationName,
      required this.uid,
      required this.bookingdate,
      required this.weburl});

  @override
  State<ConfirmBookingPage> createState() => _ConfirmBookingPageState();
}

class _ConfirmBookingPageState extends State<ConfirmBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Payment",
          style: TextStyle(
              color: colorBlack, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            var document = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Booking Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                ListTile(
                  title: const Text("User Name"),
                  subtitle: Text(document['name']),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Center Name"),
                  subtitle: Text(widget.centerName),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Location Name"),
                  subtitle: Text(widget.centerName),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Route Link"),
                  subtitle: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MyWidget(
                                    title: widget.centerName,
                                    url: widget.weburl)));
                      },
                      child: Text(
                        widget.weburl,
                        style: const TextStyle(color: blueColor),
                      )),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Booking Date"),
                  subtitle: Text(widget.bookingdate),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "100\$",
                        style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("Book Appointment"))
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
