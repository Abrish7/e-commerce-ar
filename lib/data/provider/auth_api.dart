import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class AuthApi {
  final String getURL = "http://192.168.149.52:3000/api/customer/login";
  Future<http.Response> signInWithAccount(
      {required email, required password}) async {
    try {
      final response = await http.post(Uri.parse(getURL),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
          }));
      if (response.statusCode == 200) {
        print(response.body);
        return response;
      }
      if (response.statusCode == 422) {
        print(response.body);
        return http.Response("validation error", 422);
      }
      if (response.statusCode == 409) {
        return http.Response("Already exist", 409);
      }
      if (response.statusCode == 401) {
        return http.Response("Incorrect email or password", 401);
      }
      return http.Response("unknown error", 0);
    } catch (e) {
      return http.Response("no connection", 502);
    }
  }
}
