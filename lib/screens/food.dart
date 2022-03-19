// ignore_for_file: unnecessary_const, prefer_const_constructors, override_on_non_overriding_member, unused_field, annotate_overrides

import 'dart:html';

import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  String complaint = '';
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Issues'),
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              child: Text('Describe '),
            )
          ],
        ),
      ),
    );
  }
}
