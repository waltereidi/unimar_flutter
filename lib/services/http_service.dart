import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const urlBase = "https://randomuser.me/api/?results=10";

class HttpService {
  Future<Map<String, dynamic>> getUserData() async {
    var response = await http.get(Uri.parse(urlBase));

    return convert.jsonDecode(response.body);
  }
}
