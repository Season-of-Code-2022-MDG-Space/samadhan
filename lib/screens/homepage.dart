// ignore_for_file: unused_import, non_constant_identifier_names, prefer_const_constructors,prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:samadhan/screens/personalinfo.dart';
import 'package:samadhan/screens/aboutus.dart';
import 'package:samadhan/functions/authentification.dart';

FirebaseAuth auth = FirebaseAuth.instance;
alertDialog(BuildContext context) {
  // This is the ok button
  Widget Yes = TextButton(
    child: Text("Yes"),
    onPressed: () async {
      await signOut();
      Navigator.pushNamed(context, 'login');
    },
  );
  Widget No = TextButton(
    child: Text("No"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // show the alert dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Do your really want to logout?"),
        actions: [Yes, No],
        elevation: 5,
      );
    },
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 219, 193),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Center(child: Text("Register Your Complain", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white))),
          backgroundColor: Colors.purple,
        ),
        drawer: Container(
          child: Drawer(
              child: ListView(padding: EdgeInsets.zero, children: [
            Container(
              height: 100,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 41, 170, 187),
                ),
                child: Center(child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 25))),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.black, size: 40),
              title: const Text('Personal Information', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'pf');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.report_gmailerrorred_outlined,
            //       color: Colors.red, size: 40),
            //   title: const Text('Report an Issue',
            //       style: TextStyle(
            //           color: Color.fromARGB(255, 0, 0, 0), fontSize: 18)),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                size: 40,
              ),
              title: const Text('About Us', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'au');
              },
            ),
            ListTile(
                leading: Icon(Icons.logout_rounded, color: Colors.blue, size: 40),
                title: const Text('Logout', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18)),
                onTap: () {
                  alertDialog(context);
                }),
          ])),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 99, 95, 95),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    image: DecorationImage(image: AssetImage('assets/images/electricity.jpg'), opacity: 1, fit: BoxFit.fill)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'electricity');
                  },
                  child: Text("Electricity",
                      style: TextStyle(
                        color: Colors.yellow[800],
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      )),
                ),
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 99, 95, 95),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    image: DecorationImage(image: AssetImage('assets/images/plumbing.jpg'), opacity: 1, fit: BoxFit.fill)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'plumbing');
                  },
                  child: Text("Plumbing",
                      style: TextStyle(
                        color: Color.fromARGB(255, 13, 144, 177),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      )),
                ),
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
              ),
            ]),
            Row(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 99, 95, 95),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    image: DecorationImage(image: AssetImage('assets/images/food.jpg'), fit: BoxFit.fill)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'food');
                  },
                  child: Text("Food",
                      style: TextStyle(
                        color: Color.fromARGB(255, 153, 80, 19),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      )),
                ),
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 99, 95, 95),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    image: DecorationImage(image: AssetImage('assets/images/internet.jpg'), opacity: 1, fit: BoxFit.fill)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'internet');
                  },
                  child: Text("Internet",
                      style: TextStyle(
                        color: Color.fromARGB(255, 50, 245, 79),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      )),
                ),
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
              ),
            ]),
            Row(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 99, 95, 95),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    image: DecorationImage(image: AssetImage('assets/images/other.jpeg'), opacity: 1, fit: BoxFit.fill)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'others');
                  },
                  child: Text("Others",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      )),
                ),
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
              ),
            ])
          ]),
        ));
  }
}
