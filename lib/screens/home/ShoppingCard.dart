import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/widgets/ShoppingCardItem.dart';

import '../../global variables/colors.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.05,
              width: double.infinity,
              color: MainGreen,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  Text(
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
              margin: EdgeInsets.only(left: 20),
              height: 50,
              // color: Colors.red,
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                    ' 440001  Nagpur ,Maharashtra',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.keyboard_arrow_down),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 32,
              color: Color(0xFFE6E6E6),
              child: Text('Vegetables'),
            ),
            ShoppingCardItem(),
            ShoppingCardItem(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 32,
              color: Color(0xFFE6E6E6),
              child: Text('Fruits'),
            ),
            ShoppingCardItem(),
          ],
        ),
      ),
    );
  }
}
