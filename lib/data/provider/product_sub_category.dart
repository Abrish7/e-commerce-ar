import 'dart:io';
import 'package:http/http.dart' as http;

class ProductSubCategoryApi {
  final String getURL =
      "http://192.168.149.52:3000/api/products/fetch-product-subcategory/";
  Future<http.Response> getProductSubCategory({required category}) async {
    try {
      final response = await http.get(
        Uri.parse(getURL + category),
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
