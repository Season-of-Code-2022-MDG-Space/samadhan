// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: Container(
          margin: EdgeInsets.all(10),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Users').snapshots(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final userDocs = userSnapshot.data!.docs;
                return ListView.builder(
                    itemCount: userDocs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: ListTile(
                          title: Text(userDocs[index]['Name']),
                          subtitle: Text(userDocs[index]['Phone Number']),
                        ),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
