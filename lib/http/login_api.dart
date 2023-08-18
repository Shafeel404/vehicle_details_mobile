import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vehicle_details/http/network_helper.dart';

const api = 'http://$ip:$port/api/v1/auth/authenticate';

class LoginApi {
  static Future<http.Response?> getLogin(String email, String password) async {
    final Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    http.Response? response;
    response = await http.post(Uri.parse(api),
        body: jsonEncode(requestBody), headers: headers);
    bool networkStatus = NetworkHelper(response).getData();
    if (networkStatus == true) {
      return response;
    } else {
      return null;
    }
  }
}
