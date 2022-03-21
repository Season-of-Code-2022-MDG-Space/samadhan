// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

goBack(BuildContext context) {
  Navigator.pop(context);
}

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 236, 219, 193),
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                goBack(context);
              }),
          title: Center(child: Text("About Us", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white, fontSize: 25))),
          //backgroundColor: Color.fromARGB(255, 71, 151, 188),
          backgroundColor: Color.fromARGB(255, 23, 77, 121),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Row(children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  /*boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(160, 115, 115, 1),
                          offset: const Offset(
                            5.0,
                            5.0,
                          ), //Offset
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ],*/
                ),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text("Daily-life problems are something which no one is a stranger to, they don’t come with a disclaimer. Your fan/tube light stopped working and no one seems to care? Lost your money but have no one to report to? Have no one to complain about the bug in last night’s food? Don’t worry! We’ve got you covered! We bring to you SAMADHAAN -An app built for addressing the grievances of R-Junta! Using our app, you will be able to convey your grievances to the concerned authorities, at the comfort of your room. Be it a complaint regarding electricity, food in a mess/canteen, internet, Water supply /Plumbing, reporting about something one has lost or found or any other thing which we’ve missed, we’re here to get them resolved.  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // wordSpacing: 1,
                        fontFamily: 'Cursive',
                        color: Color.fromARGB(255, 13, 164, 194),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                margin: EdgeInsets.all(10),
                height: 620,
                width: 390,
              ),
            )
          ]),
          Container(
            alignment: Alignment.topLeft,
            child: Text("-Developed by Team Samadhan ,MDG , IITR", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          )
        ])));
  }
}
