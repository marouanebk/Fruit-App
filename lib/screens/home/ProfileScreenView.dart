import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/global%20variables/colors.dart';
import 'package:fruit_app/screens/authentication/Login.dart';
import 'package:fruit_app/screens/profile%20screens/widgets/profile_item_card.dart';

import '../../resources/auth_methods.dart';
import '../profile screens/orders.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({Key? key}) : super(key: key);

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  var userData = {};
  bool isLoading = false;

  //            final userSnap = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(uid)
  //         .get();
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      userData = userSnap.data()!;
      print(userData);
      setState(() {});
    } catch (e) {}
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        :Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              color: MainGreen,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 40),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.edit_calendar_outlined,
                              color: Colors.white,
                            ))

                        // Expanded(
                        //   child: Align(
                        //     alignment: Alignment.centerRight,
                        //     child: Icon(Icons.edit_calendar_outlined),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      userData['full_name'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      userData['email'],
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            //My Orders
            profileItemCard(
                icon_name: Icons.shopping_bag_rounded,
                name: 'My Orders',
                link: OrdersScreen()),
            profileItemCard(
                icon_name: Icons.favorite,
                name: 'Favorites',
                link: OrdersScreen()),
            profileItemCard(
                icon_name: Icons.settings,
                name: 'Settings',
                link: OrdersScreen()),
            profileItemCard(
                icon_name: Icons.shopping_cart,
                name: 'My Card',
                link: OrdersScreen()),
            profileItemCard(
                icon_name: Icons.star_rate_outlined,
                name: 'Rate us',
                link: OrdersScreen()),
            profileItemCard(
                icon_name: Icons.share,
                name: 'Refer a Friend ',
                link: OrdersScreen()),
            profileItemCard(
              icon_name: Icons.help,
              name: 'Help',
              link: OrdersScreen(),
            ),
            // profileItemCard(
            //   icon_name: Icons.logout,
            //   name: 'Log out',
            //   link: OrdersScreen(),
            // ),

            GestureDetector(
              onTap: () async {
                await AuthMethods().signOut();
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Color(0xFFD1D1D1),
                  ),
                )),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.logout,
                      color: MainGreen,
                      size: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF393939),
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
