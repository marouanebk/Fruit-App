import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/widgets/ShoppingCardItem.dart';

import '../../global variables/colors.dart';
import '../../resources/firebase_methods.dart';

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
  bool dataExi = true;

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
      print(userData['items'][0]);
      // var map = userData['itemo'];
      // print('user data');
      // print(userData['itemo']);
      // for (var j in userData['itemo']) {

      //   print(j.values.toString().split(',')[0].substring(1));
      //   print('hello');
      // }

      // for (var k in userData['itemo']) {
      //   print("key : $k, value : ${userData["itemo"]}");
      // }
      if (userData['items'][0].toString() != '') {
        print('null valus');
        setState(() {
          dataExi = false;
        });
      } else {
        print('null valus');

        for (var i in userData['items']) {
          var snapItem = await FirebaseFirestore.instance
              .collection('fruits')
              .doc(i)
              .get();
          // print(snapItem);
          var snap = snapItem.data()!['price'];
          // print(snap);
          temp += int.parse(snap.toString());
        }
        total = temp;

        setState(() {});
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
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    height: 32,
                    color: const Color(0xFFE6E6E6),
                    child: const Text('Vegetables'),
                  ),
                  // for (var i in userData['items'])

                  if (!dataExi)
                    for (var i in userData['items']) ShoppingCardItem(id: i)
                  else
                    Container(),

                  // (for (var i in userData['items']) ShoppingCardItem(id: i) )

                  //  for (var j in userData['itemo']) ShoppingCardItem(id: j.split(',')[0].substring(1).trim()),

                  // for (var j in userData['itemo'])
                  //   ShoppingCardItem(id: j),

                  //        {

                  //   print(j.values.toString().split(',')[0].substring(1));
                  //   print('hello');
                  // }

                  // ShoppingCardItem(),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    height: 32,
                    color: const Color(0xFFE6E6E6),
                    child: const Text('Fruits'),
                  ),
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
                                    'Buy Now',
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
