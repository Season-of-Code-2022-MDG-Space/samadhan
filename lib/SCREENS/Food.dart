import 'package:flutter/material.dart';

//void main() => runApp(const MyApp());

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOOD ISSUES',
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/food1.png'),
          opacity: 0.7,
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 15,
            backgroundColor: Color.fromARGB(255, 241, 11, 69),
            shadowColor: Color.fromARGB(255, 102, 100, 97),
            title: Text('FOOD ISSUES '),
            //centerTitle: true,
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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          TextFormField(
            maxLines: null,
            // expands: true,
            decoration: InputDecoration(
              labelText: 'LOCATION',
              //labelstyle: ,
              fillColor: Colors.grey.shade500,
              hintText: 'Mess/Canteen/Cafe',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15)),
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
          ),
          SizedBox(
            height: 90,
          ),
          TextFormField(
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'COMPLAINT',
              //labelstyle: ,
              fillColor: Colors.grey.shade500,
              hintText: ' Enter complaint',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15)),
              errorStyle: TextStyle(color: Colors.red),
              prefixIcon: Icon(
                Icons.emoji_food_beverage_rounded,
                color: Color.fromARGB(255, 224, 248, 8),
              ),
              prefixIconColor: Colors.grey,
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please write briefly about the issue  ';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 41, 9, 221)),
                ),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text('Concern Noted!'),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('SUBMIT '),
              ),
            ),
          )
        ],
      ),
    );
  }
}
