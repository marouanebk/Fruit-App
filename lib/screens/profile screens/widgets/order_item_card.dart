import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../global variables/colors.dart';

class OrderItemCard extends StatelessWidget {
  final name ; 
  final image;
  const OrderItemCard({Key? key,required this.name,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 109,
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
                  image: AssetImage(image!),
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
                    name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF393939),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 180),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              SizedBox(height: 5,),

              // alignment: Alignment.,
              RatingBar.builder(
                initialRating: 0,
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
              Text(
                'Rate this Product ',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFB2B2B2),
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                child: Text(
                  'Delivered on 24 Feb 2021.',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF393939),
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
