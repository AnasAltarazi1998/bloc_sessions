import 'package:bloc_sessions/login.dart';
import 'package:bloc_sessions/profile.dart';
import 'package:bloc_sessions/util/local_cred.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageUtil storageUtil = StorageUtil.getInstance();
  String home = await storageUtil.initRoute();
  runApp(MyApp(home: home));
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.home}) : super(key: key);
  String home;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: home,
      routes: {'/home': (_) => Login(), '/profile': (_) => Profile()},
    );
  }
}
