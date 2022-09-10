import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../global variables/colors.dart';
import '../orders.dart';

class profileItemCard extends StatelessWidget {
  final icon_name;
  final name;
  final Widget? link;
  const profileItemCard(
      {Key? key,
      required this.icon_name,
      required this.name,
      required this.link,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context, rootNavigator: true).push(
      //   MaterialPageRoute(
      //     builder: (_) => link!,
      //   ),
      // ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => link!),
      ),
      child: Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          // color: Colors.red,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFFD1D1D1),
            ),
          ),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              // Icons.shopping_bag_rounded,
              icon_name,
              color: MainGreen,
              size: 25,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF393939),
                  fontFamily: 'Poppins',
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
