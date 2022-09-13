import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  //signUp

  Future<String> signUpUser({
    required String email,
    required String password,
    // required String adress,
    // required String full_name,
    required String phone_number,
  }) async {
    String res = 'some error occured';
// || file!= null
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          // adress.isNotEmpty ||
          // full_name.isNotEmpty ||
          phone_number.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
            

        model.User _user = model.User(
          adress: '',
          uid: cred.user!.uid,
          photoUrl: '',
          email: email,
          full_name: '',
          phone_number: phone_number,
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(_user.toJson());
        res = 'sucess';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

////// Update user         
///
///
    Future<String> updateUser({
    required String adress,
    required String full_name,
  }) async {
    String res = 'some error occured';
    try {
      if (
          adress.isNotEmpty ||
          full_name.isNotEmpty ) {
        // UserCredential cred = await _auth.createUserWithEmailAndPassword(
        //     email: email, password: password);


             var uid  =  FirebaseAuth.instance.currentUser!.uid;

             var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

            

        model.User _user = model.User(
          adress: adress,
          uid: uid,
          photoUrl: '',
          email: userSnap.data()!['email'].toString(),
          full_name: full_name,
          phone_number: userSnap.data()!['phone_number'].toString(),
        );
        print(_user);

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(uid)
            .set(_user.toJson());
        res = 'sucess';
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
  



  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "sucess";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  //singout

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
