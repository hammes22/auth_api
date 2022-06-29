import 'dart:convert';

class User {
  String email;
  String senha;
  User({
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'senha': senha,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
