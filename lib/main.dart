import 'package:auth_api/models/user_manager.dart';
import 'package:auth_api/pages/bem_vindo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => UserManager()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'auth',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const BemVindo(),
      ),
    );
  }
}
