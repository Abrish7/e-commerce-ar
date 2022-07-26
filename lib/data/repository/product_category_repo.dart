import 'dart:convert';
import 'package:ecommerce_v3/data/provider/product_category_api.dart';
import 'package:ecommerce_v3/logic/product/category/product_category_cubit.dart';
import 'package:http/http.dart' as http;

import '../model/product_category.dart';

class ProductCategoryRepo {
  late final ProductCategoryApi _productCategoryApi = ProductCategoryApi();

  getProductCategory(emit) {
    try {
      List<ProductCategory> category = [];
      _productCategoryApi.getProductCategory().then((value) async {
        if (value.statusCode == 200) {
          final data = jsonDecode(value.body)['categories'] as List;
          category = await data
              .map((e) => ProductCategory.fromJson({"name": e}))
              .toList();
        }
        print("getting categories..." + category.length.toString());

        emit(ProductCategoryLoaded(category: category));
      });
      return category;
    } catch (e) {
      throw "Error occur";
    }
  }
}
