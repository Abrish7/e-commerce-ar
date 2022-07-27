import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_v3/data/model/product_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  final getURL = "http://192.168.149.52:3000/api/products/fetch-products";
  final LIMIT = 10;

  Future<List<dynamic>> getProduct({required int page}) async {
    try {
      final response = await http.get(
        Uri.parse(getURL + "/" + page.toString() + "/" + LIMIT.toString()),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      return jsonDecode(response.body)['docs'] as List<dynamic>;
    } catch (e) {
      return [];
    }
  }

  // Future<List<Product>> getProduct() async {
  //   try {
  //     final jsonText = await rootBundle.loadString('assets/json/product.json');
  //     if (jsonText.isNotEmpty) {
  //       final data = jsonDecode(jsonText) as List;
  //       final category = (data.map((e) => Product.fromJson(e)).toList());
  //       return category;
  //     }
  //     return throw Exception('Error occur while reading json file');
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
