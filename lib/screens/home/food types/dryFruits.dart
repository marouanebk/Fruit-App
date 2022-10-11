import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/screens/home/HomeScreenView.dart';

import '../../../global variables/colors.dart';
import 'Vegetables.dart';
import 'foodtypeCard.dart';

class DryFruitsScreen extends StatefulWidget {
  const DryFruitsScreen({Key? key}) : super(key: key);

  @override
  State<DryFruitsScreen> createState() => _DryFruitsScreenState();
}

class _DryFruitsScreenState extends State<DryFruitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: MainGreen,
            statusBarIconBrightness: Brightness.dark),
        child: SafeArea(
          child: SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  height: 80,
                  color: MainGreen,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'F',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'ruit Market',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    //vegetabeles
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          // onTap: () =>
                          //     Navigator.of(context, rootNavigator: true).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => VegetablesScreen(),
                          //   ),
                          // ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VegetablesScreen()),
                          ),
                          child: Container(
                            height: 25,
                            width: 102,
                            // padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(left: 30),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // color: Color(0xFFCC7D00),
                            ),
                            child: Center(
                              child: Text(
                                'Vegetables',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF989898),
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //fruits
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          // onTap: () =>
                          //     Navigator.of(context, rootNavigator: true).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => HomeScreenView(),
                          //   ),
                          // ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreenView()),
                          ),
                          child: Container(
                            height: 25,
                            width: 77,
                            // padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Fruits',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF989898),
                                    // color: Color(0xFF989898),
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.none),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Container(
                            height: 25,
                            width: 83,
                            margin: EdgeInsets.only(right: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFCC7D00),
                            ),
                            child: Center(
                              child: Text(
                                'Dry Fruits',
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
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // FruitsScreen(),
                FruitItemCard(
                    title: 'Organic Fruits',
                    subTitle: 'organic Fruits',
                    type: 'DryFruits',
                    subtype: 'di'),
                FruitItemCard(
                    title: 'Organic Fruits',
                    subTitle: 'organic Fruits',
                    type: 'DryFruits',
                    subtype: 'dmp'),
                FruitItemCard(
                    title: 'Organic Fruits',
                    subTitle: 'organic Fruits',
                    type: 'DryFruits',
                    subtype: 'dd'),
                FruitItemCard(
                    title: 'Organic Fruits',
                    subTitle: 'organic Fruits',
                    type: 'DryFruits',
                    subtype: 'dr'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
