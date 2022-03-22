// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:samadhan/functions/database_crud.dart';

class PlumbingPage extends StatelessWidget {
  const PlumbingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PLUMBING ISSUES',
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/plumbing.jpg'),
          opacity: 1,
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 15,
            backgroundColor: Color.fromARGB(255, 11, 188, 241),
            shadowColor: Color.fromARGB(255, 102, 100, 97),
            title: Text('PLUMBING ISSUES '),
          ),
          body: const MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String plocation = '', pcomplaint = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'LOCATION',
                fillColor: Colors.grey.shade500,
                hintText: 'Room No & Bhavan name/Location in campus',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                errorStyle: TextStyle(color: Colors.red),
                prefixIcon: Icon(Icons.add_location),
                prefixIconColor: Colors.grey,
              ),
              validator: (value) {
                if (value == '') {
                  return 'Please enter a location ';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  plocation = value!;
                });
              },
            ),
            SizedBox(
              height: 90,
            ),
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'COMPLAINT',
                fillColor: Colors.grey.shade500,
                hintText: ' Enter your complaint',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                errorStyle: TextStyle(color: Colors.red),
                prefixIcon: Icon(
                  Icons.water_drop_sharp,
                ),
                prefixIconColor: Colors.blue,
              ),
              validator: (String? value) {
                if (value == '') {
                  return 'Please write briefly about the issue  ';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  pcomplaint = value!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 41, 9, 221)),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await updatePC(pcomplaint, plocation);
                      final snackBar = SnackBar(
                        duration: Duration(seconds: 10),
                        content: const Text('Your Complaint has been registered successfully!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text('SUBMIT '),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
