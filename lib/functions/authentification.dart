// ignore_for_file: unused_local_variable, unused_import, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:samadhan/screens/homepage.dart';
import 'package:samadhan/screens/login.dart';
import 'package:samadhan/screens/register.dart';

Future<bool> signup(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    Fluttertoast.showToast(msg: "Sign Up Successfull");
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Fluttertoast.showToast(msg: "Password Provided is too weak");
    } else if (e.code == 'email-already-in-use') {
      Fluttertoast.showToast(msg: "An account already exists for that email");
    } else {
      Fluttertoast.showToast(msg: "Something went wrong with signup");
    }
  }
  return false;
}

Future<bool> signin(String email, password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    Fluttertoast.showToast(msg: "Login Successfull");
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Fluttertoast.showToast(msg: "No existing User was found for that email.");
    } else if (e.code == 'wrong-password') {
      Fluttertoast.showToast(msg: "Wrong Password provided for that user.");
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
    return false;
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  
}
