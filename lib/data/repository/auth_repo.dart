import 'dart:convert';
import 'package:ecommerce_v3/data/model/user_model.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import '../provider/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi = AuthApi();
  Future<Object> authenticate({email, password}) async {
    final response =
        await _authApi.signInWithAccount(email: email, password: password);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User(
          id: data["user"]['_id'],
          firstname: data['user']["firstName"],
          lastname: data['user']['lastName'],
          email: data['user']['email'],
          username: data['user']['username'],
          createAt: data['user']['createdAt'],
          updateAt: data['user']['updatedAt'],
          token: data['token']);
    }
    if (response.statusCode == 401) {
      return response;
    }
    if (response.statusCode == 409) {
      return response;
    }
    if (response.statusCode == 422) {
      return response;
    }
    if (response.statusCode == 502) {
      return response;
    }
    return "";
  }
}
