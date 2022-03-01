// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, unnecessary_import

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _itshidden = true;
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
                child: Text(
                  'WELCOME \nBACK!',
                  style: TextStyle(color: Colors.pink, fontSize: 32, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontFamily: 'Roboto'),
                ),
                padding: EdgeInsets.only(left: 25, right: 35, top: 100),
              ),
              SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.45,
                        left: 25,
                        right: 20,
                      ),
                      child: Column(children: [
                        TextField(
                            decoration: InputDecoration(
                          labelText: 'Email',
                          fillColor: Colors.grey.shade500,
                          hintText: 'Enter Your Email Id',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          prefixIcon: Icon(Icons.email),
                          prefixIconColor: Colors.grey,
                        )),
                        SizedBox(height: 15),
                        TextField(
                          //obscureText: true,
                          obscureText: _itshidden,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            fillColor: Colors.grey.shade500,
                            hintText: 'Enter Your Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Colors.grey,
                            suffixIcon: IconButton(
                                icon: Icon(_itshidden ? Icons.visibility : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _itshidden = !_itshidden;
                                  });
                                }),
                          ),
                        ),
                        SizedBox(height: 2),
                        ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, 'signup'),
                            //Redirects to sign up page
                            child: Text('Login', style: TextStyle(backgroundColor: Colors.blue, fontSize: 30)),
                            style: ElevatedButton.styleFrom(fixedSize: Size.fromHeight(20)))
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