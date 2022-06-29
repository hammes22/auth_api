import 'package:auth_api/models/user_manager.dart';
import 'package:auth_api/pages/home_page.dart';
import 'package:auth_api/pages/login_page.dart';
import 'package:flutter/material.dart';

class BemVindo extends StatefulWidget {
  const BemVindo({Key? key}) : super(key: key);

  @override
  State<BemVindo> createState() => _BemVindoState();
}

class _BemVindoState extends State<BemVindo> {
  UserManager userManager = UserManager();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    userManager.verificarLogin().then(
      (userLogin) {
        userLogin
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              )
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Bem vindo "),
      ),
    );
  }
}
