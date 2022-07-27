import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/product_category.dart';

class DataService {
  Future<List<ProductCategory>> getProductCategory() async {
    try {
      final jsonText =
          await rootBundle.loadString('assets/json/product_category.json');
      if (jsonText.isNotEmpty) {
        final data = jsonDecode(jsonText) as List;
        final category =
            (data.map((e) => ProductCategory.fromJson(e)).toList());
        return category;
      }
      return throw Exception('Error occur while reading json file');
    } catch (e) {
      rethrow;
    }
  }
}
