import 'package:ecommerce_v3/data/model/cart_model.dart';
import 'package:ecommerce_v3/data/model/product_in_cart.dart';
import 'package:ecommerce_v3/data/provider/cart_api.dart';

class CartRepository {
  final CartApi cartApi;
  CartRepository({required this.cartApi});
  Future<ProductInCart> fetchProductInCart(
      {required customerId, required productId, required quantity}) async {
    final cart = await cartApi.setProductInCart(
        customerId: customerId, productId: productId, quantity: quantity);
    // print(" FROM REPO... " + cart.toString());
    // // final data = ProductInCart.map((e) => Cart.fromJson(e));
    // ProductInCart.fromJson(cart);
    return ProductInCart.fromJson(cart);
  }
}
