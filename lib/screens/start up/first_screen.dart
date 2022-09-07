import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../global variables/colors.dart';

class FirstScreenPage extends StatelessWidget {
  const FirstScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: MainGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, //main axis the vertical axis in a column so this positions the children at the center of the vertical axis
        crossAxisAlignment: CrossAxisAlignment
            .center, //the horizontal axis of a column, again we position the children's at the center of the horizontal axis

        children: [
          Center(
            child: const Text(
              'Fruit Market',
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ),
          
          // Expanded(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //       width:  MediaQuery.of(context).size.width,
          //       height: MediaQuery.of(context).size.height*0.3,
          //       decoration: const BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage("assets/main1.png"),
          //             fit: BoxFit.cover),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
