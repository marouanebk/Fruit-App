import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/global%20variables/colors.dart';
import 'package:fruit_app/widgets/itemCrad.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    var _pageControler = 1;

    

    void navigationTapped(int page) {
      setState(() {
        _pageControler = page;
      });
      // print(page);
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 114,
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
                                        color: (_pageControler == 2) ? Color(0xFFCC7D00) : Colors.white,

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
          //row end
          //Spacing
          Container(
            margin: EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //begin fo first item description
                  Row(
                    children: [
                      Text(
                        'Organic Fruits ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF141313),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '        (20% Off)',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF4CA300),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pick up from organic farms',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF141313),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ItemCard(
                          imageLink: 'assets/images/fruit/strawberry.jpg',
                          name: 'Strawberry',
                          isLiked: false,
                          rating: 4,
                          price: 300,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          imageLink: 'assets/images/fruit/strawberry.jpg',
                          name: 'Strawberry',
                          isLiked: false,
                          rating: 4,
                          price: 300,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          imageLink: 'assets/images/fruit/strawberry.jpg',
                          name: 'Strawberry',
                          isLiked: false,
                          rating: 4,
                          price: 300,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          imageLink: 'assets/images/fruit/strawberry.jpg',
                          name: 'Strawberry',
                          isLiked: false,
                          rating: 4,
                          price: 300,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //begin of second type item discription
                  //begin fo first item description
                  Row(
                    children: [
                      Text(
                        'Organic Fruits ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF141313),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '        (20% Off)',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF4CA300),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pick up from organic farms',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF141313),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ItemCard(
                          imageLink: 'assets/images/fruit/strawberry.jpg',
                          name: 'Strawberry',
                          isLiked: false,
                          rating: 4,
                          price: 300,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          imageLink: 'assets/images/fruit/strawberry.jpg',
                          name: 'Strawberry',
                          isLiked: false,
                          rating: 4,
                          price: 300,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          imageLink: 'assets/images/fruit/strawberry.jpg',
                          name: 'Strawberry',
                          isLiked: false,
                          rating: 4,
                          price: 300,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ItemCard(
                          imageLink: 'assets/images/fruit/strawberry.jpg',
                          name: 'Strawberry',
                          isLiked: false,
                          rating: 4,
                          price: 300,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
