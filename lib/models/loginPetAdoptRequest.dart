// credentials.dart
import 'dart:convert';
import 'package:unimar_sab_19/valueObject/emailAddress.dart';
import 'package:unimar_sab_19/valueObject/password.dart';

class LoginPetAdoptRequest {
  final EmailAddress email;
  final Password password;

  const LoginPetAdoptRequest({required this.email, required this.password});

  String toJsonString() {
    final data = {'email': email.value, 'password': password.value};

    return jsonEncode(data);
  }
}
