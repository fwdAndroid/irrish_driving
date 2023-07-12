import 'package:cloud_firestore/cloud_firestore.dart';

class PhoneModel {
  String uid;
  String email;
  String name;
  String dob;
  String phoneNumber;
  String photoURL;

  PhoneModel(
      {required this.uid,
      required this.photoURL,
      required this.email,
      required this.phoneNumber,
      required this.name,
      required this.dob});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'name': name,
        "email": email,
        'uid': uid,
        "photoURL": photoURL,
        "dob": dob,
        "phoneNumber": phoneNumber
      };

  ///
  static PhoneModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return PhoneModel(
        email: snapshot['email'],
        phoneNumber: snapshot['phoneNumber'],
        name: snapshot['name'],
        uid: snapshot['uid'],
        photoURL: snapshot['photoURL'],
        dob: snapshot['dob']);
  }
}
