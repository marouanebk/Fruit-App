import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/global%20variables/colors.dart';
import 'package:fruit_app/resources/firebase_methods.dart';

class ItemDetailCard extends StatefulWidget {
  final snap;
  const ItemDetailCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<ItemDetailCard> createState() => _ItemDetailCardState();
}

class _ItemDetailCardState extends State<ItemDetailCard> {
  bool isLoading = false;

  void addToCart() async {
    print(FirebaseAuth.instance.currentUser!.uid);

    String res = await FireStoreMethods().addItemToCart(
      userUid: FirebaseAuth.instance.currentUser!.uid,
      itemId: widget.snap['uid'],
    );

    print(res);
  }

  void uploadFruit() async {
    String res = await FireStoreMethods().uploadFruit();

    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 10),
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              color: MainGreen,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'DETAILS',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 176,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: Colors.green,
                image: DecorationImage(
                  // image: AssetImage('assets/images/fruit/Grapes.png'),
                  image: NetworkImage(widget.snap['photoBg']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.snap['name'],
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF141313),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 10, right: 60),
                    child: Text(
                      widget.snap['description'],
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF626262),
                          fontFamily: 'Poppins',
                          decoration: TextDecoration.none),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Nutrition',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF141313),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.none),
                  ),
                  //first item
                  const SizedBox(
                    height: 15,
                  ),
                  for (var i in widget.snap['Nutrions'])
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Color(0xFF838181),
                              size: 7,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              i,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF626262),
                                  fontFamily: 'Poppins',
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),

                  //first item
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      const Text(
                        "\$ ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF393939),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${widget.snap['price']} Per/ kg",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF393939),
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          String res = await FireStoreMethods().addItemToCart(
                            userUid: FirebaseAuth.instance.currentUser!.uid,
                            itemId: widget.snap['uid'],
                          );

                          setState(() {
                            isLoading = false;
                          });

                          if (res == 'YES') {
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 100,
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: MainGreen,
                                                    width: 3,
                                                  ),
                                                ),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Icon(
                                                      Icons.check,
                                                      size: 15.0,
                                                      color: MainGreen,
                                                    )),
                                              ),
                                              const Text(
                                                '   Item added to cart succefully',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins',
                                                    decoration:
                                                        TextDecoration.none),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                          // ElevatedButton(
                                          //   child: const Text('Ok'),
                                          //   onPressed: () =>
                                          //       Navigator.pop(context),
                                          // ),
                                          // GestureDetector(
                                          //   onTap: () => Navigator.pop(context),
                                          //   child: Container(
                                          //     height: 50,
                                          //     width: 200,
                                          //     decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.circular(22),
                                          //         color: MainGreen),
                                          //     child: Center(
                                          //       child: Text(
                                          //         'Home',
                                          //         style: TextStyle(
                                          //           color: Colors.white,
                                          //           fontWeight: FontWeight.w500,
                                          //           fontSize: 20,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                        },
                        // onTap: uploadFruit,

                        child: Container(
                          alignment: Alignment.bottomRight,
                          margin: const EdgeInsets.only(left: 95),
                          width: 148,
                          height: 40,
                          decoration: BoxDecoration(
                            color: MainGreen,
                            border: Border.all(
                              color: const Color(0xFF393939),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'Buy Now',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        decoration: TextDecoration.none),
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
