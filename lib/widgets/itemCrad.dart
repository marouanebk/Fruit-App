import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit_app/widgets/itemDetail.dart';

class ItemCard extends StatefulWidget {
  final snap;
  final imageLink;
  final double rating;
  final price;
  final isLiked;
  final name;
  const ItemCard(
      {Key? key,
      required this.imageLink,
      required this.rating,
      required this.price,
      required this.isLiked,
      required this.name,
      required this.snap})
      : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 20,),
          GestureDetector(
            // onTap:() =>             Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ItemDetailCard()),
            //   ),
            // // onTap: () =>  Navigator.pushNamed(context, 'ItemDetailCard'),
            // onTap: () => Navigator.pushAndRemoveUntil(context,  (route) => false),
            onTap: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (_) => ItemDetailCard(snap : widget.snap),
              ),
            ),
            child: Container(
              height: 143,
              width: 118,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(widget.snap['photoUrl']),
                    fit: BoxFit.cover
                    // image: AssetImage(widget.imageLink!),
                    ),
              ),
              // child: Container(
              //   height: 10,
              //   width: 10,
              //   decoration:  BoxDecoration(
              //     color: Colors.green,
              //     borderRadius:  BorderRadius.only(
              //       topLeft:  Radius.circular(40.0),
              //       topRight:  Radius.circular(40.0),
              //     ),
              //   ),
              // ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          // alignment: Alignment.,
          RatingBar.builder(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 12,
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
            widget.snap['name'],
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF393939),
                fontFamily: 'Poppins',
                decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "\$ ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF393939),
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
              Text(
                '${widget.snap['price']} Per/ kg',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF393939),
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
