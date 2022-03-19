import 'package:flutter/material.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({Key? key}) : super(key: key);

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  @override
  String complaint = '';
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/lionlogo.jpg'),
          opacity: 0.7,
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Internet Issues',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 21, 153, 170),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 410,
                  height: 300,
                  child: TextFormField(
                    key: const ValueKey('complaint'),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return 'This field cannot be left blank';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        complaint = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Complaint',
                      fillColor: const Color.fromARGB(255, 77, 75, 75),
                      hintText: 'Enter Your Complaint',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'registered');
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 24),
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
