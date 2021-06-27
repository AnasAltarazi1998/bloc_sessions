import 'package:bloc_sessions/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyMApp(),
  );
}

class MyMApp extends StatelessWidget {
  const MyMApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: MyApp(),
      theme: appTheme(),
    );
  }
}

ThemeData appTheme() {
  ThemeData appTheme = ThemeData();
  return appTheme.copyWith(
    textTheme: TextTheme(
      bodyText2: TextStyle(
          fontSize: 24,
          color: Colors.indigo,
          fontFamily: 'Iosevka',
          fontWeight: FontWeight.bold),
    ),
    primaryColor: Colors.indigo,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.indigo),
        textStyle: MaterialStateProperty.all(
          TextStyle(
              fontFamily: 'Iosevka', fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
    ),
  );
}
