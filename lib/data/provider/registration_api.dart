import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class RegistrationApi {
  final String getURL = "http://192.168.149.52:3000/api/customer/signup";

  Future<String> createUser(
      {required String firstname,
      required String lastname,
      required String username,
      required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      final response = await http.post(Uri.parse(getURL),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(<String, String>{
            'firstName': firstname,
            'lastName': lastname,
            'email': email,
            'username': username,
            'password': password,
            'confirm_password': confirmPassword
          }));

      if (response.statusCode == 200) {
        print("successfully added!");
        return response.statusCode.toString();
      } else if (response.statusCode == 422) {
        print("validation error!");
        return response.statusCode.toString();
      } else if (response.statusCode == 409) {
        print("user already exist");
        return response.statusCode.toString();
      } else {
        return "";
      }
    } catch (e) {
      print("No Internet Connection");
      return "502";
    }
  }
}
