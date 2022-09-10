import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/global%20variables/colors.dart';
import 'package:fruit_app/screens/home/food%20types/Fruits.dart';
import 'package:fruit_app/screens/home/food%20types/Vegetables.dart';
import 'package:fruit_app/screens/home/food%20types/dryFruits.dart';
import 'package:fruit_app/widgets/itemCrad.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int _page = 0;
  late PageController pageController;

  get homeScreenItems => null; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

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
                          onTap: () => navigationTapped(0),
                          child: Container(
                            height: 25,
                            width: 102,
                            // padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(left: 30),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFCC7D00),
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
                          onTap: () => navigationTapped(1),
                          child: Container(
                            height: 25,
                            width: 77,
                            // padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFCC7D00),
                            ),
                            child: Center(
                              child: Text(
                                'Fruits',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
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
                          onTap: () => navigationTapped(2),
                          child: Container(
                            height: 25,
                            width: 83,
                            // padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(right: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // color: (_pageControler == 2)
                              //     ? Color(0xFFCC7D00)
                              //     : Colors.white,

                              // color: Color(0xFFCC7D00),
                            ),
                            child: Center(
                              child: Text(
                                'Dry Fruits',
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
                  ],
                ),
                FruitsScreen(),
                // PageView(
                //   children: [
                //     VegetablesScreen(),
                //     FruitsScreen(),
                //     DryFruitsScreen(),
                //   ],

                //   // children: homeScreenItems,
                //   controller: pageController,
                //   // onPageChanged: onPageChanged,
                // ),
                //row end
                //Spacing
              ],
            ),
          ),
        ),
      ),
    );
  }
}
