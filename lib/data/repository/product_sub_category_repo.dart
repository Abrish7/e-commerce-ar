import 'dart:convert';
import 'package:ecommerce_v3/data/model/product_sub_category.dart';
import 'package:ecommerce_v3/data/provider/product_sub_category.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

import '../../logic/sub_category/sub_category_cubit.dart';

class ProductSubCategoryRepo {
  late final ProductSubCategoryApi _productSubCategoryApi =
      ProductSubCategoryApi();

  getProductSubCategory(emit, category) {
    try {
      List<ProductSubCategory> subCategory = [];
      _productSubCategoryApi
          .getProductSubCategory(category: category)
          .then((value) async {
        if (value.statusCode == 200) {
          final data = jsonDecode(value.body)['subCategory'] as List;
          print("incoming " + data.toString());
          subCategory =
              await data.map((e) => ProductSubCategory.fromJson(e)).toList();
          print("getting sub category..." + subCategory.length.toString());
          emit(ProductSubCategoryLoaded(subCategory: subCategory));
        }
      });
      return subCategory;
    } catch (e) {
      throw "Error occur";
    }
  }
}
