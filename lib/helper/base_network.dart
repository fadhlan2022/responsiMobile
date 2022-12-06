// Nama : Fadhlan Hisyam
// NIM  : 124200022
// Plug : A

import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static final String baseUrl = "https://copa22.medeiro.tech";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(
      Uri.parse(fullUrl),
    );
    debugPrint("BaseNetwork - response : ${response.statusCode}");
    // debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static Future<List<dynamic>> getList(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;

    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.statusCode}");
    // debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponseList(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  static Future<List<dynamic>> _processResponseList(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return [];
    }
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}