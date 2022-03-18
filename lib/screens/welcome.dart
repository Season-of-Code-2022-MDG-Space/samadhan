// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:samadhan/screens/login.dart';
import 'package:samadhan/screens/register.dart';
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
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/finalbg.jpg'), fit: BoxFit.contain, opacity: 0.85)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Stack(children: [
                Container(
                  child: Text(
                    'HAVE SAMASYA? \nGET SAMADHAN HERE!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 21, 153, 170),
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                  padding: EdgeInsets.only(left: 50, right: 35, top: 100),
                ),
                SizedBox(height: 100, width: 100),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 600),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 21, 153, 170)),
                            //onPressed: () => Navigator.pushNamed(context, 'login'),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: Text('Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decorationColor: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20,
                                ))),
                      ),
                      SizedBox(height: 20, width: 120),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 21, 153, 170)),
                          onPressed: () => Navigator.pushNamed(context, 'signup'),
                          child: Text(
                            'SignUp',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decorationColor: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            )));
  }
}
