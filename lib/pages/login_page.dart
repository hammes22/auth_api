import 'package:auth_api/helpers/validators.dart';
import 'package:auth_api/models/user.dart';

import 'package:auth_api/models/user_manager.dart';
import 'package:auth_api/pages/bem_vindo.dart';

import 'package:auth_api/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _verSenha = false;
  UserManager userManager = UserManager();

  LoginRepository loginRepository = LoginRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          // padding: EdgeInsets.all(16),

          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                      hintText: "exemplo@email.com",
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return "Digite seu e-mail";
                      } else if (!emailValid(email)) {
                        return "Digite um email valido";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: _senhaController,
                    obscureText: !_verSenha,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      hintText: "Digite sua senha",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_verSenha
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                        onPressed: () {
                          setState(() {
                            _verSenha = !_verSenha;
                          });
                        },
                      ),
                    ),
                    validator: (senha) {
                      if (senha == null || senha.isEmpty) {
                        return "Digite uma senha";
                      } else if (senha.length < 6) {
                        return "6 caracteres no mínimo";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        userManager.signIn(
                          user: User(
                            email: _emailController.text,
                            senha: _senhaController.text,
                          ),
                          onFail: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.redAccent,
                                content: Text(message.toString()),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BemVindo(),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text("Entrar"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
