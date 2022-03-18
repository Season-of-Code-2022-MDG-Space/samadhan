// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, annotate_overrides, unused_import
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:samadhan/functions/authentification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:samadhan/functions/database_crud.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final _formkey = GlobalKey<FormState>();
  bool _itshidden = true;
  String remailid = '';
  String rpassword = '';
  String rconfirmpassword = '';
  String name = '';
  String enrolmentno = '';
  String bhawan = '';
  String phone = '';
  bool isLoggedIn = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SIGN UP!',
          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, fontFamily: 'Roboto'),
        ),
        backgroundColor: Color.fromARGB(255, 71, 151, 188),
      ),
      body: Form(
        key: _formkey, //key for form
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/translogo.jpg'), fit: BoxFit.fill, opacity: 0.5),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  key: ValueKey('name'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Name cannot be left blank';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      name = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    //labelstyle: ,
                    fillColor: Colors.grey.shade500,
                    hintText: 'Enter Your Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    errorStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  key: ValueKey('enrolno'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enrolment Number cannot be left blank';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      enrolmentno = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enrolment Number',
                    fillColor: Colors.grey.shade500,
                    hintText: 'Enter Your Enrolment Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    errorStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.list),
                    prefixIconColor: Colors.grey,
                  ),
                ), //Enrollment number
                SizedBox(height: 10),
                TextFormField(
                  key: ValueKey('phone'),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Phone number cannot be left blank';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      phone = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    fillColor: Colors.grey.shade500,
                    hintText: 'Enter Your Phone Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    errorStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  key: ValueKey('bhawan'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Bhawan cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      name = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Bhawan',
                    //labelstyle: ,
                    fillColor: Colors.grey.shade500,
                    hintText: 'Enter Your Bhawan name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    errorStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.home),
                    prefixIconColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  key: ValueKey('emailid'),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      remailid = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.grey.shade500,
                    hintText: 'Enter Your Email Id',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    errorStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  key: ValueKey('pass'),
                  obscureText: _itshidden,
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Password cannot be left blank';
                    } else if (value.toString().length < 6) {
                      return 'Password is too short. Enter at least 6 characters';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      rpassword = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.grey.shade500,
                    hintText: 'Enter Your Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    errorStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.vpn_key),
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
                TextFormField(
                  textInputAction: TextInputAction.done,
                  key: ValueKey('confirmpass'),
                  obscureText: _itshidden,
                  //ASkkk
                  validator: (value) {
                    if (rconfirmpassword.compareTo(rpassword) != 0) {
                      return "Entered passwords do not match";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      rconfirmpassword = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    fillColor: Colors.grey.shade500,
                    hintText: 'Enter Your Password again',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(15)),
                    errorStyle: TextStyle(color: Colors.red),
                    prefixIcon: Icon(Icons.vpn_key),
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
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      signup(remailid, rpassword);
                      create(name, name, remailid, bhawan, phone, enrolmentno);
                      // 'Name': name,
                      // 'Email Id': emailid,
                      // 'Bhawan Name': bhawan,
                      // 'Enrolment Number': enrolmentno,
                      // 'Phone Number': phone,)
                      //.then((value) => print('User has been added successfully'));
                      final snackBar = SnackBar(
                        content: const Text('Signing up Successful!'),
                        action: SnackBarAction(
                          label: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Text(
                    'Already Have An Account? Login!',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
