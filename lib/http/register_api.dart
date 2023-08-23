import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehicle_details/http/network_helper.dart';

const api = 'http://$ip:$port/api/v1/auth/register';

class RegisterApi {
  static Future<http.Response?> getSignUp(
      String email, String password, String name) async {
    final Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
      "name": name
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    http.Response? response;
    response = await http.post(Uri.parse(api),
        body: jsonEncode(requestBody), headers: headers);
    return response;
  }
}
