import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const urlBase = "https://petadopt.onrender.com/";

class HttpService {
  //Modifiqued to return a Future<Map<String, dynamic>>
  Future<Map<String, dynamic>> getAllData(String endpoint) async {
    var response = await http.get(Uri.parse(urlBase + endpoint));
    return convert.jsonDecode(response.body);
  }
}
