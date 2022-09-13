import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/global%20variables/colors.dart';
import 'package:fruit_app/screens/authentication/signup.dart';
import 'package:fruit_app/screens/home/default.dart';
import 'package:fruit_app/widgets/text_field_nput.dart';

import '../../resources/auth_methods.dart';
import '../../resources/firebase_methods.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void loginuser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().loginUser(
      email: _email.text,
      password: _password.text,
    );
    // if string returned is sucess, user has been created
    if (res == "sucess") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      // navigate to the home screen
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => const SettingInfo()
      //   ),
      // );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => DefaultPageScreen(),
          ),
          (route) => false);
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  void uploadFruit() async {
    String res = await FireStoreMethods().uploadFruit();

    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              height: 50,
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
                hintText: 'Enter Your Email',
                textEditingController: _email,
                textInputType: TextInputType.text,
              ),
            ),
            SizedBox(
              height: 20,
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
                hintText: 'Enter Your Password',
                textEditingController: _password,
                textInputType: TextInputType.text,
                isPass: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              // onTap: uploadFruit,
              onTap: loginuser,

              child: Container(
                //   padding: EdgeInsets.symmetric(horizontal: 30),
                // margin: EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 52,
                decoration: BoxDecoration(
                  color: MainGreen,
                  border: Border.all(
                    color: Color(0xFF393939),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: !_isLoading
                      ? Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'New user ? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MainGreen,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MainGreen,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
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
