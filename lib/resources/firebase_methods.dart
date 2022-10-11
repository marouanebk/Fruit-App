import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/models/fruit.dart';

import 'package:uuid/uuid.dart';

import '../models/order.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //addItemToCart
  Future<String> addItemToCart(
      {required String userUid, required String itemId}) async {
    String res = 'some error occured';

    try {
      DocumentSnapshot snap =
          await _firestore.collection('carts').doc(userUid).get();
      // List following = (snap.data()! as dynamic)['following'];
      await _firestore.collection('carts').doc(userUid).update({
        'items': FieldValue.arrayUnion([itemId]),
      });
      res = 'YES';
    } catch (e) {
      print(e.toString());
    }
    return res;
  }

  ///////////////////////////////
  Future<String> uploadFruit() async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String FruitId = const Uuid().v1(); // creates unique id based on time
      Fruit fruit = Fruit(
        description:
            'some randomdescription typing stuff i dont know what to wruite ',
        uid: FruitId,
        photoUrl:
            'https://firebasestorage.googleapis.com/v0/b/fruit-app-38f1e.appspot.com/o/fruits%2Forange.jpg?alt=media&token=1b5cf662-2383-4148-b717-f0e98237b92a',
        Nutrions: ['item1 ', 'item2 ', 'item 3 '],
        name: 'grapes 2',
        photoBg:
            'https://firebasestorage.googleapis.com/v0/b/fruit-app-38f1e.appspot.com/o/fruits%2Fraspberry.jpg?alt=media&token=c90477c1-4183-4ffc-83df-86a65d46d2fa',
        price: 180,
        subType: 'oranges',
        type: 'Fruits',
      );
      _firestore.collection('fruits').doc(FruitId).set(fruit.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //ADd order
  Future<String> addOrder({required List Items, required int price}) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      var uid = FirebaseAuth.instance.currentUser!.uid;

      var userSnap =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      String OrderId = const Uuid().v1(); // creates unique id based on time
      Order order = Order(
        adress: userSnap.data()!['adress'].toString(),
        full_name: userSnap.data()!['full_name'].toString(),
        items: Items,
        phone_number: userSnap.data()!['phone_number'].toString(),
        uid: OrderId,
        price: price,
        orderDate: DateTime.now(),
      );
      _firestore.collection('Orders').doc(OrderId).set(order.toJson());
      res = "success";

      await _firestore.collection('carts').doc(uid).update({
        'items': FieldValue.delete(),
      });
      print('deleted');
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
