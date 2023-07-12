import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:irrish_driving/screens/main_screen.dart';
import 'package:irrish_driving/services/db.dart';
import 'package:irrish_driving/widgets/colors.dart';
import 'package:irrish_driving/widgets/textfield.dart';
import 'package:irrish_driving/widgets/utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class GoogleProfileScreen extends StatefulWidget {
  const GoogleProfileScreen({super.key});

  @override
  State<GoogleProfileScreen> createState() => _GoogleProfileScreenState();
}

class _GoogleProfileScreenState extends State<GoogleProfileScreen> {
  DateTime? _selectedDate;
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List<String> dropdownItemList = [
    "Male",
    "Female",
    "Others",
  ];
  final _formKey = GlobalKey<FormState>();

  String art = "Male";
  bool isLoading = false;
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fill Your Profile",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => selectImage(),
                child: Center(
                  child: _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : Image.asset(
                          "assets/profile.png",
                          height: 120,
                        ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextFormInputField(
                    controller: nameController,
                    hintText: "Enter Name",
                    textInputType: TextInputType.name,
                  )),
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
                      hintText: "Date of Birth",
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
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffEBEBEB)),
                      ),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: DropdownButtonFormField<String>(
                  hint: const Text("Select Gender"),
                  focusColor: Colors.black,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: const Color(0xffD9D9D9).withOpacity(.5),
                    labelStyle: const TextStyle(color: Colors.black),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                    ),
                  ),
                  borderRadius: BorderRadius.circular(6),
                  value: art,
                  isDense: true,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      art = value!;
                    });
                  },
                  items: dropdownItemList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: IntlPhoneField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      helperStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey,
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.only(top: 10),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xffEBEBEB)), //<-- SEE HERE
                      ),
                    ),
                    initialCountryCode: 'TH',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: profile,
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            "Continue",
                            style: TextStyle(color: colorWhite),
                          ),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        fixedSize: const Size(337, 53),
                        backgroundColor: mainColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
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

  void profile() async {
    if (nameController.text.isEmpty) {
      showSnakBar("Name is  Required", context);
    } else if (dateController.text.isEmpty) {
      showSnakBar("Date of Birth is  Required", context);
    } else if (phoneController.text.isEmpty) {
      showSnakBar("Phone Number is  Required", context);
    } else if (nameController.text.isEmpty &&
        phoneController.text.isEmpty &&
        dateController.text.isEmpty) {
      showSnakBar("All Fields  is  Required", context);
    } else {
      setState(() {
        isLoading = true;
      });
      String res = await DatabaseMethods().googleProfile(
          email: FirebaseAuth.instance.currentUser!.email!,
          dob: dateController.text,
          phoneNumber: phoneController.text,
          username: nameController.text,
          file: _image!);

      setState(() {
        isLoading = false;
      });
      if (res != 'success') {
        showSnakBar(res, context);
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (builder) => MainScreen()));
      }
    }
  }
}
