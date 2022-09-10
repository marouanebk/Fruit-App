import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteCardItem extends StatelessWidget {
  const FavoriteCardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
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
                  image: AssetImage('assets/images/fruit/Grapes.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
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
                    'Grapes',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF393939),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 140),
                    alignment: Alignment.centerRight,
                    child: Text(
                      '160 Per/kg',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF393939),
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.none),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 5,),
              Text(
                'Pick up from organic farms',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFB2B2B2),
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),

              // alignment: Alignment.,
              RatingBar.builder(
                initialRating: 5,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 19,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.5),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  // size: 12,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),

              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red),
                    // child: Icon(Icons.cross),
                  ),
                  Text('   1  '),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red),
                    // child: Icon(Icons.cross),
                  ),
SizedBox(width: 100,),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 68,
                    height: 27,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFCC7D00),),
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        // textAlign: TextAlign.center,
                      ),
                    ),
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
