import 'dart:io';
import 'package:ecommerce_v3/config.dart';
import 'package:http/http.dart' as http;

class ProductCategoryApi {
  final String getURL =
      "http://192.168.149.52:3000/api/products/fetch-product-category";
  Future<http.Response> getProductCategory({token}) async {
    try {
      final response = await http.get(
        Uri.parse(Configurations().getProductCategory()),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      if (response.body.isNotEmpty) {
        if (response.body.isNotEmpty) {
          return http.Response(response.body, response.statusCode);
        }
      }
      return http.Response("unknown error", 0);
    } catch (e) {
      throw e;
    }
  }
}
