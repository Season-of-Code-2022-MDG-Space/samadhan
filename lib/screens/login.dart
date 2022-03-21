// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, unnecessary_import

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:samadhan/functions/authentification.dart';
import 'package:samadhan/screens/homepage.dart';
import 'package:samadhan/screens/register.dart';

class LoginPage extends StatefulWidget {
  //String name;
  //LoginPage({this.name});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _itshidden = true;
  final _formkey = GlobalKey<FormState>();
  String emailid = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //Scaffold has limitation---we cant set background img using it..hence container
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/translogo.jpg'), fit: BoxFit.fill, opacity: 1)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formkey,
          child: Stack(
            children: [
              Container(
                child: Text(
                  'WELCOME \nBACK!',
                  style: TextStyle(color: Color.fromARGB(255, 71, 151, 188), fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontFamily: 'Roboto'),
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
                  child: Column(
                    children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          key: ValueKey('emailid'),
                          onChanged: (value) {
                            emailid = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Email ID cannot be left blank");
                            }
                            // reg expression for email validation
                            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            fillColor: Colors.black,
                            hintText: 'Enter Your Email Id',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                            errorStyle: TextStyle(color: Colors.red),
                            prefixIcon: Icon(Icons.email),
                            prefixIconColor: Colors.black,
                          )),
                      SizedBox(height: 15),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        key: ValueKey('pass'),
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Password cannot be left blank';
                          } else {
                            return null;
                          }
                        },
                        obscureText: _itshidden,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          fillColor: Colors.grey.shade500,
                          hintText: 'Enter Your Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                          errorStyle: TextStyle(color: Colors.red),
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
                      SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save;
                              final result = await signin(emailid, password);
                              if (result) {
                                Navigator.pushNamed(context, 'homepage');
                              }
                            }
                          },
                          //Redirects to sign up page
                          child: Text('Login', style: TextStyle(fontSize: 24)),
                          style: ElevatedButton.styleFrom(fixedSize: Size.fromHeight(20)),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signup');
                        },
                        child: Text(
                          "Don't Have An Account? Sign Up!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 71, 151, 188),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
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