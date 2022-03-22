// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:samadhan/functions/database_crud.dart';

class InternetPage extends StatelessWidget {
  const InternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INTERNET ISSUES',
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/Internet.jpg'),
          opacity: 0.7,
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 15,
            backgroundColor: Color.fromARGB(255, 241, 14, 14),
            shadowColor: Color.fromARGB(255, 102, 100, 97),
            title: Text('INTERNET ISSUES '),
            
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

  @override
  String ilocation = '', icomplaint = '';
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
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a location ';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  ilocation = value!;
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
                  Icons.network_wifi_rounded,
                  color: Color.fromARGB(255, 8, 174, 224),
                ),
                prefixIconColor: Colors.grey,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please write briefly about the issue  ';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  icomplaint = value!;
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
                      await updateIC(icomplaint, ilocation);
                      final snackBar = SnackBar(
                        duration: Duration(seconds: 10),
                        content: const Text('Your Complaint has been registered successfully!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text('SUBMIT'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
