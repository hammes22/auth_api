import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<Map<dynamic, dynamic>> fazerLogin(String email, String senha) async {
    var res = {};

    var url = Uri.parse("http://192.168.100.21:8000/auth/login");
    var response = await http.post(
      url,
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
