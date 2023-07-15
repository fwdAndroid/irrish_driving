import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/main_screen.dart';
import 'package:irrish_driving/widgets/buttons.dart';
import 'package:irrish_driving/widgets/colors.dart';
import 'package:irrish_driving/widgets/textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController dob = TextEditingController();
    TextEditingController name = TextEditingController();
    Uint8List? _image;
    String image = "";

    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: colorBlack, fontWeight: FontWeight.w600),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return new CircularProgressIndicator();
            }
            var document = snapshot.data;
            dob.text = document['dob'];
            name.text = document['name'];
            image = document['photoURL'];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  // onTap: () => selectImage(),
                  child: _image != null
                      ? CircleAvatar(
                          radius: 60, backgroundImage: MemoryImage(_image!))
                      : Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Center(
                              child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(image))),
                        ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormInputField(
                      controller: name,
                      hintText: "Enter Name",
                      textInputType: TextInputType.name,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormInputField(
                      controller: dob,
                      hintText: "Date of Birth",
                      textInputType: TextInputType.name,
                    )),
                const SizedBox(
                  height: 10,
                ),
                CtButton(
                  title: "Update",
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      "name": name.text,
                      "dob": dob.text,
                    }).then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => MainScreen()));
                    });
                  },
                )
              ],
            );
          }),
    );
  }
}
