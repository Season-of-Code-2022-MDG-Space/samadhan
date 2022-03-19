// ignore_for_file: unnecessary_const, prefer_const_constructors, override_on_non_overriding_member, annotate_overrides, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:samadhan/functions/database_crud.dart';
import 'package:samadhan/screens/register.dart';

class OtherPage extends StatefulWidget {
  //String value;

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  CollectionReference complaints = FirebaseFirestore.instance.collection('Other Complaints');

  String Icomplaint = '', Fcomplaint = '', Pcomplaint = '', Ecomplaint = '', Ocomplaint = '';
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: const DecorationImage(
          image: const AssetImage('assets/images/other.jpeg'),
          opacity: 1,
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Other Issues',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
            ),
          ),
          elevation: 15,
          backgroundColor: Colors.deepOrange[500],
          shadowColor: Color.fromARGB(255, 102, 100, 97),
          //backgroundColor: const Color.fromARGB(255, 21, 153, 170),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    width: 350,
                    height: 300,
                    //margin: EdgeInsets.symmetric(),
                    child: TextFormField(
                      key: const ValueKey('complaint'),
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                      expands: true,
                      validator: (value) {
                        if (value == '') {
                          return 'This field cannot be left blank';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          Ocomplaint = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your Complaint here',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                        errorStyle: TextStyle(color: Colors.red),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      // await createIC(
                      // );
                      //await update(docName, Icomplaint, Fcomplaint, Pcomplaint, Ecomplaint, Ocomplaint)
                      await update("Chinmay Nagpal", Icomplaint, Fcomplaint, Pcomplaint, Ecomplaint, Ocomplaint);
                      final snackBar = SnackBar(
                        duration: Duration(days: 1),
                        content: const Text('Your Complaint has been registered successfully!'),
                        action: SnackBarAction(
                          label: 'HomePage',
                          onPressed: () {
                            Navigator.pushNamed(context, 'homepage');
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 24),
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
