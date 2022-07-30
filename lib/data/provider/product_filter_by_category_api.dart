import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_v3/config.dart';
import 'package:http/http.dart' as http;

class ProductFilterByCategoryApi {
  // http://localhost:3000/api/products/fetch-products-by-category/Women's Fashion/Shoes/1/5
  final getURL =
      "http://192.168.149.52:3000/api/products/fetch-products-by-category";
  final LIMIT = 10;

  Future<List<dynamic>> getProduct(
      {required int page,
      required String category,
      required String subCategory}) async {
    try {
      final response = await http.get(
        Uri.parse(Configurations().getFilteredProductURL() +
            "/" +
            category +
            "/" +
            subCategory +
            "/" +
            page.toString() +
            "/" +
            LIMIT.toString()),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      return jsonDecode(response.body)['docs'] as List<dynamic>;
    } catch (e) {
      return [];
    }
  }
}
