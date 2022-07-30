import '../model/product_model.dart';
import '../provider/product_filter_by_category_api.dart';

class ProductFilterByCategoryRepo {
  final ProductFilterByCategoryApi productApi;
  ProductFilterByCategoryRepo({required this.productApi});
  Future<List<Product>> fetchProduct(
      {required int page,
      required String category,
      required String subCategory}) async {
    final products = await productApi.getProduct(
        page: page, category: category, subCategory: subCategory);
    print('from repo no = ' + products.length.toString());
    return products.map((e) => Product.fromJson(e)).toList();
  }
}
