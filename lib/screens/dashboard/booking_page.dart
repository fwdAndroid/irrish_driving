import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/tabs/current_appointment.dart';
import 'package:irrish_driving/screens/tabs/past_appointment.dart';
import 'package:irrish_driving/widgets/colors.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Appointments',
            style: TextStyle(
              color: colorBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: const TabBar(
            labelColor: mainColor,
            indicatorColor: mainColor,
            tabs: <Widget>[
              Tab(
                text: "Current Appointment",
              ),
              Tab(
                text: "Past Appointment",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[CurrentAppointment(), PastAppointment()],
        ),
      ),
    );
  }
}
