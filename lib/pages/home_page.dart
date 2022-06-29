import 'package:auth_api/models/user_manager.dart';
import 'package:auth_api/pages/bem_vindo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserManager userManager = UserManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Home Page",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                userManager.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BemVindo(),
                  ),
                );
              },
              child: const Text("Sair"),
            )
          ],
        ),
      ),
    );
  }
}
