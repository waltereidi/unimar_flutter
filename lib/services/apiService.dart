import 'dart:io';

import 'package:unimar_sab_19/interfaces/httpNativeInterface.dart';
import 'package:unimar_sab_19/models/adicionarPetPetAdoptRequest.dart';
import 'package:unimar_sab_19/models/cadastroPetAdoptRequest.dart';
import 'package:unimar_sab_19/models/loginPetAdoptRequest.dart';
import 'package:unimar_sab_19/services/httpNative.dart';
import 'package:unimar_sab_19/services/localStorageService.dart';
import 'package:unimar_sab_19/valueObject/emailAddress.dart';
import 'package:unimar_sab_19/valueObject/password.dart';

class ApiService {
  final HttpNativeInterface httpService;
  Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  ApiService._(this.httpService);

  factory ApiService.getService() {
    var client = HttpClient();
    var httpService = HttpNative(client: client);
    return ApiService._(httpService);
  }
  
  // Método para atualizar os headers padrão
  void updateDefaultHeaders(Map<String, String> newHeaders) {
    defaultHeaders.addAll(newHeaders);
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
    return httpService.fetchPost(url, body, headers: defaultHeaders);
  }

  Future<Map<String, dynamic>> sendLogin(String email, String password) {
    String url = "https://petadopt.onrender.com/user/login";

    LoginPetAdoptRequest request = LoginPetAdoptRequest(
      email: EmailAddress(email),
      password: Password(password),
    );

    String body = request.toJsonString();

    return httpService.fetchPost(url, body, headers: defaultHeaders);
  }

  Future<Map<String, dynamic>> sendCreate(String email, String password) {
    String url = "https://petadopt.onrender.com/pet/create";

    LoginPetAdoptRequest request = LoginPetAdoptRequest(
      email: EmailAddress(email),
      password: Password(password),
    );

    String body = request.toJsonString();

    return httpService.fetchPost(url, body, headers: defaultHeaders);
  }

  Future<Map<String, dynamic>> sendAdicionarPet(
    String nome,
    String peso,
    String cor,
    int idade,
  ) async {
    String url = "https://petadopt.onrender.com/pet/create";

    AdicionarPetPetAdoptRequest request = AdicionarPetPetAdoptRequest(
      name: nome,
      weight: peso,
      color: cor,
      age: idade,
    );
    LocalStorageService localStorageService = LocalStorageService();
    String token = await localStorageService.loadData("token");

    String body = request.toJsonString();

    // Criar uma cópia dos headers padrão e adicionar o token de autorização
    Map<String, String> requestHeaders = Map.from(defaultHeaders);
    requestHeaders['Authorization'] = 'Bearer $token';

    return httpService.fetchPost(url, body, headers: requestHeaders);
  }
}
