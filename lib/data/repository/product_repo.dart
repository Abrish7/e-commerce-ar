import '../model/product_model.dart';
import '../provider/product_api.dart';

class ProductRepo {
  final ProductApi productApi;
  ProductRepo({required this.productApi});
  Future<List<Product>> fetchProduct({required int page}) async {
    final products = await productApi.getProduct(page: page);
    print('from repo no = ' + products.length.toString());
    return products.map((e) => Product.fromJson(e)).toList();
  }
}
