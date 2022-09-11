import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../widgets/itemCrad.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({Key? key}) : super(key: key);

  @override
  State<FruitsScreen> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('fruits').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return     Column(
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
              
              
              
              
              
              
        //       ItemCard(
        //           imageLink: 'assets/images/fruit/strawberry.jpg',
        //           // name: 'Strawberry',
        //           name: snapshot.data!.docs[0].data()['name'],
        //           isLiked: false,
        //           rating: 4,
        //           price: 300,
        //         ),
        //     );
          
        // },
      );




      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     //begin fo first item description
      //     Row(
      //       children: [
      //         Text(
      //           'Organic Fruits ',
      //           style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.normal,
      //               color: Color(0xFF141313),
      //               fontFamily: 'Poppins',
      //               decoration: TextDecoration.none),
      //           textAlign: TextAlign.center,
      //         ),
      //         Text(
      //           '        (20% Off)',
      //           style: TextStyle(
      //               fontSize: 12,
      //               fontWeight: FontWeight.normal,
      //               color: Color(0xFF4CA300),
      //               fontFamily: 'Poppins',
      //               decoration: TextDecoration.none),
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       'Pick up from organic farms',
      //       style: TextStyle(
      //           fontSize: 12,
      //           fontWeight: FontWeight.normal,
      //           color: Color(0xFF141313),
      //           fontFamily: 'Poppins',
      //           decoration: TextDecoration.none),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child: Row(
      //         children: [
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),

      //     //begin of second type item discription

      //     Row(
      //       children: [
      //         Text(
      //           'Organic Fruits ',
      //           style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.normal,
      //               color: Color(0xFF141313),
      //               fontFamily: 'Poppins',
      //               decoration: TextDecoration.none),
      //           textAlign: TextAlign.center,
      //         ),
      //         Text(
      //           '        (20% Off)',
      //           style: TextStyle(
      //               fontSize: 12,
      //               fontWeight: FontWeight.normal,
      //               color: Color(0xFF4CA300),
      //               fontFamily: 'Poppins',
      //               decoration: TextDecoration.none),
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       'Pick up from organic farms',
      //       style: TextStyle(
      //           fontSize: 12,
      //           fontWeight: FontWeight.normal,
      //           color: Color(0xFF141313),
      //           fontFamily: 'Poppins',
      //           decoration: TextDecoration.none),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child: Row(
      //         children: [
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     //third row
      //     Row(
      //       children: [
      //         Text(
      //           'Organic Fruits ',
      //           style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.normal,
      //               color: Color(0xFF141313),
      //               fontFamily: 'Poppins',
      //               decoration: TextDecoration.none),
      //           textAlign: TextAlign.center,
      //         ),
      //         Text(
      //           '        (20% Off)',
      //           style: TextStyle(
      //               fontSize: 12,
      //               fontWeight: FontWeight.normal,
      //               color: Color(0xFF4CA300),
      //               fontFamily: 'Poppins',
      //               decoration: TextDecoration.none),
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       'Pick up from organic farms',
      //       style: TextStyle(
      //           fontSize: 12,
      //           fontWeight: FontWeight.normal,
      //           color: Color(0xFF141313),
      //           fontFamily: 'Poppins',
      //           decoration: TextDecoration.none),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child: Row(
      //         children: [
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           ItemCard(
      //             imageLink: 'assets/images/fruit/strawberry.jpg',
      //             name: 'Strawberry',
      //             isLiked: false,
      //             rating: 4,
      //             price: 300,
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //   ],
      // ),
    );
  }
}
