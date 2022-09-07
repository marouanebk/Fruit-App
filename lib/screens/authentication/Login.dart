import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/global%20variables/colors.dart';
import 'package:fruit_app/widgets/text_field_nput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phonenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              width: 221,
              height: 166,
              decoration: BoxDecoration(
                // color: MainGreen,
                image: DecorationImage(
                  image: AssetImage('assets/images/Fruit_Market.png'),
                ),
              ),
            ),
            Center(
              child: const Text(
                'Fruit Market',
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: MainGreen,
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFF393939),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFieldInput(
                  hintText: 'Enter Your mobile Number',
                  textEditingController: _phonenumber,
                  textInputType: TextInputType.number,
                  ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: const Text(
                'OR',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    // color: MainGreen,
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFF393939),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 26,
                        width: 26,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          // color: MainGreen,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/google.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Log in with ',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                //fb
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFF393939),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 26,
                        width: 26,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          // color: MainGreen,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/fb.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Log in with ',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
