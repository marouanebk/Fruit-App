import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String uid;
  final String phone_number;
  final String adress;
  final String full_name;
  final int price;

  final List items;

  const Order({
    required this.uid,
    required this.phone_number,
    required this.adress,
    required this.full_name,
    required this.items,
    required this.price,
  });

  static Order fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Order(
      phone_number: snapshot["phone_number"],
      uid: snapshot["uid"],
      full_name: snapshot["full_name"],
      adress: snapshot["adress"],
      items: snapshot["items"],
      price: snapshot["price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "phone_number": phone_number,
        "uid": uid,
        "full_name": full_name,
        "items": items,
        "adress": adress,
        "price": price,
      };
}
