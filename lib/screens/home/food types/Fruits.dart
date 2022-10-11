import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../widgets/itemCrad.dart';

class FruitsScreen extends StatefulWidget {
  final tiltle;
  final subTitle; 
  final type; 
  final subtype; 
  const FruitsScreen({Key? key, this.tiltle,  this.subTitle, this.type, this.subtype}) : super(key: key);

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
          SizedBox(
            height: 20,
          ),
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

          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('fruits')
                .where('subType', isEqualTo: 'organic')
                .snapshots(),
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

                  shrinkWrap: true,

                  itemBuilder: (ctx, index) => Container(
                    child: Row(
                      children: [
                        ItemCard(
                          snap: snapshot.data!.docs[index].data(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),

                  // ),
                ),
              );
            },
          ),

          const SizedBox(
            height: 10,
          ),
          //Mixed Friot Pack

          //Stone Fruits Pack
        ],
      ),
    );
  }
}
