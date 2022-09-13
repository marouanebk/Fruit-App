import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShoppingCardItem extends StatefulWidget {
  final  id;
  const ShoppingCardItem({super.key, required this.id});

  @override
  State<ShoppingCardItem> createState() => _ShoppingCardItemState();
}

class _ShoppingCardItemState extends State<ShoppingCardItem> {
  var snap = {};
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {

    try {
      // widget.id = widget.id.split(',')[0].substring(1).trim();
      var userSnap =
          await FirebaseFirestore.instance.collection('fruits').doc(widget.id).get();
      snap = userSnap.data()!;
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFD1D1D1),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 95,
            width: 95,
            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(snap['photoUrl']!),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                    snap['name'],
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF393939),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                  // const Text(
                  //   'RS 40 Saves',
                  //   style: TextStyle(
                  //       fontSize: 10,
                  //       fontWeight: FontWeight.normal,
                  //       color: Color(0xFF69A03A),
                  //       fontFamily: 'Poppins',
                  //       decoration: TextDecoration.none),
                  //   textAlign: TextAlign.center,
                  // ),
                  Container(
                      padding: const EdgeInsets.only(left: 140),
                      alignment: Alignment.centerRight,
                      child: const Icon(Icons.restore_from_trash)),
                ],
              ),
              // SizedBox(height: 5,),
              const Text(
                "",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              Text(
                'Rs ${snap['price']}',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),

              // alignment: Alignment.,

              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 150,
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 3,
                        color: Color(0xFFD1D1D1),
                      ),
                    ),
                    child: Center(
                      child: Text('-'),
                    ),
                    // child: Icon(Icons.cross),
                  ),
                  const Text('   1  '),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 3,
                        color: Color(0xFFD1D1D1),
                      ),
                    ),
                    child: Center(
                      child: Text('+'),
                    ),
                    // child: Icon(Icons.cross),
                  ),

                  // Expanded(
                  //   child: Align(
                  //     alignment: Alignment.centerRight,
                  //     child: Container(
                  //       height: 27,
                  //       width: 68,
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
