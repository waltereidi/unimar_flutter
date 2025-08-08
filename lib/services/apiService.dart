import 'dart:io';

import 'package:unimar_sab_19/interfaces/httpNativeInterface.dart';
import 'package:unimar_sab_19/models/cadastroPetAdoptRequest.dart';
import 'package:unimar_sab_19/models/loginPetAdoptRequest.dart';
import 'package:unimar_sab_19/services/httpNative.dart';
import 'package:unimar_sab_19/valueObject/emailAddress.dart';
import 'package:unimar_sab_19/valueObject/password.dart';

class ApiService {
  final HttpNativeInterface httpService;

  ApiService._(this.httpService);

  factory ApiService.getService() {
    var client = HttpClient();
    var httpService = HttpNative(client: client);
    return ApiService._(httpService);
  }

  Future<Map<String, dynamic>> sendCadastro(
    String name,
    EmailAddress email,
    String phone,
    Password password,
    Password confirmPassword,
  ) {
    String url = "https://petadopt.onrender.com/user/register";
    CadastroPetAdoptRequest request = CadastroPetAdoptRequest(
      name: name,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );

    String body = request.toJsonString();
    return httpService.fetchPost(url, body);
  }

  Future<Map<String, dynamic>> login(String email, String password) {
    String url = "https://petadopt.onrender.com/user/login";

    LoginPetAdoptRequest request = LoginPetAdoptRequest(
      email: EmailAddress(email),
      password: Password(password),
    );

    String body = request.toJsonString();

    return httpService.fetchPost(url, body);
  }
}
