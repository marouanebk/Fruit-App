import 'package:flutter/material.dart';
import 'package:fruit_app/screens/authentication/Login.dart';
import 'package:fruit_app/screens/authentication/info.dart';
import 'package:fruit_app/screens/authentication/verify.dart';
import 'package:fruit_app/screens/home/default.dart';
import 'package:fruit_app/screens/start%20up/first_screen.dart';
import 'package:fruit_app/screens/start%20up/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const DefaultPageScreen(),
    );
  }
}

