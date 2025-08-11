import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';
import 'dart:async';
import 'package:unimar_sab_19/services/localStorageService.dart';

const urlBase = "https://petadopt.onrender.com/";

class HttpService {
  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  final LocalStorageService _localStorageService = LocalStorageService();
  
  HttpService() {
    _initializeAuthToken();
  }
  
  // Inicializa o token de autenticação nos headers padrão
  Future<void> _initializeAuthToken() async {
    String token = await _localStorageService.loadData("token");
    if (token.isNotEmpty) {
      _defaultHeaders['Authorization'] = 'Bearer $token';
    }
  }
  
  // Atualiza o token de autenticação nos headers
  Future<void> updateAuthToken(String token) async {
    if (token.isNotEmpty) {
      _defaultHeaders['Authorization'] = 'Bearer $token';
      await _localStorageService.saveData("token", token);
    }
  }
  
  //Modificado para retornar um Future<Map<String, dynamic>>
  Future<Map<String, dynamic>> getAllData(String endpoint) async {
    try {
      var response = await http.get(
        Uri.parse(urlBase + endpoint),
        headers: _defaultHeaders,
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('A conexão expirou. Verifique sua internet ou o servidor pode estar indisponível.');
        },
      );
      return convert.jsonDecode(response.body);
    } on SocketException catch (e) {
      // Tratamento específico para erros de conexão
      print('Erro de conexão: ${e.message}');
      return {
        'success': false,
        'error': 'Erro de conexão: Verifique sua conexão com a internet',
        'details': e.toString()
      };
    } on TimeoutException catch (e) {
      // Tratamento específico para timeout
      print('Timeout na conexão: ${e.message}');
      return {
        'success': false,
        'error': 'Tempo limite excedido: O servidor está demorando para responder',
        'details': e.toString()
      };
    } catch (e) {
      print('Erro na requisição HTTP: $e');
      return {
        'success': false,
        'error': 'Erro na requisição',
        'details': e.toString()
      };
    }
  }
  
  Future<Map<String, dynamic>> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      var response = await http.post(
        Uri.parse(urlBase + endpoint),
        headers: _defaultHeaders,
        body: convert.jsonEncode(data),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('A conexão expirou. Verifique sua internet ou o servidor pode estar indisponível.');
        },
      );
      return convert.jsonDecode(response.body);
    } on SocketException catch (e) {
      // Tratamento específico para erros de conexão
      print('Erro de conexão: ${e.message}');
      return {
        'success': false,
        'error': 'Erro de conexão: Verifique sua conexão com a internet',
        'details': e.toString()
      };
    } on TimeoutException catch (e) {
      // Tratamento específico para timeout
      print('Timeout na conexão: ${e.message}');
      return {
        'success': false,
        'error': 'Tempo limite excedido: O servidor está demorando para responder',
        'details': e.toString()
      };
    } catch (e) {
      print('Erro na requisição HTTP: $e');
      return {
        'success': false,
        'error': 'Erro na requisição',
        'details': e.toString()
      };
    }
  }
}
