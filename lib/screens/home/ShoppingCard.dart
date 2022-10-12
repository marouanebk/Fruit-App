import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/widgets/ShoppingCardItem.dart';

import '../../global variables/colors.dart';
import '../../resources/firebase_methods.dart';

import 'dart:developer' as devtools show log;

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  var userData = {};
  var total = 0;
  bool isLoading = false;
  bool dataExi = false;
  List items = [];
  bool FruitsExist = false;
  bool VegeExist = false;
  bool DryExist = false;

  @override
  void initState() {
    super.initState();
    // getPrice();
    getData();
    // getPrice();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    // Firestore.instance.collection('tournaments').document(documentId).snapshots()
    int temp = 0;
    try {
      var userSnap =
          await FirebaseFirestore.instance.collection('carts').doc(uid).get();
      userData = userSnap.data()!;

      print(userData['items'].isNotEmpty);

      if (userData['items'].isNotEmpty) {
        devtools.log('other condition');

        for (var i in userData['items']) {
          var snapItem = await FirebaseFirestore.instance
              .collection('fruits')
              .doc(i)
              .get();
          // items.add(snapItem);
          // print(snapItem);

          var snap = snapItem.data()!['price'];
          if (snapItem.data()!['type'] == "Fruits") {
            FruitsExist = true;
          } else if (snapItem.data()!['type'] == "Vegetables") {
            VegeExist = true;
          } else if (snapItem.data()!['type'] == "DryFruits") {
            DryExist = true;
          }
          // print(snap);
          temp += int.parse(snap.toString());
        }
        total = temp;
        dataExi = true;
        setState(() {});
      } else {
        // print('null valus');
        setState(() {
          dataExi = false;
        });
      }
    } catch (e) {}
    setState(() {
      isLoading = false;
    });
  }

  void confirmOrder() async {
    String res = await FireStoreMethods().addOrder(
      Items: userData['items'],
      price: total,
    );

    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: double.infinity,
                    color: MainGreen,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        const Text(
                          'Shopping Cart',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 20),
                    height: 50,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        const Icon(Icons.location_on),
                        const Text(
                          ' 440001  Nagpur ,Maharashtra',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                        const Icon(Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 25,
                        ),
                        const Text(
                          'Change Adress',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF7089F0),
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none,
                              textBaseline: TextBaseline.alphabetic),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Container(
                  //   width: double.infinity,
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  //   height: 32,
                  //   color: const Color(0xFFE6E6E6),
                  //   child: const Text('Vegetables'),
                  // ),
                  // for (var i in userData['items'])

                  if (dataExi) ...{
                    if (FruitsExist)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        height: 32,
                        color: const Color(0xFFE6E6E6),
                        child: const Text('Fruits'),
                      ),
                    for (var i in userData['items'])
                      ShoppingCardItem(
                        id: i,
                        type: 'Fruits',
                      )
                  },
                  if (VegeExist) ...{
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      height: 32,
                      color: const Color(0xFFE6E6E6),
                      child: const Text('Vegetables'),
                    ),
                    for (var i in userData['items'])
                      ShoppingCardItem(
                        id: i,
                        type: 'Vegetables',
                      )
                  },
                    if (DryExist) ...{
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        height: 32,
                        color: const Color(0xFFE6E6E6),
                        child: const Text('DryFruits'),
                      ),
                      for (var i in userData['items'])
                        ShoppingCardItem(
                          id: i,
                          type: 'DryFruits',
                        )
                    },

                  // if (dataExi)
                  //   for (var i in items) ShoppingCardItem(id: i),

                  // Container(
                  //   width: double.infinity,
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  //   height: 32,
                  //   color: const Color(0xFFE6E6E6),
                  //   child: const Text('Fruits'),
                  // ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: const EdgeInsets.all(30),
                        child: Row(
                          children: [
                            const Text(
                              "Total :  ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF393939),
                                  fontFamily: 'Poppins',
                                  decoration: TextDecoration.none),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "\$ ${total} ",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF393939),
                                  fontFamily: 'Poppins',
                                  decoration: TextDecoration.none),
                              textAlign: TextAlign.center,
                            ),
                            InkWell(
                              onTap: confirmOrder,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                margin: const EdgeInsets.only(left: 95),
                                width: 148,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: MainGreen,
                                  border: Border.all(
                                    color: const Color(0xFF393939),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Place Order',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        decoration: TextDecoration.none),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ShoppingCardItem(i),
                ],
              ),
            ),
          );
  }
}
