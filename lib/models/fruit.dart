import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Fruit {
  final String type;
  final String uid;
  final String subType;
  final String name;
  final String description;
  final Int price;
  final String photoUrl;
  final String photoBg;
  final List Nutrions;

  const Fruit({
    required this.uid,
    required this.type,
    required this.subType,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.price,
    required this.photoBg,
    required this.Nutrions,
  });

  static Fruit fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Fruit(
      type: snapshot["type"],
      uid: snapshot["uid"],
      subType: snapshot["subType"],
      photoUrl: snapshot["photoUrl"],
      name: snapshot["name"],
      description: snapshot["description"],
      price: snapshot["price"],
      photoBg: snapshot["photoBg"],
      Nutrions: snapshot["Nutrions"],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "uid": uid,
        "subType": subType,
        "photoUrl": photoUrl,
        "description": description,
        "price": price,
        "photoBg": photoBg,
        "Nutrions": Nutrions,
      };
}
