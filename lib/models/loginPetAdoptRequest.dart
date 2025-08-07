// credentials.dart
import 'dart:convert';
import 'package:flutter/material.dart';

class Credentials {
  final String email;
  final String password;

  const Credentials({required this.email, required this.password});

  /// Construtor a partir de um Map/JSON
  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );
  }

  /// Converte para Map/JSON
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  /// Converte de uma string JSON
  factory Credentials.fromJsonString(String jsonString) {
    final map = json.decode(jsonString) as Map<String, dynamic>;
    return Credentials.fromJson(map);
  }

  /// Retorna uma cópia com campos substituídos
  Credentials copyWith({String? email, String? password}) {
    return Credentials(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  /// Validações simples
  bool get isEmailValid => RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  bool get isPasswordValid => password.length >= 8;
}
