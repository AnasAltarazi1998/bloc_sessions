import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();

  Future<void> _addName({String name}) async {
    CollectionReference names = FirebaseFirestore.instance.collection('names');
    names
        .add({'name': name})
        .then((value) => print('user added'))
        .catchError((error) => print(error));
  }

  double _value = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("data")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: (_value) * 20,
            curve: Curves.fastOutSlowIn,
            height: (_value) * 20,
            duration: Duration(seconds: 5),
            child: Container(
              color: Colors.deepOrange,
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Opacity(
            opacity: _value / 10,
            child: Container(
              color: Colors.indigo,
              child: Text(
                'hello flutter',
              ),
              alignment: Alignment.center,
            ),
          ),
          Slider(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            min: 0,
            max: 10,
            // divisions: 20,
          ),
          Container(
            child: Text(
              'hello flutter',
            ),
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _addName(name: nameController.text),
              child: Container(
                alignment: Alignment.center,
                child: Text('send'),
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
