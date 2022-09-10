import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/global%20variables/colors.dart';

class ItemDetailCard extends StatelessWidget {
  const ItemDetailCard({Key? key}) : super(key: key);

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
                    'DETAILS',
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
              width: MediaQuery.of(context).size.width * 0.9,
              height: 176,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/images/fruit/Grapes.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Grapes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF141313),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10, right: 60),
                    child: Text(
                      'Grapes will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair and skin. It can be improve Your heart health. Protect yourbody from Cancer.',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF626262),
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nutrition',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF141313),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                  ),
                  //first item
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF838181),
                        size: 7,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Fiber',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF626262),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                  //first item
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF838181),
                        size: 7,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Potassium',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF626262),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                  //first item
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(0xFF838181),
                        size: 7,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Iron',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF626262),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Text(
                        "\$ ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF393939),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '160 Per/ kg',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF393939),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(left: 100),
                        width: 148,

                        height: 40,
                        decoration: BoxDecoration(
                          color: MainGreen,
                          border: Border.all(
                            color: Color(0xFF393939),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
