import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://127.0.0.1:8000";

class Api {
  static Future get(endpointUrl) async {
    var url = baseUrl + endpointUrl;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${GetStorage().read('user')['token']}',
      },
    );
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
