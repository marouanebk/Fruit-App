import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String phone_number;
  final String adress;
  final String full_name;
  final String photoUrl;

  const User({
    required this.uid,
    required this.email,
    required this.phone_number,
    required this.adress,
    required this.full_name,
    required this.photoUrl,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      phone_number: snapshot["phone_number"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      full_name: snapshot["full_name"],
      adress: snapshot["adress"],
    );
  }

  Map<String, dynamic> toJson() => {
        "phone_number": phone_number,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "full_name": full_name,
        "adress": adress,
      };
}
