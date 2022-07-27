import 'dart:io';
import 'package:http/http.dart' as http;

class ProductCategoryApi {
  final String getURL =
      "http://192.168.149.52:3000/api/products/fetch-product-category";
  Future<http.Response> getProductCategory({token}) async {
    try {
      final response = await http.get(
        Uri.parse(getURL),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      // final jsonText = await rootBundle.loadString('assets/json/product.json');
      if (response.body.isNotEmpty) {
        if (response.body.isNotEmpty) {
          return http.Response(response.body, response.statusCode);
        }
        // if (response.statusCode == 422) {
        //   print(response.body);
        //   return response;
        // }
        // if (response.statusCode == 409) {
        //   return http.Response("Already exist", 409);
        // }
        // if (response.statusCode == 401) {
        //   return http.Response("Incorrect email or password", 401);
        // }
      }
      return http.Response("unknown error", 0);
    } catch (e) {
      throw e;
      // return http.Response("no connection", 502);
    }
  }
  // Fut
  // ure<List<ProductCategory>> getProductCategory() async {
  //   try {
  //     final jsonText =
  //         await rootBundle.loadString('assets/json/product_category.json');
  //     if (jsonText.isNotEmpty) {
  //       final data = jsonDecode(jsonText) as List;
  //       final category = data.map((e) => ProductCategory.fromJson(e)).toList();
  //       return category;
  //     }
  //     return throw Exception('Error occur while reading json file');
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
