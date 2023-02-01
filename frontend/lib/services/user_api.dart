import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserApi {
  Future<User> addUser(String email, String password) async {
    var client = http.Client();
    var uri = Uri.parse("http://127.0.0.1:5000/addUser");
    final http.Response response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      var json = response.body;
      return User.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to Save User.');
    }
  }
}
