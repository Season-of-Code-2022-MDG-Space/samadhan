// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:samadhan/screens/login.dart';
//import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/finalbg.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(
                child: Text('HAVE SAMASYA? \nGET SAMADHAN HERE!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 21, 5, 248),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    )),
                padding: EdgeInsets.only(left: 50, right: 35, top: 100),
              ),
              SizedBox(height: 100, width: 100),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 400),
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          ),
                          onPressed: () => Navigator.pushNamed(context, 'login'),
                          child: Text('Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decorationColor: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 18,
                              ))),
                      SizedBox(height: 20, width: 20),
                      ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, 'signup'),
                          child: Text('SignUp',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decorationColor: Colors.black,
                                fontSize: 18,
                              ),),
                              )
                    ],
                  ),
                ),
              ),
            ])));
  }
}
