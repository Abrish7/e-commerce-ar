import 'dart:io';
import 'package:ecommerce_v3/config.dart';
import 'package:http/http.dart' as http;

class TagApi {
  Future<http.Response> getTags() async {
    try {
      final response = await http.get(
        Uri.parse(Configurations().getTagUrl()),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      print('tag from api: ' + response.body.toString());
      if (response.body.isNotEmpty) {
        return http.Response(response.body, response.statusCode);
      }
      return http.Response("unknown error", 0);
    } catch (e) {
      throw e;
    }
  }
}
