import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../global variables/colors.dart';
import '../../widgets/text_field_nput.dart';

class VerifyScreenPage extends StatefulWidget {
  const VerifyScreenPage({Key? key}) : super(key: key);

  @override
  State<VerifyScreenPage> createState() => _VerifyScreenPageState();
}

class _VerifyScreenPageState extends State<VerifyScreenPage> {
  TextEditingController _countryCode = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Container(

                width: MediaQuery.of(context).size.width*0.9,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFF393939),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: 52,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Color(0xFF393939),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextFieldInput(
                          hintText: '+91',
                          textEditingController: _countryCode,
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
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
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
