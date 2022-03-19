import 'package:flutter/material.dart';

goBack(BuildContext context) {
  Navigator.pop(context);
}

class PerInf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    goBack(context);
                  }),
              backgroundColor: Color.fromARGB(255, 104, 90, 95),
              title: Center(child: Text("Personal Information")),
            ),
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                      image: DecorationImage(image: AssetImage('assets/images/perinf.jpg'), opacity: 0.75, fit: BoxFit.fill)),
                  margin: EdgeInsets.all(10),
                  height: 150,
                  width: 150,
                ),
              ),
            ]))));
  }
}
