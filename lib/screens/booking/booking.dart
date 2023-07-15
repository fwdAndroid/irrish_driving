import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/booking/confrim_booking_page.dart';
import 'package:irrish_driving/widgets/buttons.dart';
import 'package:irrish_driving/widgets/colors.dart';
import 'package:intl/intl.dart';
import 'package:irrish_driving/widgets/utils.dart';

class Booking extends StatefulWidget {
  final centerName;
  final locationName;
  final uid;
  final weburl;
  const Booking(
      {super.key,
      required this.centerName,
      required this.locationName,
      required this.weburl,
      required this.uid});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  TextEditingController dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        centerTitle: true,
        title: Image.asset(
          "assets/logo.png",
          width: 250,
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Center Name"),
            subtitle: Text(widget.centerName),
          ),
          const Divider(),
          ListTile(
            title: const Text("Center Location"),
            subtitle: Text(widget.locationName),
          ),
          const Divider(),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                onTap: () {
                  _selectDate(context);
                },
                controller: dateController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffD9D9D9).withOpacity(.5),
                  hintText: "Select Booking Date",
                  prefixIcon: const Icon(Icons.calendar_month),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),

                    borderSide: const BorderSide(
                        width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xffEBEBEB)),
                  ),
                ),
              )),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: RoundButton(
              title: "Continue",
              onPressed: () {
                if (dateController.text.isEmpty) {
                  showSnakBar("Booking Date is Necessary", context);
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ConfirmBookingPage(
                                weburl: widget.weburl,
                                centerName: widget.centerName,
                                locationName: widget.locationName,
                                uid: widget.uid,
                                bookingdate: dateController.text,
                              )));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    var newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dateController
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
