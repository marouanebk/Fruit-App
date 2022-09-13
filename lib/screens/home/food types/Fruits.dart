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
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //begin fo first item description
          Row(
            children: [
              const Text(
                'Organic Fruits ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF141313),
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              const Text(
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
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Pick up from organic farms',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Color(0xFF141313),
                fontFamily: 'Poppins',
                decoration: TextDecoration.none),
          ),
          const SizedBox(
            height: 10,
          ),

          // here i should put the stream builder

          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('fruits').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: snapshot.data!.docs.length,
                  // itemCount: 5,

                  shrinkWrap: true,

                  itemBuilder: (ctx, index) => Container(
                    // margin: EdgeInsets.symmetric(
                    //   horizontal: width > webScreenSize ? width * 0.3 : 0,
                    //   vertical: width > webScreenSize ? 15 : 0,
                    // ),
                    child:
                        //   SingleChildScrollView(
                        // scrollDirection: Axis.horizontal,
                        // child:
                        Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        ItemCard(
                          snap: snapshot.data!.docs[index].data(),
                          // imageLink: snapshot.data!.docs[index].data()['photoUrl'],
                          // name: snapshot.data!.docs[index].data()['name'],
                          // isLiked: false,
                          // rating: 4,
                          // price: snapshot.data!.docs[index].data()['price'],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // const ItemCard(
                        //   imageLink: 'assets/images/fruit/strawberry.jpg',
                        //   name: 'Strawberry',
                        //   isLiked: false,
                        //   rating: 4,
                        //   price: 300,
                        // ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        // const ItemCard(
                        //   imageLink: 'assets/images/fruit/strawberry.jpg',
                        //   name: 'Strawberry',
                        //   isLiked: false,
                        //   rating: 4,
                        //   price: 300,
                        // ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        // const ItemCard(
                        //   imageLink: 'assets/images/fruit/strawberry.jpg',
                        //   name: 'Strawberry',
                        //   isLiked: false,
                        //   rating: 4,
                        //   price: 300,
                        // ),
                      ],
                    ),
                  ),

                  // ),
                ),
              );
            },
          ),

          //begin of second type item discription

          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
