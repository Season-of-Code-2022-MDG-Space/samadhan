// ignore: unused_import
// ignore_for_file: camel_case_types, use_key_in_widget_constructors,, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:samadhan/screens/login.dart';
import 'package:samadhan/screens/register.dart';
import 'package:samadhan/screens/welcome.dart';
//for importing:- import: 'package:samadhan/...';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelcomePage(),
    routes: {
      'signup': (context) => RegisterPage(),
      'login': (context) => LoginPage(),
    },
    title: 'Samadhan',
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.purple[400],
      fontFamily: 'Roboto',
    ),
  ));
}
