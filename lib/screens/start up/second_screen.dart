import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/screens/authentication/Login.dart';
import 'package:fruit_app/widgets/startup_card.dart';

import '../../global variables/colors.dart';

class SecondScreenPage extends StatefulWidget {
  const SecondScreenPage({Key? key}) : super(key: key);

  @override
  State<SecondScreenPage> createState() => _SecondScreenPageState();
}

class _SecondScreenPageState extends State<SecondScreenPage> {
  var _title = 'E-Shopping';
  var _image = 'assets/images/startup1.png';
  var _description = 'Explore  top organic fruits & grab them';
  int index = 0;

  void onClick() {
    if (index == 0) {
      setState(() {
        _title = 'Delivery on the way';
        _image = 'assets/images/startup2.png';
        _description = 'Get your order by speed delivery';
      });
    } else if (index == 1) {
      setState(() {
        _title = 'Delivery Arrived';
        _image = 'assets/images/startup3.png';
        _description = 'Order is arrived at your Place';
      });
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
    index += 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        // padding: EdgeInsets.only(left: 20),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF898989),
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            StartUpCard(
                title: _title, imageLink: _image, description: _description),
            // StartUpCard(
            //     title: 'Delivery on the way',
            //     imageLink: 'assets/images/startup1.png',
            //     description: 'Get your order by speed delivery'),
            // StartUpCard(
            //     title: 'Delivery Arrived',
            //     imageLink: 'assets/images/startup1.png',
            //     description: 'Order is arrived at your Place'),
            SizedBox(
              height: 30,
            ),
            DotsIndicator(
              dotsCount: 3,
              position: index.toDouble(),
              decorator: DotsDecorator(
                color: Colors.black, // Inactive color
                activeColor: MainGreen,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                color: MainGreen,
                border: Border.all(
                  color: MainGreen,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                // onPressed: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SecondScreenPage()),
                // ),
                onPressed: onClick,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 14,
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
    );
  }
}
