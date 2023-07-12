import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:irrish_driving/models/google_model.dart';
import 'package:irrish_driving/models/phone_model.dart';
import 'package:irrish_driving/services/storage_services.dart';

class DatabaseMethods {
  //Create User Profille
  Future<String> googleProfile(
      {required String email,
      required String dob,
      required String phoneNumber,
      required String username,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      String photoURL = await StorageServices()
          .uploadImageToStorage('ProfilePics', file, false);
      //Add User to the database with modal
      GoogleModel userModel = GoogleModel(
          name: username,
          uid: FirebaseAuth.instance.currentUser!.uid,
          email: FirebaseAuth.instance.currentUser!.email!,
          phoneNumber: phoneNumber,
          dob: dob,
          photoURL: photoURL);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userModel.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //phone
  Future<String> phone(
      {required String email,
      required String dob,
      required String phoneNumber,
      required String username,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      String photoURL = await StorageServices()
          .uploadImageToStorage('ProfilePics', file, false);
      //Add User to the database with modal
      PhoneModel userModel = PhoneModel(
          name: username,
          uid: FirebaseAuth.instance.currentUser!.uid,
          email: email,
          phoneNumber:
              FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
          dob: dob,
          photoURL: photoURL);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userModel.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
