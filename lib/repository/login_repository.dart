import 'dart:async';
import 'dart:convert';
import 'package:auth_api/global/environment.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<Map<dynamic, dynamic>> fazerLogin(String email, String senha) async {
    var res = {};

    var response = await http.post(
      Uri.parse(Environment.apiUrl),
      body: {
        "email": email,
        "password": senha,
      },
    );
    if (response.statusCode == 200) {
      String token = json.decode(response.body)['access_token'];
      res["status"] = response.statusCode;
      res["token"] = token;
      return res;
    } else {
      String message = json.decode(response.body)['message'];
      res["status"] = response.statusCode;
      res["message"] = message;
      return res;
    }
  }
}
