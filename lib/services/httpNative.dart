import 'dart:io';
import 'dart:convert';

class HttpNative {
  final HttpClient httpClient;

  HttpNative({HttpClient? client}) : httpClient = client ?? HttpClient();

  Future<Map<String, dynamic>> fetchPost(String url, String body) async {
    final uri = Uri.parse(url);
    final request = await httpClient.postUrl(uri); // usar POST em vez de GET

    request.headers.set('Content-Type', 'application/json');
    request.write(body);

    final response = await request.close();

    final responseBody = await response.transform(utf8.decoder).join();
    return jsonDecode(responseBody);
  }
}
