import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.0.147";

class Api {
  static Future get(endpointUrl) async {
    var url = baseUrl + endpointUrl;
    final response = await http.get(Uri.parse(url));
    return response;
  }

  static Future post(endpointUrl, data) async {
    var url = baseUrl + endpointUrl;
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    return response;
  }

  static Future delete(endpointUrl) async {
    var url = baseUrl + endpointUrl;
    final response = await http.delete(Uri.parse(url));
    return response;
  }

  static patch() {}
}
