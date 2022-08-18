import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_v3/config.dart';
import 'package:ecommerce_v3/data/model/product_model.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  Future<dynamic> getProduct({required query}) async {
    try {
      final response = await http.post(
        Uri.parse(Configurations().getSearchUrl()),
        body: {'searchString': query},
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      return [];
    }
  }
}
