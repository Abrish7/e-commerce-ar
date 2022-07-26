import '../model/product_model.dart';
import '../provider/product_api.dart';

class ProductRepo {
  late final ProductApi _productApi = ProductApi();

  List<Product> getProduct() {
    List<Product> product = [];
    _productApi.getProduct().then((value) {
      if (value.isNotEmpty) {
        value.forEach((element) {
          product.add(element);
        });
      }
    });

    return product;
  }
}
