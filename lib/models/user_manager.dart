import 'package:auth_api/models/user.dart';
import 'package:auth_api/repository/login_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager extends ChangeNotifier {
  // User user;
  final LoginRepository _loginRepository = LoginRepository();

  Future<void> signIn({
    required User user,
    required Function onFail,
    required Function onSuccess,
  }) async {
    Map responser = await _loginRepository.fazerLogin(user.email, user.senha);
    if (responser['status'] == 200) {
      String token = responser["token"];
      _tokenSave(token);
      onSuccess();
    } else {
      String message = responser["message"];
      onFail(message);
    }
  }

  void _tokenSave(token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
  }

  Future<bool> verificarLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  void signOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
