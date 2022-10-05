import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../widgets/itemCrad.dart';

class FruitItemCard extends StatefulWidget {
  final title;
  final subTitle;
  final type;
  final subtype;
  const FruitItemCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.type,
      required this.subtype})
      : super(key: key);

  @override
  State<FruitItemCard> createState() => _FruitItemCardState();
}

class _FruitItemCardState extends State<FruitItemCard> {
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
              Text(
                "${widget.title}",
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
          Text(
            'Pick up from ${widget.subTitle}',
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
                .where('subType', isEqualTo: "${widget.subtype}")
                // .where('subType', isEqualTo: "${widget.type}")
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                height: 230,
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
                      ],
                    ),
                  ),

                  // ),
                ),
              );
            },
          ),

          //Mixed Friot Pack

          //Stone Fruits Pack
        ],
      ),
    );
  }
}
