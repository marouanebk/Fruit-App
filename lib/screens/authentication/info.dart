import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fruit_app/screens/home/HomeScreenView.dart';

import '../../global variables/colors.dart';
import '../../resources/auth_methods.dart';
import '../../utils/utils.dart';
import '../../widgets/text_field_nput.dart';

class SettingInfo extends StatefulWidget {
  const SettingInfo({Key? key}) : super(key: key);

  @override
  State<SettingInfo> createState() => _SettingInfoState();
}

class _SettingInfoState extends State<SettingInfo> {
  TextEditingController _fullname = TextEditingController();
  TextEditingController _adress = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _adress.dispose();
    _fullname.dispose();
  }

  void addUserInfo() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods()
        .updateUser(adress: _adress.text, full_name: _fullname.text);
    // if string returned is sucess, user has been created
    if (res == "sucess") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      // navigate to the home screen
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => HomeScreenView(),
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
                textEditingController: _adress,
                textInputType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: addUserInfo,
              child: Container(
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
                  child: !_isLoading
                      ? Text(
                          'CONFIRM',
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
            )
          ],
        ),
      ),
    );
  }
}
