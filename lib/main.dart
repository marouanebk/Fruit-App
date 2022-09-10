import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/screens/authentication/Login.dart';
import 'package:fruit_app/screens/authentication/info.dart';
import 'package:fruit_app/screens/authentication/signup.dart';
import 'package:fruit_app/screens/authentication/verify.dart';
import 'package:fruit_app/screens/home/default.dart';
import 'package:fruit_app/screens/start%20up/first_screen.dart';
import 'package:fruit_app/screens/start%20up/second_screen.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();


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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // Checking if the snapshot has any data or not
            if (snapshot.hasData) {
              // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
              return const DefaultPageScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }

          // means connection to future hasnt been made yet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const LoginScreen();
        },
      ),
    );
  }
}

