import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/global%20variables/colors.dart';

class StartUpCard extends StatefulWidget {
  final title;
  final imageLink;
  final description;
  const StartUpCard({Key? key, required this.title,  required this.imageLink, required this.description}) : super(key: key);

  @override
  State<StartUpCard> createState() => _StartUpCardState();
}

class _StartUpCardState extends State<StartUpCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 323,

      // color: MainGreen,
      // decoration: BoxDecoration(
      //   // color: MainGreen,
      //   image: DecorationImage(
      //     image: AssetImage('assets/images/startup1.png'),
      //   ),
      // ),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 210,

            // color: MainGreen,
            decoration: BoxDecoration(
              // color: MainGreen,
              image: DecorationImage(
                image: AssetImage(widget.imageLink!),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2E41),
                fontFamily: 'Poppins',
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
          Text(
            '${widget.description}',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF78787C),
                fontFamily: 'Poppins',
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Container(
//                                   height: 28.08,
//                                   width: 28.08,
//                                   // padding: EdgeInsets.symmetric(horizontal: 10, vertical: ),
//                                   decoration:  BoxDecoration(
//                                     color: Colors.white,
//                                     image: DecorationImage(
//                                       image: AssetImage(widget.imageLink!),
//                                     ),
//                                   ),
//                                 ),