import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static final StorageUtil _storageUtil = StorageUtil._internal();

  factory StorageUtil.getInstance() {
    return _storageUtil;
  }

  StorageUtil._internal();

  void storeAuth(Object data) async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.setString('registeredUser', jsonEncode(data));
    _sharedPref.setString('initRoute', '/profile');
  }

  Future<String> initRoute() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    return _sharedPref.getString('initRoute') ?? '/home';
  }

  void clean() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.clear();
  }

  Future<dynamic> getAuth() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    return jsonDecode(_sharedPref.get('registeredUser'));
  }
}
