import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: FutureBuilder(
                  future: downloadImage(),
                  builder: (context, snapshot) => snapshot.hasData
                      ? snapshot.data
                      : LinearProgressIndicator(
                          backgroundColor: Colors.indigo,
                          color: Colors.black,
                        ),
                ),
              ),
              Container(
                child: Text('Hello World'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.getImage(source: ImageSource.camera);
                  File file = File(pickedFile.path);
                  await FirebaseStorage.instance
                      .ref(
                        'imgs/${basename(file.path)}',
                      )
                      .putFile(file);
                },
                child: Text('upload image'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            CollectionReference users =
                FirebaseFirestore.instance.collection('users');
            // await users.get().then((q) {
            //   q.docs.forEach((element) {
            //     print('${element.data()}');
            //   });
            // });
            users.add({'home': 'syria', 'phone_number': '123435546'});
          },
          child: Icon(Icons.send),
        ),
      ),
    );
  }

  Future<Widget> downloadImage() async {
    String url = await FirebaseStorage.instance
        .ref('imgs/64a7cd5d-f029-47b3-bf37-1ec6a64901125055148032628595775.jpg')
        .getDownloadURL();
    return Image.network(url);
  }
}
