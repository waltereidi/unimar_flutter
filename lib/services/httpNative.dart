import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:unimar_sab_19/interfaces/httpNativeInterface.dart';

class HttpNative implements HttpNativeInterface {
  final HttpClient httpClient;

  HttpNative({HttpClient? client}) : httpClient = client ?? HttpClient() {
    // Configurar timeout para evitar que a conexão expire muito rápido
    httpClient.connectionTimeout = const Duration(seconds: 30);
  }

  Future<Map<String, dynamic>> fetchPost(String url, String body, {Map<String, String>? headers}) async {
    try {
      final uri = Uri.parse(url);
      final request = await httpClient.postUrl(uri); // usar POST em vez de GET

      request.headers.set('Content-Type', 'application/json');
      
      // Adicionar headers adicionais se fornecidos
      if (headers != null) {
        headers.forEach((key, value) {
          request.headers.set(key, value);
        });
      }
      
      request.write(body);

      // Definir um timeout para a resposta
      final response = await request.close().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('A conexão expirou. Verifique sua internet ou o servidor pode estar indisponível.');
        },
      );

      final responseBody = await response.transform(utf8.decoder).join();
      return jsonDecode(responseBody);
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
      // Tratamento para outros erros
      print('Erro na requisição HTTP: $e');
      return {
        'success': false,
        'error': 'Erro na requisição',
        'details': e.toString()
      };
    }
  }
}
