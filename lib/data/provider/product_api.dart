import 'dart:convert';

import 'package:ecommerce_v3/data/model/product_model.dart';
import 'package:flutter/services.dart';

class ProductApi {
  Future<List<Product>> getProduct() async {
    try {
      final jsonText = await rootBundle.loadString('assets/json/product.json');
      if (jsonText.isNotEmpty) {
        final data = jsonDecode(jsonText) as List;
        final category = (data.map((e) => Product.fromJson(e)).toList());
        return category;
      }
      return throw Exception('Error occur while reading json file');
    } catch (e) {
      rethrow;
    }
  }
}
