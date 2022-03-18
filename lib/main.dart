// ignore_for_file: camel_case_types, use_key_in_widget_constructors,, prefer_const_constructors, unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:samadhan/screens/homepage.dart';
import 'package:samadhan/screens/login.dart';
import 'package:samadhan/screens/register.dart';
import 'package:samadhan/screens/registered.dart';
import 'package:samadhan/screens/welcome.dart';
//import 'package:samadhan/screens/food.dart';
import 'package:samadhan/screens/other.dart';
import 'package:samadhan/screens/water.dart';
import 'package:samadhan/functions/database_crud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: OtherPage(),
      initialRoute: FirebaseAuth.instance.currentUser == null ? 'welcome' : 'homepage',
      routes: {
        'signup': (context) => RegisterPage(),
        'login': (context) => LoginPage(),
        'water': (context) => WelcomePage(), //Remember this!
        'internet': (context) => OtherPage(),
        //'food': (context) => FoodPage(),
        'registered': (context) => ComplaintRegistered(),
        //'homepage': (context) => HomePage(),
        'welcome': (context) => WelcomePage(),
        'other': (context) => OtherPage(),
        // 'pf': (context) => PerInf(),
        // 'au': (context) => AboutUs(),
        // 'main': (context) => MyApp(),
      },
      title: 'Samadhan',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(255, 71, 151, 188),
        fontFamily: 'Roboto',
      ),
    );
  }
}
