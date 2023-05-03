import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class API {
  static Future<dynamic> getRequest(String endpoint) async {
    try {
      var response = await http.get(
        Uri.parse(endpoint),
      );
      final decodedResult = jsonDecode(response.body);
      return decodedResult;
    } on SocketException {
      throw "seems you are offline";
    } catch (error) {
      throw error.toString();
    }
  }
}
