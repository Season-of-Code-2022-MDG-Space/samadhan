// ignore_for_file: unnecessary_const, prefer_const_constructors, override_on_non_overriding_member, annotate_overrides

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/SCREENS/internet.dart';
import 'package:flutter_application_1/SCREENS/electricity.dart';
import 'package:flutter_application_1/SCREENS/plumbing.dart';
import 'package:flutter_application_1/SCREENS/Food.dart';

//import 'package:samadhan/functions/database_crud.dart';
//import 'package:samadhan/screens/register.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FoodPage(),
    );
  }
}
