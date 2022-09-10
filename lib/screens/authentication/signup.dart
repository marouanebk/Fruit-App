import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/screens/authentication/Login.dart';
import 'package:fruit_app/screens/authentication/info.dart';

import '../../global variables/colors.dart';
import '../../resources/auth_methods.dart';
import '../../utils/utils.dart';
import '../../widgets/text_field_nput.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _adress = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
    _phonenumber.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: _email.text,
      password: _password.text,
      phone_number: _phonenumber.text,
    );
    // if string returned is sucess, user has been created
    if (res == "sucess") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      // navigate to the home screen
      print('here');
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => const SettingInfo()
      //   ),
      // );
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => SettingInfo(),
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
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   margin: EdgeInsets.symmetric(horizontal: 30),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(
            //       color: Color(0xFF393939),
            //     ),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: TextFieldInput(
            //     hintText: 'Enter Your Full Name ',
            //     textEditingController: _fullname,
            //     textInputType: TextInputType.number,
            //   ),
            // ),
            // password
            SizedBox(
              height: 15,
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
                hintText: 'Enter Your Email ',
                textEditingController: _email,
                textInputType: TextInputType.text,
              ),
            ),
            //phone number
            SizedBox(
              height: 15,
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
                hintText: 'Enter Your password',
                textEditingController: _password,
                textInputType: TextInputType.text,
                isPass: true,
              ),
            ),
            //full name
            SizedBox(
              height: 15,
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
                hintText: 'Enter Your Phone Number',
                textEditingController: _phonenumber,
                textInputType: TextInputType.number,
              ),
            ),
            //adress
            SizedBox(
              height: 15,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 30),
            //   margin: EdgeInsets.symmetric(horizontal: 30),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(
            //       color: Color(0xFF393939),
            //       width: 1,
            //     ),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: TextFieldInput(
            //     hintText: 'Enter Your mobile Number',
            //     textEditingController: _phonenumber,
            //     textInputType: TextInputType.number,
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: signUpUser,
              child: Container(
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
                          'Sign Up',
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
                  builder: (context) => const LoginScreen(),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Already have an account ? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MainGreen,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  Container(
                    child: const Text(
                      'Login',
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
          ],
        ),
      ),
    );
  }
}
