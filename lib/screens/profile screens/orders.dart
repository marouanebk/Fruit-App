import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/screens/profile%20screens/widgets/order_item_card.dart';

import '../../global variables/colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              color: MainGreen,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'My Orders',
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
            OrderItemCard(image: 'assets/images/vegetable/Brocolli.png', name: "Broccoli",),
            OrderItemCard(image: 'assets/images/vegetable/Onion.png', name: "Onion",),
            OrderItemCard(image: 'assets/images/vegetable/Anjeer.png', name: "Anjeer",),
          ],
        ),
      ),
    );
  }
}
