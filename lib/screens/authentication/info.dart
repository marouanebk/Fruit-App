import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../global variables/colors.dart';
import '../../widgets/text_field_nput.dart';

class SettingInfo extends StatelessWidget {
  const SettingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _fullname = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              margin: EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                'Enter Your Name ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    // color: MainGreen,
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                // textAlign: TextAlign.center,
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
                  color: Color(0xFFCCCCCC),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFieldInput(
                hintText: '',
                textEditingController: _fullname,
                textInputType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              margin: EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                'Add Address ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF0C0B0B),
                    fontFamily: 'Poppins',
                    decoration: TextDecoration.none),
                // textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFFCCCCCC),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFieldInput(
                hintText: '',
                textEditingController: _fullname,
                textInputType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 52,
              decoration: BoxDecoration(
                color: MainGreen,
                border: Border.all(
                  color: MainGreen,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'VERIFY',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
