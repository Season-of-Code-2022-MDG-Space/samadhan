// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold has limitation---we cant set background img using it..hence container

    return Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
        /*
        Ask how to blur background image as only 1 child is allowed
        child: BackdropFilter(
        filter: ImageFilter.blur()),
        */
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(
                child: Text('WELCOME \n BACK!', style: TextStyle(color: Colors.pink, fontSize: 32, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontFamily: 'Roboto')),
                padding: EdgeInsets.only(left: 50, right: 35, top: 100),
              ),
              SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.45,
                        left: 25,
                        right: 20,
                      ),
                      child: Column(children: [
                        TextField(decoration: InputDecoration(fillColor: Colors.grey.shade500, hintText: 'Enter Your Email Id', border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
                        SizedBox(height: 15),
                        TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade500,
                              hintText: 'Enter password',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            )),
                      ])))
            ])));
  }
}
































































/*
Scaffold(appBar: AppBar(
        title: Center(child: Text("Welcome!",style: TextStyle(
          fontWeight:FontWeight.bold)
          )
        ),
        ),
        backgroundColor: Colors.purple[400]  
      ),
      */