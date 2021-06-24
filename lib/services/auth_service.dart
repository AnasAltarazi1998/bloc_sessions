import 'dart:convert';

import 'package:bloc_sessions/models/auth_model.dart';
import 'package:bloc_sessions/models/registered_user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<RegisteredUser> authUser(AuthModel auth) async {
    // http.Response response = await http.post(
    //     Uri.parse('http://192.168.137.1:8080/api/v1/auth/signin'),
    //     body: jsonEncode(auth),
    //     headers: {'Content-Type': 'application/json;charset=utf-8'});

    // if (!response.body.startsWith("{")) throw Exception('${response.body}');

    // RegisteredUser registeredUser =
    //     RegisteredUser.fromJson(jsonDecode(response.body));
    // return registeredUser;
    if (auth.email == "java@email" && auth.password == "pass")
      return RegisteredUser(
          id: 1, username: 'java', password: 'pass', email: 'java@email');
    else {
      throw Exception('error...');
    }
  }
}
